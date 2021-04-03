//
//  AuthenticationStore.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Combine
import Foundation

class AuthenticationStore : ObservableObject {
    @Published private var userID: String?
    @Published var signInError: Error?

    var isSignedIn: Bool {
        userID != nil
    }

    private let service: AuthenticationService
    private var subscriptions = Set<AnyCancellable>()

    init(service: AuthenticationService) {
        self.service = service
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
        service
            .signIn(withEmail: email, password: password)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.signInError = error
                }
            } receiveValue: { [weak self] uid in
                self?.userID = uid
            }
            .store(in: &subscriptions)
    }
}
