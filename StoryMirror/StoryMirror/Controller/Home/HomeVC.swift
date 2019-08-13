//
//  HomeVC.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class HomeVC: GeneralVC {

    @IBOutlet weak var homeTable: UITableView!
    
    var englishStory: Category?
    var hindiStory: Category?
    var englishPoem: Category?
    var hindiPoem: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeTable.delegate = self
        homeTable.dataSource = self
        getEnglishStories()
    }
    func getEnglishStories() {
        BookVM.shared.getBooks(type: "stories", language: "english") { (success, error) in
            if success {
                self.englishStory = Category(type: "Stories", language: "English", books: BookVM.shared.books)
                self.getHindiStories()
            } else {
                print(error!)
            }
        }
    }
    func getHindiStories() {
        BookVM.shared.getBooks(type: "stories", language: "hindi") { (success, error) in
            if success {
                self.hindiStory = Category(type: "Stories", language: "Hindi", books: BookVM.shared.books)
                self.getEnglishPoem()
            } else {
                print(error!)
            }
        }
    }
    func getEnglishPoem() {
        BookVM.shared.getBooks(type: "poems", language: "english") { (success, error) in
            if success {
                self.englishPoem = Category(type: "Poem", language: "English", books: BookVM.shared.books)
                self.getHindiPoem()
            } else {
                print(error!)
            }
        }
    }
    func getHindiPoem() {
        BookVM.shared.getBooks(type: "poems", language: "hindi") { (success, error) in
            if success {
                self.hindiPoem = Category(type: "Poem", language: "Hindi", books: BookVM.shared.books)
                DispatchQueue.main.async {
                    self.homeTable.reloadData()
                }
            } else {
                print(error!)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.updateViews(setBackgroundWhite: true)
        title = "StoryMirror"
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecommendedTableViewCell
        if indexPath.row == 0 {
            cell.categoryLabel.text = englishStory?.type
            cell.subtitlLabel.text = englishStory?.language
            cell.updateView(book: englishStory?.books ?? [])
        } else if indexPath.row == 1 {
            cell.categoryLabel.text = hindiStory?.type
            cell.subtitlLabel.text = hindiStory?.language
            cell.updateView(book: hindiStory?.books ?? [])
        } else if indexPath.row == 2 {
            cell.categoryLabel.text = englishPoem?.type
            cell.subtitlLabel.text = englishPoem?.language
            cell.updateView(book: englishPoem?.books ?? [])
        } else if indexPath.row == 3 {
            cell.categoryLabel.text = hindiPoem?.type
            cell.subtitlLabel.text = hindiPoem?.language
            cell.updateView(book: hindiPoem?.books ?? [])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "ViewRecommendedBooksVC") as! ViewRecommendedBooksVC
        navigationController?.pushViewController(destVC, animated: true)
    }
}
