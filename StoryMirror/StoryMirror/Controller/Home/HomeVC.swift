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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeTable.delegate = self
        homeTable.dataSource = self
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
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecommendedTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "ViewRecommendedBooksVC") as! ViewRecommendedBooksVC
        navigationController?.pushViewController(destVC, animated: true)
    }
}
