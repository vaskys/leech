//
//  HomeVIew.swift
//  Leech
//
//  Created by Samo Vaský on 07/04/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: UserAuthVM
    
    var body: some View {
        VStack {
            Text("Welcome \(auth.get_logged_user().email)")
        }
    }
}

struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
