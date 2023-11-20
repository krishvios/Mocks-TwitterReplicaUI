//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 02/11/23.
//

import SwiftUI
import AVFoundation

struct TweetRowView: View {
    var post: Post?
    @State private var commentCount = 1
    @State private var likeCount = 1
    @State private var retweetCount = 1
    @State private var impressionsCount = 1
    
    @State private var commentedByYou = false
    @State private var likedByYou = false
    @State private var retweetedByYou = false
    @State private var bookMarkedByYou = false
    
    @State var videoPost: Bool = false
    @State var photoPost: Bool = false
    @State var textPost: Bool = false
    
//    @State var player: AVPlayer? // = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=")!)
    
    var body: some View {
        VStack(alignment: .leading) {
            // profile image + user info + tweet
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: (post?.profilePhoto!)!)!) { photo in
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 56, height: 56)
                        .padding(.leading, 10)
                        .padding(.trailing, -15)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }
                VStack {
                    HStack(alignment: .top, spacing: 12) {
                        // user info & tweet caption
                        VStack(alignment: .leading, spacing: 4) {
                            // User info
                            HStack {
                                Text(post!.profileName)
                                    .font(.subheadline).bold()
                                Text("@vivekansk")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline).bold()
                                Text("2w")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline).bold()
                            }
                            
                            // Tweet caption
                            Text(post!.text/*"Peace will prevail around the World after the Socio-Political Reforms."*/)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            // Action Buttons
                        }
                    }
                    
                    HStack(spacing: 50) {
                        Image(systemName: "bubble.left")
                            .font(.subheadline)
                            .symbolEffect(.bounce.up, value: commentCount)
                            .onTapGesture {
                                commentedByYou = true
                                commentCount += 1
                            }
                            .symbolRenderingMode(.hierarchical)
                            .symbolEffect(.bounce, value: commentCount)
                        
                        Image(systemName: "arrow.2.squarepath")
                            .font(.subheadline)
                            .symbolEffect(.bounce.up, value: retweetCount)
                            .onTapGesture {
                                retweetCount += 1
                                retweetedByYou.toggle()
                            }
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(retweetedByYou ? .green : .gray)
                            .symbolEffect(.bounce, value: retweetCount)
                        
                        Image(systemName: likedByYou ? "heart.fill" : "heart")
                            .font(.subheadline)
                            .symbolEffect(.scale.up.wholeSymbol)
                            .onTapGesture {
                                likeCount += 1
                                likedByYou.toggle()
                            }
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(likedByYou ? .red : .gray)
                            .symbolEffect(.bounce, value: likeCount)
                        
                        Image(systemName: "chart.bar.xaxis")
                            .font(.subheadline)
                            .symbolRenderingMode(.hierarchical)
                        
                        HStack(spacing: 7) {
                            Image(systemName: bookMarkedByYou ? "bookmark.fill" : "bookmark")
                                .font(.subheadline)
                                .onTapGesture {
                                    bookMarkedByYou.toggle()
                                }
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(bookMarkedByYou ? .blue : .gray)
                            
                            Image(systemName: "square.and.arrow.up")
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    .foregroundColor(.gray)
                }
            }
            .overlay {
                Divider().offset(x: 0, y: 46)
            }
        }
        .onAppear {
            if post?.type == Constants.video {
                videoPost = true
            } else if post?.type == Constants.photo {
                photoPost = true
            }
        }
    }
}

#Preview {
    TweetRowView()
}

