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
   @StateObject private var auth = UserAuthVM()
    
    var body: some View {
        VStack {
            auth.view_selector
        }
        .environmentObject(auth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
