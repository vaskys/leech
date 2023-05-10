//
//  LibVM.swift
//  Leech
//
//  Created by Samo Vaský on 10/05/2023.
//

import Foundation

@MainActor
class LibVM : ObservableObject {
    @Published var lib_vid = [String:Video]()
    @Published var selected_segment = 0
    @Published var autori = [String:Int]()
    
    @Published var posledne_videa = [Video]()
    
    func remve_from_lib(video: Video) {
        update_autor(key: video.author)
        lib_vid.removeValue(forKey: video.videoId)
    }
    
    func add_to_lib(video: Video) {
        lib_vid[video.videoId] = video
        
        posledne_videa.append(video)
        if posledne_videa.count >= 5 {
            posledne_videa.remove(at: 0)
        }
        
        if check_autori(key: video.author) {
            autori[video.author]! += 1
        }
        else {
            autori[video.author] = 1
        }
    }
    
    func check_video(video: Video) -> Bool {
        guard let _ = lib_vid[video.videoId] else {
            return false
        }
        return true
    }
    
    private func check_autori(key: String) -> Bool {
        guard let _ = autori[key] else {
            return false
        }
        return true
    }
    
    private func update_autor(key: String) {
        if var autor_hodnota = autori[key] {
            autor_hodnota -= 1
            if(autor_hodnota <= 0) {
                autori[key] = nil
            } else {
                autori[key] = autor_hodnota
            }
        }
    }
    
    func get_autor_videa(key: String) -> Array<Video> {
        var videa = [Video]()
        if(check_autori(key: key)) {
            lib_vid.forEach {
                if $0.value.author == key {
                    videa.append($0.value)
                }
            }
        }
        return videa.sorted { $0.title.lowercased() < $1.title.lowercased()}
    }
    
    func get_posledne_videa() -> Array<Video> {
        return posledne_videa.reversed()
    }
    
    func get_videa() -> Array<Video> {
        var videa = [Video]()
        videa = Array(lib_vid.values).sorted { $0.title.lowercased() < $1.title.lowercased()}
        return videa
    }
}
