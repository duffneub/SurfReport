//
//  AppTextFieldStyle.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import SwiftUI

extension View {
    func textFieldStyle<Style : ViewModifier>(_ style: Style) -> some View {
        modifier(style)
    }
}

struct AppTextFieldStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(fieldBackgroundColor))
    }

    // MARK: - View Constants

    let height: CGFloat = 50
    private let cornerRadius: CGFloat = 8
    private let fieldBackgroundColor = Color(.tertiarySystemGroupedBackground)
}
