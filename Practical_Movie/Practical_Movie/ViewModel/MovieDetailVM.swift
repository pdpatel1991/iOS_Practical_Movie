//
//  MovieDetailVM.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import ObjectMapper

class MovieDetailVM: NSObject {
    var intMovieID = 0
    
    func getMovieDetail(completion: @escaping (MovieDetailModel?)->()) {
        print("requestURL:- \(WebAPI.baseAPIURL)movie/\(intMovieID)/?api_key=\(WebAPI.APIKey)")
        var request = URLRequest(url: URL(string: "\(WebAPI.baseAPIURL)movie/\(intMovieID)?api_key=\(WebAPI.APIKey)")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print("response:- \(String(data: data!, encoding: String.Encoding.utf8)!)")
            
            if error == nil {
                guard let movieDetail = Mapper<MovieDetailModel>().map(JSONString: String(data: data!, encoding: String.Encoding.utf8)!) else {
                    completion(nil)
                    return
                }
                completion(movieDetail)
            } else {
                completion(nil)
                DispatchQueue.main.async {
                    APP_DELEGATE.navController.visibleViewController?.showAlertWithTitle(title: CommonMessage.GeneralAlertTitle.rawValue, message: error?.localizedDescription ?? CommonMessage.SomethingWorngOnServer.rawValue, options: "OK")
                }
            }
        })
        task.resume()
    }
}
