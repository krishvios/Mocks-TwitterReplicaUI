//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 02/11/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private var viewModel = ProfileViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.blue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }

                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay {
                    Circle().stroke(.gray, lineWidth: 0.75)
                }
            
            Button(action: {}, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .frame(width: 120, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 0.75)
                    }
            })
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Vivek ANSK")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@vivekansk")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Hail God.")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Hyderabad, India")
                }
                Spacer()
                HStack {
                    Image(systemName: "link")
                    Text("https://www.google.co.in")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
        }
        .padding(.horizontal)

    }
    
    var tweetFilterBar : some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
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
        }
        .padding(.vertical)

    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                /*
                ForEach(0 ... 9, id: \.self) { _ in
                     TweetRowView()
                        .padding()
                }
                 */
                
                ForEach(viewModel.posts, id: \.self) { post in
                    TweetRowView(post: post)
                        .padding()
                }
            }
        }
    }
}
