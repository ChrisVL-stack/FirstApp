//
//  Text1.swift
//  FirstApp
//
//  Created by Christian Vladimir Garzón Gallardo on 14/09/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text("Hello, World!").font(.headline)
            Text("Custom").font(.system(
                size: 40, weight: .light, design: .monospaced))
            .italic().bold()
            .underline()
            .foregroundColor(.blue)
            .background(.purple)
        Text("ariismdms sndfkjsndkjfns fsjdnfkjsdnf ksnbdkjcnbskdjbc")
            .frame(width: 200)
            .lineLimit(2)
            .lineSpacing(10.28)
        }
    }
}

#Preview {
    TextExample()
}
