//
//  AuthenticationStore.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Foundation

class AuthenticationStore : ObservableObject {
    @Published var isSignedIn: Bool = false

    func emailIsValid(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }

    func passwordIsValid(_ password: String) -> Bool {
        password.count > 5
    }

    func signIn(email: String, password: String) {
        isSignedIn = true
    }
}
