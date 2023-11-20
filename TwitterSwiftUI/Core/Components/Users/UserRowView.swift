//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 02/11/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text("vivekansk")
                    .font(.subheadline).bold()
                
                Text("Vivek ANSK")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserRowView()
}
