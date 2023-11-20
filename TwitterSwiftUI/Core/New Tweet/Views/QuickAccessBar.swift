//
//  QuickAccessBar.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 18/11/23.
//

import SwiftUI

struct QuickAccessBar: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "waveform")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "photo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("GIF")
                .font(.custom("Helvetica Neue", size: 8))
                .foregroundStyle(.blue)
                .frame(width: 14, height: 10, alignment: .center)
                .padding(13)
                .overlay(
                    Rectangle()
                    .stroke(.blue, lineWidth: 6)
                    .cornerRadius(5.0)
                    .padding(6)
                )
            
            Image(systemName: "checklist")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "drop")
                .imageScale(.large)
                .rotationEffect(Angle(degrees: 180))
                .foregroundStyle(.tint)
        }
    }
}
