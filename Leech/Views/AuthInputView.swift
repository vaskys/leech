//
//  AuthInputView.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import SwiftUI

struct AuthInputView: View {
    @EnvironmentObject var user:UserAuthVM
    
    let title: String
    let button_label: String
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            Text(title)
                .frame(alignment: .trailing)
            
            TextField("Email", text: $user.email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $user.password)
                .textFieldStyle(.roundedBorder)
            Button  {
                //action
                guard let a = action else { return }
                a()
               
            } label: {
               Text(button_label)
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.red)
            .clipShape(Capsule())
            
        }
    }
}

struct AuthInputView_Previews: PreviewProvider {
    static var previews: some View {
        AuthInputView(title: "title test", button_label: "button label")
            .environmentObject(UserAuthVM())
    }
}
