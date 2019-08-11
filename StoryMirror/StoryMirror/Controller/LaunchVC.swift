//
//  LaunchVC.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class LaunchVC: GeneralVC {
    
    var startButton = ButtonDesign()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BookLoader.shared.show()
        startButton.frame = CGRect(x: 40, y: view.frame.height - 80, width: view.frame.width - 80, height: 60)
        startButton.backgroundColor = UIColor(displayP3Red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
        startButton.cornerRadius = 8
        startButton.setTitle("Get Started", for: .normal)
        startButton.titleLabel?.textColor = .white
        startButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        startButton.addTarget(self, action: #selector(StartButtonAction(_:)), for: .touchUpInside)
        BookLoader.shared.loadView.addSubview(startButton)
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (timer) in
            
        }
    }
    @objc func StartButtonAction(_ sender: Any) {
        BookLoader.shared.hide()
        let destVC = storyboard?.instantiateViewController(withIdentifier: "HomeTab") as! UITabBarController
        self.present(destVC, animated: true, completion: nil)
    }
}
