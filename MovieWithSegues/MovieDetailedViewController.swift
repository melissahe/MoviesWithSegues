//
//  MovieDetailedViewController.swift
//  MovieWithSegues
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class MovieDetailedViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieActorsLabel: UILabel!
    @IBOutlet weak var movieDesciptionView: UITextView!
    
    //the view controller will pass info to this property "movie"
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //now we can use this property that now has a value passed in, to change the properties of the IB Outlets!
        movieImageView.image = UIImage(named: movie.posterImageName)
        movieNameLabel.text = movie.name
        movieYearLabel.text = "\(movie.year)"
        movieActorsLabel.text = movie.cast.joined(separator: ", ")
        movieDesciptionView.text = movie.description
    }

}
