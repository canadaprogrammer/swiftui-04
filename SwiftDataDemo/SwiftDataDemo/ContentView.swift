//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Jungjin Park on 2024-04-22.
//

import SwiftUI
import SwiftData

@Model
class Task {
    var id: UUID
    var title: String
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var tasks: [Task]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.completed {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    func addTask() {
        let newTask = Task(title: "Task #\(tasks.count + 1)")
        modelContext.insert(newTask)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self)
}
