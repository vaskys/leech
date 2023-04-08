//
//  UserAuthVM.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import Firebase

@MainActor
final class UserAuthVM: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() {
        
    }
    
    func register() {
        Task {
            do {
                let user = try await AuthManger.manager.register(email: email, password: password)
                print("Registed Succes")
                print(user)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func clear() {
        email = ""
        password = ""
    }
    
    
}
