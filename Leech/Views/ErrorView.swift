//
//  ErrorView.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import SwiftUI

struct ErrorView: View {
    let error_msg: String 
    
    var body: some View {
        VStack {
            Text(error_msg)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error_msg: "RlyTho")
    }
}
