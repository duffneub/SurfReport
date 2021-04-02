//
//  AppButtonStyle.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import SwiftUI

struct AppButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(configuration.isPressed ? Color.accentColor.opacity(0.8) : .accentColor))
    }

    // MARK: - View Constants

    private let height: CGFloat = 50
    private let cornerRadius: CGFloat = 8
}
