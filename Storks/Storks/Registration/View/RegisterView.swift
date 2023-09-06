//
//  RegisterView.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    
    @State private var registrationSuccessful = false
    
    var body: some View {
        VStack {
            if !registrationSuccessful {
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Register") {
                    viewModel.registerUser { success in
                        if success {
                            registrationSuccessful = true
                        }
                    }
                }
                .padding()
            } else {
                ProfileCompletionView(user: $viewModel.user)
            }
        }
        .padding()
    }
}
