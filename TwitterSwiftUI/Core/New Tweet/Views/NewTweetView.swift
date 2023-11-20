//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 04/11/23.
//

import SwiftUI

struct NewTweetView: View {
    
    enum FocusedField {
        case tweetText
    }
    
    let viewModel = NewTweetViewModel()
    
    @State private var caption = ""
    @FocusState private var focusedField: FocusedField?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.blue)
                })
                Spacer()
                Button(action: {
                    print("Post")
                    dismiss()
                }, label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
                .disabled(caption.isEmpty ? true : false)
                .opacity(caption.isEmpty ? 0.6 : 1.0)
            }
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.blue)
                TextArea("What's happening?", text: $caption)
                    .focused($focusedField, equals: .tweetText)
            }
            VStack(alignment: .leading) {
                if caption.isEmpty {
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.newTweetImages, id: \.self) {
                                MediaView(media: $0)
                            }
                        }
                    }
                    .overlay {
                        Divider().offset(x: 0, y: 48)
                            .frame(width: 400)
                    }
                }
                Spacer(minLength: 1)
                HStack {
                    Image(systemName: "globe.central.south.asia.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Everyone can reply")
                }
                .overlay {
                    Divider().offset(x: 0, y: 22)
                        .frame(width: 600)
                }
                QuickAccessBar()
                    .frame(height: 30)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//            .KeyboardAwarePadding()
        }
        .onAppear {
            focusedField = .tweetText
        }
    }
}

#Preview {
    NewTweetView()
}
