//
//  FirstTabView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-19.


import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappear trigger")
                title = "View One Again"
            })
            // task 는 클로저 블럭이 async로 정의되어 있음
            // 뷰가 실행될 때 실행
            .task(priority: .background) {
                print("task triggered")
                title = await changeTitle()
            }
    }
    func changeTitle() async -> String {
        sleep(5)
        return "Async taks complete"
    }
}

#Preview {
    FirstTabView()
}
