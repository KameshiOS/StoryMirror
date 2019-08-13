//
//  RecommendedCollectionViewCell.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var genre3View: ViewDesign!
    @IBOutlet weak var genre2View: ViewDesign!
    @IBOutlet weak var genre1View: ViewDesign!
    @IBOutlet weak var genre3Label: UILabel!
    @IBOutlet weak var genre2Label: UILabel!
    @IBOutlet weak var genre1Label: UILabel!
    @IBOutlet weak var promoMSGLabel: UITextView!
    @IBOutlet weak var readTimeLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    
    func updateView(book: Book) {
        bookTitleLabel.text = book.title
        viewsLabel.text = "\(book.viewCount!)"
        followerCountLabel.text = "\(book.followerCount!)"
        readTimeLabel.text = "\(book.readTime!)"
        promoMSGLabel.text = book.promoMsg
        bookImage.sd_setImage(with: URL(string: API.imageURL.appending("\(book.id!).jpg")), completed: nil)
        if book.genre!.count > 3 || book.genre!.count == 3 {
            // Don't hide
            genre1View.isHidden = false
            genre2View.isHidden = false
            genre3View.isHidden = false
            genre1Label.text = book.genre![0]
            genre2Label.text = book.genre![1]
            genre3Label.text = book.genre![2]
            let more = book.genre!.count - 3
            if more != 0 {
                moreLabel.text = "+\(more) More"
            } else {
                moreLabel.text = ""
            }
        } else if book.genre!.count == 2 {
            genre3View.isHidden = true
            genre2View.isHidden = false
            genre3View.isHidden = false
            genre1Label.text = book.genre![0]
            genre2Label.text = book.genre![1]
            moreLabel.text = ""
        } else if book.genre!.count == 1 {
            genre3View.isHidden = true
            genre2View.isHidden = true
            genre3View.isHidden = false
            genre1Label.text = book.genre![0]
            moreLabel.text = ""
        } else if book.genre!.count == 0 {
            genre3View.isHidden = true
            genre2View.isHidden = true
            genre3View.isHidden = true
            moreLabel.text = ""
        }
    }
}
