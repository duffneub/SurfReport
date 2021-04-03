//
//  AuthenticationService.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Combine

protocol AuthenticationService {
    func signIn(withEmail email: String, password: String) -> AnyPublisher<String, Error>
}
