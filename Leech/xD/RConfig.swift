//
//  RConfig.swift
//  Leech
//
//  Created by Samo Vaský on 13/04/2023.
//

import Foundation
import Firebase
import FirebaseRemoteConfig
import FirebaseRemoteConfigSwift

class RConfig {
    private var api_key: String;
    private var fall_back_api_key: String;
    
    public static let config = RConfig();
    
    init() {
        self.api_key = "AIzaSyAXQRc8OlWQf_fKuuE4bNpa72XviTNeUUI";
        self.fall_back_api_key = "AIzaSyALyayVGqqcQXG9CAjdA5Zgl_LZG7sfyeU";
    }
    
    func fetch_config() {
        Task {
            do{
                let remote_config = RemoteConfig.remoteConfig()
                let settings = RemoteConfigSettings()
                settings.minimumFetchInterval = 0
                remote_config.configSettings = settings
                
                let config = try await remote_config.fetchAndActivate()
                switch config {
                case .successFetchedFromRemote :
                    self.api_key = remote_config.configValue(forKey: "api_key").stringValue ?? self.api_key
                    self.api_key = remote_config.configValue(forKey: "fall_back_api_key").stringValue ?? self.fall_back_api_key
                case .successUsingPreFetchedData:
                    self.api_key = remote_config.configValue(forKey: "api_key").stringValue ?? self.api_key
                    self.api_key = remote_config.configValue(forKey: "fall_back_api_key").stringValue ?? self.fall_back_api_key
                default:
                    print("error")
                }
                print("Toto je api key \(self.api_key) \n")
                print("Toto je fall_back_api key \(self.fall_back_api_key)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func get_api_key() -> String {
        return self.api_key;
    }
    
    func get_fall_back_api_key() -> String {
        return self.fall_back_api_key;
    }
}

