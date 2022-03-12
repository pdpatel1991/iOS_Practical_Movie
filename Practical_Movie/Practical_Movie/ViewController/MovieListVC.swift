//
//  ViewController.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import UIKit

class MovieListVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var vmMovieList = MovieListVM()
    var arrMovies = [MovieModel]()
    
    class public func getMovieListVC() -> MovieListVC {
        return Storyboard.Main.instantiateViewController(withIdentifier: "MovieListVC") as! MovieListVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Movie List"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        self.getMovieList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setTheme()
    }

    //MARK:- Assign theme color to view
    func setTheme() {
        self.view.backgroundColor = Theme.Color.BackgroundColor
    }
    
    //MARK:- API calling for get the movie list
    func getMovieList() {
        self.showActivity()
        vmMovieList.getMovieList(completion: { movies in
            self.arrMovies = movies
            DispatchQueue.main.async {
                self.dismissActivity()
                self.tblView.reloadData()
            }
        })
    }
}

extension MovieListVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let strIdentifier = "MovieListCell"
        var cell: MovieListCell! = tableView.dequeueReusableCell(withIdentifier: strIdentifier) as? MovieListCell
        
        if cell == nil {
            tableView.register(UINib(nibName: strIdentifier, bundle: nil), forCellReuseIdentifier: strIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: strIdentifier) as? MovieListCell
        }
        cell.setTheme()
        cell.selectionStyle = .none
        cell.objMovie = arrMovies[indexPath.row]
        cell.reloadCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let controller = PostDetailImageViewController.getPostDetailImageVC()
//        controller.objPost = arrPost[indexPath.row]
//        APP_DELEGATE.navController.pushViewController(controller, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            if vmMovieList.isAllMovieFound == false
            {
                vmMovieList.intCurrentPage += 1
                self.getMovieList()
            }
        }
    }
}

