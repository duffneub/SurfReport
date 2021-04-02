//
//  SurfReportApp.swift
//  SurfReport
//
//  Created by Duff Neubauer on 3/26/21.
//

import SwiftUI

@main
struct SurfReportApp: App {
    @StateObject private var authStore = AuthenticationStore()

    var body: some Scene {
        WindowGroup {
            Text("Logged In!")
                .popover(isPresented: shouldShowSignIn()) {
                    SignInView()
                        .environmentObject(authStore)
                        .buttonStyle(AppButtonStyle())
                }
        }
    }

    private func shouldShowSignIn() -> Binding<Bool> {
        .init(get: { !authStore.isSignedIn }, set: { authStore.isSignedIn = !$0 })
    }
}
