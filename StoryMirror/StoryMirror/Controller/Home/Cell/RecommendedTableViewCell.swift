//
//  RecommendedTableViewCell.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitlLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var recommendCollection: UICollectionView!
    @IBOutlet weak var headerView: UIStackView!
    
    var books = [Book]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        recommendCollection.delegate = self
        recommendCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateView(book: [Book]) {
        books = book
        DispatchQueue.main.async {
            self.recommendCollection.reloadData()
        }
    }

}
extension RecommendedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RecommendedCollectionViewCell
        cell.updateView(book: books[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 40, height: 220)
    }
}
