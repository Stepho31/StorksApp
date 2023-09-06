//
//  AuthService.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import Foundation
import Firebase

class AuthService {
    static func registerUser(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let authResult = authResult {
                let user = User(id: authResult.user.uid, email: authResult.user.email ?? "", name: "", age: 0, gender: "", location: "", parentalStatus: ParentalStatus(numberOfChildren: 0, agesOfChildren: []), profilePictures: [], bio: "")
                completion(user, nil)
            }
        }
    }
    
    static func updateUserProfile(user: User, completion: @escaping (Bool, Error?) -> Void) {
          let db = Firestore.firestore()
          
          db.collection("users").document(user.id).setData([
              "id": user.id,
              "email": user.email,
              "name": user.name,
              "age": user.age,
              "gender": user.gender,
              "location": user.location,
              "parentalStatus": [
                  "numberOfChildren": user.parentalStatus.numberOfChildren,
                  "agesOfChildren": user.parentalStatus.agesOfChildren
              ] as [String : Any],
              "profilePictures": user.profilePictures,
              "bio": user.bio
          ]) { error in
              if let error = error {
                  completion(false, error)
              } else {
                  completion(true, nil)
              }
          }
      }
}
