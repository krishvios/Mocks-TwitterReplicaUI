//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 03/11/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("478")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            HStack(spacing: 4) {
                Text("2.3M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
