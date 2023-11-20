//
//  MediaView.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 18/11/23.
//

import SwiftUI

struct MediaView: View {
    let media: Media
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(.white)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1.2)
                .frame(width: 80, height: 80)
            Image(systemName: media.title)
        }
    }
}

#Preview {
    MediaView(media: Media(title: "mic"))
}
