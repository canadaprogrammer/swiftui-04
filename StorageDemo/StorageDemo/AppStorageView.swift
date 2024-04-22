//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by Jungjin Park on 2024-04-22.
//


import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") private var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor (text: $editorText)
            .padding(38)
            .font(.largeTitle)
    }
}
