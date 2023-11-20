//
//  SideMenuView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 03/11/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Vivek ANSK")
                        .font(.headline)
                    
                    Text("@vivekansk")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id:  \.self) { menuItem in
                if menuItem == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuRowOptionView(viewModel: menuItem)
                    }
                } else if menuItem == .logout {
                    Button {
                        print("Logout")
                    } label: {
                        SideMenuRowOptionView(viewModel: menuItem)
                    }

                } else {
                    SideMenuRowOptionView(viewModel: menuItem )
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

#Preview {
    SideMenuView()
}
