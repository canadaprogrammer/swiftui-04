//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct User: Codable {
    let login: String
    let avatar_url: URL
}
struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
}

actor GithubService {
    func fetchRepositories(username: String) async throws -> [Repository] {
        let url = URL(string: "https://api.github.com/users/\(username)/repos")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Repository].self, from: data)
    }
    func fetchUser(username: String) async throws -> User {
        let url = URL(string: "https://api.github.com/users/\(username)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(User.self, from: data)
    }
}

struct ContentView: View {
    @State private var username = "canadaprogrammer"
    @State private var repositories: [Repository] = []
    @State private var user: User?
    let githubService = GithubService()
    
    var body: some View {
        VStack {
            TextField("Github username:", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Fetch Data") {
                Task {
                    do {
                        async let fetchRepositoriesResult = githubService.fetchRepositories(username: username)
                        async let fetchUserResult = githubService.fetchUser(username: username)
                        repositories = try await fetchRepositoriesResult
                        user = try await fetchUserResult
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }
            
            if let user = user {
                AsyncImage(url: user.avatar_url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                
                Text(user.login)
                    .font(.title)
            }
            List(repositories) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.description ?? "No description")
                        .font(.subheadline)
                }
            }
            
            Button("Fetch Data in Background") {
                Task.detached {
                    do {
                        let service = GithubService() // detached 여서 githubService를 사용 못하고 안에서 함수 선언을 다시함
                        try await withThrowingTaskGroup(of: Void.self) { group in
                            group.addTask {
                                repositories = try await service.fetchRepositories(username: username)
                            }
                            group.addTask {
                                user = try await service.fetchUser(username: username)
                            }
                            try await group.waitForAll()
                        }
                    } catch {
                        DispatchQueue.main.async {
                            print("\(error)")
                        }
                    }
                }
            }
        }
    }
    
}
#Preview {
    ContentView()
}
