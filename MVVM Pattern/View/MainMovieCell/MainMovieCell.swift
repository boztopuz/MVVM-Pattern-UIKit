//
//  MainMovieCell.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 3.06.2023.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get{
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        backView.addBorder(color: .label, width: 1)
        backView.round()
        
        movieImageView.round(5)
    }
    
    func setUpCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
