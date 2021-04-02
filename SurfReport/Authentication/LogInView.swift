//
//  LogInView.swift
//  SurfReport
//
//  Created by Duff Neubauer on 3/26/21.
//

import SwiftUI

class LogInViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    let primaryWelcomeText: String = "Welcome back!"
    let secondaryWelcomeText: String = "Login to continue."

    let emailPlaceholder: String = "Email"
    let passwordPlaceholder: String = "Password"

    let logInText: String = "Log In"

    func logIn() {
        print("Log In: \(email), \(password)")
    }

    var logInDisabled: Bool {
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
}

struct LogInView: View {
    @StateObject private var viewModel = LogInViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.primaryWelcomeText)
                    .font(.title)
                Text(viewModel.secondaryWelcomeText)
                    .font(.title)
                    .foregroundColor(.secondary)
            }

            VStack {
                Group {
                    TextField(viewModel.emailPlaceholder, text: $viewModel.email)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                    SecureField(viewModel.passwordPlaceholder, text: $viewModel.password)

                }
                .styleTextField(SurfReportTextFieldStyle())
            }

            Button(viewModel.logInText, action: viewModel.logIn)
                .buttonStyle(SurfReportButtonStyle(isDisabled: viewModel.logInDisabled))

        }
        .padding()
    }

    // MARK: - View Constants

    let height: CGFloat = 50
    let cornerRadius: CGFloat = 8
    let fieldBackgroundColor = Color(.tertiarySystemGroupedBackground)
}

extension View {
    func styleTextField<Style : ViewModifier>(_ style: Style) -> some View {
        modifier(style)
    }
}

struct SurfReportTextFieldStyle : ViewModifier {
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

struct SurfReportButtonStyle : ButtonStyle {
    let isDisabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .disabled(isDisabled)
            .padding()
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(isDisabled ? .secondary : .accentColor))
    }

    // MARK: - View Constants

    private let height: CGFloat = 50
    private let cornerRadius: CGFloat = 8
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
