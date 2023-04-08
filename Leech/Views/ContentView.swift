//
//  ContentView.swift
//  Leech
//
//  Created by Samo Vaský on 04/04/2023.
//
import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State var logged_in: Bool = false
    
    var body: some View {
        if logged_in {
            HomeView()
        } else {
            LoginView(logged_in: $logged_in)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
