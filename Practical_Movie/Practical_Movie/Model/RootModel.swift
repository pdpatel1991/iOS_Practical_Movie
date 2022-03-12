//
//  RootModel.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import ObjectMapper

class RootModel: Mappable {
    var page : Int?
    var results : [[String: Any]]?
    var total_pages : Int?
    var total_results : Int?

    required init?(map: Map) {
    }

    init() {
    }
    
    func mapping(map: Map) {
        page         <- map["page"]
        results       <- map["results"]
        total_pages       <- map["total_pages"]
        total_results       <- map["total_results"]
    }
}
