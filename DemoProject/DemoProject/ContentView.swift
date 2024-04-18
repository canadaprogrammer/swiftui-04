//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            HStack {
                Group {
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                }
                Group {
                    
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
