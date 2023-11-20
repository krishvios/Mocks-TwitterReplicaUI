//
//  SideMenuRowOptionView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 04/11/23.
//

import SwiftUI

struct SideMenuRowOptionView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundStyle(.gray)
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundStyle(.black)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuRowOptionView(viewModel: .profile)
}
