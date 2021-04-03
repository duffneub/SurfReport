//
//  FirebaseAuth.swift
//  SurfReport
//
//  Created by Duff Neubauer on 4/2/21.
//

import Combine
import Firebase

class FirebaseAuth : AuthenticationService {
    func signIn(withEmail email: String, password: String) -> AnyPublisher<String, Error> {
        Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard let result = result, error == nil else {
                    promise(.failure(error!))
                    return
                }

                promise(.success(result.user.uid))
            }
        }
        .eraseToAnyPublisher()
    }
}
