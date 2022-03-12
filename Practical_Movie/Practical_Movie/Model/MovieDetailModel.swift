//
//  MovieDetailModel.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import ObjectMapper

class MovieDetailModel: Mappable {
    var adult : Bool?
    var backdrop_path : String?
    var release_date : String?
    var poster_path : String?
    var overview : String?
    var languages : [Languages]?
    
    required init?(map: Map) {
    }

    init() {
    }
    
    func mapping(map: Map) {
        adult         <- map["adult"]
        backdrop_path       <- map["backdrop_path"]
        release_date       <- map["release_date"]
        poster_path       <- map["poster_path"]
        overview       <- map["overview"]
        languages       <- map["spoken_languages"]
    }
}

class Languages: Mappable {
    var english_name : String?
    var iso_639_1 : String?
    var name : String?
    
    required init?(map: Map) {
    }

    init() {
    }
    
    func mapping(map: Map) {
        english_name         <- map["english_name"]
        iso_639_1       <- map["iso_639_1"]
        name       <- map["name"]
    }
}
