//
//  KeyboardAwareModifier.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 18/11/23.
//

import SwiftUI
import Combine

//struct KeyboardAwareModifier: ViewModifier {
//    typealias Body = Never
//    
//    @State private var keyboardHeight: CGFloat = 0
//
//    private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
//        Publishers.Merge(
//            NotificationCenter.default
//                .publisher(for: UIResponder.keyboardWillShowNotification)
//                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
//                .map { $0.cgRectValue.height },
//            NotificationCenter.default
//                .publisher(for: UIResponder.keyboardWillHideNotification)
//                .map { _ in CGFloat(0) }
//       ).eraseToAnyPublisher()
//    }
//
//    func body(content: Content) -> some View {
//        content
//            .padding(.bottom, keyboardHeight)
//            .onReceive(keyboardHeightPublisher) { self.keyboardHeight = $0 }
//    }
//}
//
//extension View {
//    func KeyboardAwarePadding() -> some View {
//        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
//    }
//}
