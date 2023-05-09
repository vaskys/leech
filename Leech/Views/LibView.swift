//
//  LibView.swift
//  Leech
//
//  Created by Samo Vaský on 16/04/2023.
//

import SwiftUI

@MainActor
final class VM: ObservableObject {
    @Published var hodnoty = []
    
    func nieco() -> Void {
        //
    }
    
    func get_data() -> Void {
        //
    }
}

struct LibView: View {
    @StateObject var vm = VM()
    
    var body: some View {
        VStack {
            Button("KLIK") {
                vm.nieco()
            }
        }
    }
}

struct LibView_Previews: PreviewProvider {
    static var previews: some View {
        LibView()
    }
}
