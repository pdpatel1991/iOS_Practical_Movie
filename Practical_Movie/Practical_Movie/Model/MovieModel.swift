//
//  MovieModel.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import ObjectMapper

class MovieModel: Mappable {
    var id : Int?
    var title : String?
    var release_date : String?
    var poster_path : String?
    var overview : String?
    
    required init?(map: Map) {
    }

    init() {
    }
    
    func mapping(map: Map) {
        id         <- map["id"]
        title       <- map["title"]
        release_date       <- map["release_date"]
        poster_path       <- map["poster_path"]
        overview       <- map["overview"]
    }
}
