//
//  Constant.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import UIKit

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate

struct WebAPI {
    static let APIKey = "14bc774791d9d20b3a138bb6e26e2579"
    static let baseAPIURL = "https://api.themoviedb.org/3/"
    static let basePosterImageURL = "https://image.tmdb.org/t/p/w200"
    static let baseCoverImageURL = "https://image.tmdb.org/t/p/w500"
}

struct Theme {
    struct Color {
        static let BackgroundColor = UIColor(red: 18.0/255.0, green: 25.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        static let White = UIColor.white
    }
}

struct Storyboard {
    static let Main = UIStoryboard(name: "Main", bundle: nil)
}

enum CommonMessage: String {
    case SomethingWorngOnServer = "Unable to connect the server. Check your connection and try again later!"
    case GeneralAlertTitle = "Network error"
}
