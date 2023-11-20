//
//  TextArea.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 04/11/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            TextEditor(text: $text)
                .padding(4)
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.placeholder)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
        })
        .font(.body)
    }
}

#Preview {
    TextArea("", text: .constant(""))
}
