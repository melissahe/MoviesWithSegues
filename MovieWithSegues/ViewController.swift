//
//  ViewController.swift
//  MovieWithSegues
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies: [Movie] = []
    
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       movieTableView.delegate = self
        movieTableView.dataSource = self
        movies = MovieData.movies
        movieTableView.estimatedRowHeight = 200
        movieTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get the new view controller using segue.destination
        if let destinationVC = segue.destination as? MovieDetailedViewController {
            
            //pass the selected object to the new view controller
            
            //find the current movie that was selected
                //tableView.indexPathForSelectedRow gives you the cell you clicked on, .row gives you the row of that cell, and now you can use that number as the index of the movies array, they both are zero-indexed, so it works
            let selectedRow = movieTableView.indexPathForSelectedRow!.row
            let selectedMovie = movies[selectedRow]
            
            //passes our selected movie info to the movie property of the destination VC
                //we only change the properties
                //we NEVER want to change any of the UI elements in the VC we are going to (like IBOutlets and Actions and stuff) - we CANNOT pass info to the UI elements because they don't exist yet at this point, all of the IB Outlets are optional, they only exist after the segue is complete
                //so we pass to an existing property in the destination view controller (VC)
            destinationVC.movie = selectedMovie
        }
    }
    
    //data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell")!
        
        let rowToSetUp = indexPath.row
        let currentMovie = movies[rowToSetUp]
        
        if let cell = cell as? MovieCustomTableViewCell {
            cell.movieTitleLabel.text = currentMovie.name
            cell.movieImageView.image = UIImage(named: currentMovie.posterImageName)
            cell.movieDescriptionLabel.text = currentMovie.description
            return cell
        }
        
        return cell
    }
    
}

