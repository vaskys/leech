//
//  AImageView.swift
//  Leech
//
//  Created by Samo Vaský on 14/04/2023.
//

import SwiftUI

struct AImageView: View {
    let url_string: String
    let overlay_string: String
    
    var body: some View {
        AsyncImage(url: URL(string: url_string)) { data in
            if let img = data.image {
            img
                .resizable()
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .bottomTrailing) {
                    Text(overlay_string)
                        .foregroundColor(.white)
                        .padding()
                }
            } else if data.error != nil {
            Image("logo")
                .resizable()
                .frame(height: 250)
                .frame(maxWidth: .infinity)
            } else {
            ProgressView()
                .padding()
            }
        }
    }
}

struct AImageView_Previews: PreviewProvider {
    static var previews: some View {
        AImageView(url_string: "",overlay_string: "")
    }
}
