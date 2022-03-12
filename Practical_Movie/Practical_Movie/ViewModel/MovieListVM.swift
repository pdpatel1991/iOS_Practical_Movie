//
//  MovieListVM.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import ObjectMapper

class MovieListVM: NSObject {
    var intCurrentPage = 1
    var isAllMovieFound = false
    var arrMovieList = [MovieModel]()

    func getMovieList(completion: @escaping ([MovieModel])->()) {
        var request = URLRequest(url: URL(string: "\(WebAPI.baseAPIURL)discover/movie?api_key=\(WebAPI.APIKey)&page=\(intCurrentPage)")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print("response:- \(String(data: data!, encoding: String.Encoding.utf8)!)")
            
            if error == nil {
                guard let root = Mapper<RootModel>().map(JSONString: String(data: data!, encoding: String.Encoding.utf8)!) else {
                    completion(self.arrMovieList)
                    return
                }
                if let arrList = root.results {
                    let movies = Mapper<MovieModel>().mapArray(JSONArray: arrList)
                    if self.arrMovieList.count > 0 {
                        self.arrMovieList += movies
                    } else {
                        self.arrMovieList = movies
                    }
                    
                    if self.arrMovieList.count == root.total_results {
                        self.isAllMovieFound = true
                    } else {
                        self.isAllMovieFound = false
                    }
                    completion(self.arrMovieList)
                }
                else {
                    completion(self.arrMovieList)
                }
            } else {
                completion(self.arrMovieList)
                DispatchQueue.main.async {
                    APP_DELEGATE.navController.visibleViewController?.showAlertWithTitle(title: CommonMessage.GeneralAlertTitle.rawValue, message: error?.localizedDescription ?? CommonMessage.SomethingWorngOnServer.rawValue, options: "OK")
                }
            }
        })
        task.resume()
    }
}
