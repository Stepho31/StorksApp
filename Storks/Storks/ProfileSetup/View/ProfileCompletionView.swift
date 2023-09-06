//
//  ProfileCompletionView.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import SwiftUI

struct ProfileCompletionView: View {
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var location: String = ""
    @State private var numberOfChildren: String = ""
    @State private var bio: String = ""
    
    @Binding var user: User?
    
    var body: some View {
        Form {
            Section(header: Text("Complete Your Profile")) {
                TextField("Name", text: $name)
                TextField("Age", text: $age)
                TextField("Gender", text: $gender)
                TextField("Location", text: $location)
                TextField("Number of Children", text: $numberOfChildren)
                TextEditor(text: $bio)
                    .frame(height: 100)
                    .overlay(
                        Group {
                            if bio.isEmpty {
                                Text("Bio")
                                    .foregroundColor(Color.gray)
                                    .padding(.leading, 5)
                            }
                        }
                        
                    )
                
                Button("Save Profile") {
                    if var user = self.user {
                        if let ageInt = Int(age), let numberOfChildrenInt = Int(numberOfChildren) {
                            user.name = name
                            user.age = ageInt
                            user.gender = gender
                            user.location = location
                            user.parentalStatus = ParentalStatus(numberOfChildren: numberOfChildrenInt, agesOfChildren: [])
                            user.bio = bio
                            
                            AuthService.updateUserProfile(user: user) { success, error in
                                if success {
                                    print("Successfully updated user profile.")
                                    self.user = user
                                } else {
                                    if let error = error {
                                        print("Error updating user profile: \(error.localizedDescription)")
                                    }
                                }
                            }
                        } else {
                            print("Age and Number of Children must be integers.")
                        }
                    }
                }
            }
        }
    }
}
