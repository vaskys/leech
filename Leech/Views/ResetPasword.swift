//
//  ResetPasword.swift
//  Leech
//
//  Created by Samo Vaský on 09/04/2023.
//

import SwiftUI

struct ResetPasword: View {
    @EnvironmentObject var user:UserAuthVM
    var body: some View {
        VStack {
            AuthInputView(title: "Enter Your Email", button_label: "Reset",type: -1) {
                user.reset_password()
            }
        }
        .padding()
        .navigationTitle("Register")
    }
}

struct ResetPasword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasword()
            .environmentObject(UserAuthVM())
    }
}
