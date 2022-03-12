//
//  MovieListCell.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var imgViewMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblSeperator: UILabel!
    
    var objMovie: MovieModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTheme()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTheme() {
        lblTitle.textColor = Theme.Color.White
        lblDate.textColor = Theme.Color.White
        lblDescription.textColor = Theme.Color.White
        lblSeperator.backgroundColor = Theme.Color.White
    }
    
    func reloadCell() {
        imgViewMovie.setImage("https://image.tmdb.org/t/p/w200\(objMovie.poster_path ?? "")")
        lblTitle.text = objMovie.title ?? ""
        lblDate.text = objMovie.release_date ?? ""
        lblDescription.text = objMovie.overview ?? ""
    }
}
