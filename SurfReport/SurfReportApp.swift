//
//  SurfReportApp.swift
//  SurfReport
//
//  Created by Duff Neubauer on 3/26/21.
//

import SwiftUI
import Firebase

@main
struct SurfReportApp: App {
    @StateObject private var authStore = AuthenticationStore()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            Text("Logged In!")
                .popover(isPresented: .constant(!authStore.isSignedIn)) {
                    SignInView()
                        .environmentObject(authStore)
                        .buttonStyle(AppButtonStyle())
                        .alert(isPresented: .constant(authStore.signInError != nil)) {
                            Alert(
                                title: Text("Failed to Sign In"),
                                message: Text(authStore.signInError!.localizedDescription),
                                dismissButton: nil)
                        }
                }
        }
    }
}
