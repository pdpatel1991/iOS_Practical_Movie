//
//  MovieDetailVC.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import UIKit

class MovieDetailVC: UIViewController {

    var objMovie: MovieModel!
    var vmMovieDetail = MovieDetailVM()

    class public func getMovieDetailVC() -> MovieDetailVC {
        return Storyboard.Main.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = objMovie.title ?? ""
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        
        vmMovieDetail.intMovieID = objMovie.id ?? 0
        self.getMovieDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setTheme()
    }

    //MARK:- Assign theme color to view
    func setTheme() {
        self.view.backgroundColor = Theme.Color.BackgroundColor
    }
    
    func assignValues(objMovieDetail: MovieDetailModel) {
        
    }
    
    //MARK:- API calling for get the movie list
    func getMovieDetail() {
        self.showActivity()
        vmMovieDetail.getMovieDetail { movieDetail in
            DispatchQueue.main.async {
                self.dismissActivity()
                if movieDetail != nil {
                    self.assignValues(objMovieDetail: movieDetail!)
                }
            }
        }
    }
}
