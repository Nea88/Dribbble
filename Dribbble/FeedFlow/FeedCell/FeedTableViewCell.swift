//
//  FeedTableViewCell.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var shotTitleLabel: UILabel!
    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotDescriptionLabel: UILabel!
    
    var shot: Shot! {
        didSet {
            if shot == nil { return }
            shotTitleLabel.text = shot.title
            shotDescriptionLabel.text = shot.shotDescription
            let imageUrl = URL(string: shot.images.hidpi ?? shot.images.normal)
            shotImageView.kf.setImage(with: imageUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
