//
//  LogInView.swift
//  SurfReport
//
//  Created by Duff Neubauer on 3/26/21.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Welcome back!")
                    .font(.title)
                Text("Login to continue.")
                    .font(.title)
                    .foregroundColor(.secondary)
            }

            VStack {
                Group {
                    TextField(
                        "Email",
                        text: $email
                    )
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .padding()
                        .frame(height: height)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .foregroundColor(fieldBackgroundColor))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(height: height)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .foregroundColor(fieldBackgroundColor))
                }
            }

            Button("Login", action: login)
                .accentColor(.white)
                .disabled(loginDisabled)
                .padding()
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(loginDisabled ? .gray : .accentColor))
        }
        .padding()
    }

    private func login() {
        print("Login: \(email), \(password)")
    }

    private var loginDisabled: Bool {
        !(emailIsValid && passwordIsValid)
    }

    private var emailIsValid: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }

    private var passwordIsValid: Bool {
        password.count > 5
    }

    // MARK: - View Constants

    let height: CGFloat = 50
    let cornerRadius: CGFloat = 8
    let fieldBackgroundColor = Color(.tertiarySystemGroupedBackground)
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
