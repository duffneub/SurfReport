//
//  SignInView.swift
//  SurfReport
//
//  Created by Duff Neubauer on 3/26/21.
//

import SwiftUI

struct SignInView : View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var authStore: AuthenticationStore

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Welcome back!")
                    .font(.title)
                Text("Sign In to continue.")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 50)

            VStack {
                Group {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)

                }
                .textFieldStyle(AppTextFieldStyle())
            }
            .padding(.bottom, 25)

            Button("Sign In", action: signIn)
                .disabled(signInButtonDisabled)
                

        }
        .padding()
    }

    // MARK: - Access Model

    var signInButtonDisabled: Bool {
        !(authStore.emailIsValid(email) && authStore.passwordIsValid(password))
    }

    // MARK: - Update Model

    func signIn() {
        authStore.signIn(email: email, password: password)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthenticationStore())
            .buttonStyle(AppButtonStyle())
    }
}
