//
//  RegisterViewModel.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import Foundation
import Combine
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: User?
    
    func registerUser(completion: @escaping (Bool) -> Void) {
        AuthService.registerUser(email: email, password: password) { (user, error) in
            if let user = user {
                self.user = user
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
