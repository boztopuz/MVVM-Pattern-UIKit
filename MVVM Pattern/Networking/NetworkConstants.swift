//
//  NetworkConstants.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 1.06.2023.
//

import Foundation

class NetworkConstants {
    
    public static var shared : NetworkConstants = NetworkConstants()
    
    private init(){
        
    }
    
    public var apiKey: String{
        get{
            return "cbe4fb052aaccf8e0f6b21317e7f456b"
        }
    }
    
    public var serverAddress: String {
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
