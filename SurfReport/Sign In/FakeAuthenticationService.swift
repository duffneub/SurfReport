//
//  FakeAuthenticationService.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Combine

class FakeAuthenticationService : AuthenticationService {
    func signIn(withEmail email: String, password: String) -> AnyPublisher<String, Error> {
        Just("").setFailureType(to: Error.self).eraseToAnyPublisher()
    }


}
