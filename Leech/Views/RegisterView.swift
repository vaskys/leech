//
//  RegisterView.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user:UserAuthVM
    
    var body: some View {
            VStack {
                AuthInputView(title: "Enter Your Register Info", button_label: "Register") {
                    user.register()
                }
            }
            .padding()
            .navigationTitle("Register")
       
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserAuthVM())
    }
}
