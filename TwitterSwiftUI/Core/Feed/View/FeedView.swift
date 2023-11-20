//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 02/11/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @State private var selectionFilter: FeedViewModelType = .foryou
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    private var viewModel = FeedViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    tweetFilterBar
                    
                    
                    ForEach(viewModel.posts, id: \.self) { post in
                        TweetRowView(post: post)
                            .padding()
                    }
                    
//                    ForEach(viewModel.lines, id: \.self)  { line in
                    
//                    ForEach(0 ... viewModel.posts.count, id: \.self) { post in
//                        TweetRowView(post: post)
//                            .padding()
//                    }
                    /*
                    ForEach(0 ... 20, id: \.self) { _ in
                        TweetRowView()
                            .padding()
                    }
                     */
                }
            }
            Button(action: {
                showNewTweetView.toggle()
                print("Show new Tweet view...")
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20,height: 20)
                    .padding()
            })
            .frame(width: 70,height: 70)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView,  content: {
                NewTweetView()
                    .padding()
            })
        }
        .onAppear {
            viewModel.getData()
        }
    }
}

extension FeedView {
    var tweetFilterBar : some View {
        HStack {
            ForEach(FeedViewModelType.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundStyle(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundStyle(Color.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(Color.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectionFilter = item
                    }
                }
            }
        }
        .overlay {
            Divider().offset(x: 0, y: 16)
                .frame(width: 400)
        }
//        .padding(.vertical)
    }
}

#Preview {
    FeedView()
}
