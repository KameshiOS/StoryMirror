//
//  Loader.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit
import Lottie

public class Loader {
    public static let shared = Loader()
    
    var blurImg = UIImageView()
    var loadView = AnimationView()
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.white
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 1
        
        loadView = AnimationView(name: "loader")
        loadView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        loadView.center = blurImg.center
        loadView.animationSpeed = 0.8
        loadView.loopMode = .loop
    }
    func show(){
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.loadView)
            self.loadView.play()
        })
    }
    func hide(){
        DispatchQueue.main.async( execute: {
            self.loadView.stop()
            self.blurImg.removeFromSuperview()
            self.loadView.removeFromSuperview()
        })
    }
}

public class BookLoader {
    public static let shared = BookLoader()
    
    var blurImg = UIImageView()
    var loadView = AnimationView()
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.clear
        blurImg.isUserInteractionEnabled = true
//        blurImg.alpha = 0
        
        loadView = AnimationView(name: "books")
        loadView.frame = CGRect(x: 0, y: 0, width: blurImg.frame.width, height: blurImg.frame.height)
        loadView.center = blurImg.center
        loadView.animationSpeed = 0.8
        loadView.loopMode = .loop
        
    }
    func show(){
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.loadView)
            self.loadView.play()
        })
    }
    func hide(){
        DispatchQueue.main.async( execute: {
            self.loadView.stop()
            self.blurImg.removeFromSuperview()
            self.loadView.removeFromSuperview()
        })
    }
}
