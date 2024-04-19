//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

// Codable 로 정의를 해 놓으면 JSONDecoder 에서 해당 구조체의 배열로 할당이 됨
struct User: Codable {
    let login: String
    let avatar_url: URL
}
struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
}
// actor 는 중간에 방해받지 않도록 thread 에서 분리 시켜놓은 코드
// actor 는 복잡한 상황에서 한가지의 실행흐름만 가질 수 있도록 정리해주는 역할을 실행
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
// 메인 thread에 알려주도록 @MainActor로 ViewModel을 지정
// 프로그램 전체에서 엑세스할 수 있도록
@MainActor
class GithubViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var user: User?
    @Published var error: Error?
    
    let githubService = GithubService()
    
    func fetchData(username: String) async {
        do {
            error = nil
            async let fetchRepositoriesResult = githubService.fetchRepositories(username: username)
            async let fetchUserResult = githubService.fetchUser(username: username)
            repositories = try await fetchRepositoriesResult
            user = try await fetchUserResult
        } catch {
            self.error = error
        }
    }
}
struct ContentView: View {
    @State private var username = "canadaprogrammer"
    @StateObject private var viewModel = GithubViewModel()
    var body: some View {
        VStack {
            TextField("Github username:", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Fetch Data") {
                // 별도의 thread에서 작동
                Task.detached {
                    await viewModel.fetchData(username: username)
                }
            }
            
            if let user = viewModel.user {
                AsyncImage(url: user.avatar_url) { image in
                    image.resizable()
                } placeholder: {
                    // 이미지도 비동기로 가져오
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                
                Text(user.login)
                    .font(.title)
            }
            List(viewModel.repositories) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.description ?? "No description")
                        .font(.subheadline)
                }
            }
            if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
            }
        }
    }
    
}
#Preview {
    ContentView()
}
