//
//  AuthenticationStore.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Foundation
import Firebase

class AuthenticationStore : ObservableObject {
    @Published private var loggedInUser: String?

    var isSignedIn: Bool {
        loggedInUser != nil
    }

    func emailIsValid(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }

    func passwordIsValid(_ password: String) -> Bool {
        password.count > 5
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let result = result, error == nil else {
                print("Error: \(error!)")
                return
            }

            self?.loggedInUser = result.user.uid
        }
    }
}
