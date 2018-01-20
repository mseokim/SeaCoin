//
//  ReturnMoneyViewController.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 21..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit

class ReturnMoneyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.4, width: view.frame.width, height: view.frame.height * 0.2))
        label.text = "준비 중인 서비스입니다.\n빠르게 서비스 오픈하도록 하겠습니다."
        label.numberOfLines = 2
        view.addSubview(label)
        
        let cancelButton = UIButton(frame: CGRect(x: view.frame.width * 0.08, y: view.frame.height * 0.05, width: view.frame.width * 0.3, height: view.frame.height * 0.04))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
