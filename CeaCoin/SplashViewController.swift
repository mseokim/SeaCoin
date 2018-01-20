//
//  SplashViewController.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 21..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setUI() {
        let img = UIImageView(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.4, width: view.frame.width * 0.4, height: view.frame.width * 0.4))
        img.image = #imageLiteral(resourceName: "wave")
        view.addSubview(img)
        
        UIView.animate(withDuration: 1) {
            img.center.y -= self.view.frame.height * 0.3
        }
    }

}
