//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by Jungjin Park on 2024-04-22.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("mytext") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(38)
            .font(.largeTitle)
    }
}
