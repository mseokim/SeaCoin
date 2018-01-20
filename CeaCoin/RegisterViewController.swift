//
//  RegisterViewController.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 20..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit
import Alamofire


var name: String!
var ID: String!
var PW: String!
var BirthDay: String!


class RegisterViewController: UIViewController {

    let urlLink = "http://www.prometasv.com"
    let urlPort = ":80"
    
    var a: UITextField!
    var b: UITextField!
    var c: UITextField!
    var d: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        setUI()
    }
    
    func setUI() {
        
        let lblName = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.1, width: view.frame.width, height: view.frame.height * 0.1))
        lblName.text = "이름"
        lblName.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblName)
        
        let txfName = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.17, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfName.placeholder = "이름 입력"
        txfName.layer.borderWidth = 1
        txfName.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfName.layer.cornerRadius = txfName.frame.height / 15
        txfName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfName.frame.height))
        txfName.leftViewMode = UITextFieldViewMode.always
        view.addSubview(txfName)
        
        let lblID = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.21, width: view.frame.width, height: view.frame.height * 0.1))
        lblID.text = "아이디"
        lblID.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblID)
        
        let txfID = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.28, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfID.placeholder = "아이디 입력"
        txfID.layer.borderWidth = 1
        txfID.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfID.layer.cornerRadius = txfID.frame.height / 15
        txfID.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfID.frame.height))
        txfID.leftViewMode = UITextFieldViewMode.always
        view.addSubview(txfID)
        
        let lblPW = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.32, width: view.frame.width, height: view.frame.height * 0.1))
        lblPW.text = "비밀번호"
        lblPW.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblPW)
        
        let txfPW = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.39, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfPW.placeholder = "비밀번호 입력"
        txfPW.layer.borderWidth = 1
        txfPW.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfPW.layer.cornerRadius = txfID.frame.height / 15
        txfPW.isSecureTextEntry = true
        txfPW.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfPW.frame.height))
        txfPW.leftViewMode = UITextFieldViewMode.always
        view.addSubview(txfPW)
        
        let lblBirthday = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.43, width: view.frame.width, height: view.frame.height * 0.1))
        lblBirthday.text = "생년월일"
        lblBirthday.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblBirthday)
        
        let txfBirth = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.5, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfBirth.placeholder = "생년월일(6자리)"
        txfBirth.textAlignment = .left
        txfBirth.layer.borderWidth = 1
        txfBirth.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfBirth.layer.cornerRadius = txfID.frame.height / 15
        txfBirth.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfBirth.frame.height))
        txfBirth.leftViewMode = UITextFieldViewMode.always
        txfBirth.keyboardType = UIKeyboardType.numberPad
        view.addSubview(txfBirth)
        
        
        let registerButton = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.7, width: view.frame.width * 0.4, height: view.frame.height * 0.05))
        registerButton.layer.cornerRadius = 5
        registerButton.layer.borderWidth = 1
        registerButton.setTitle("다음", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        registerButton.addTarget(self, action: #selector(moveToNext(_:)), for: .touchUpInside)
        view.addSubview(registerButton)
        
        a = txfName
        b = txfID
        c = txfPW
        d = txfBirth
    }
    
    @objc func moveToNext(_ button : UIButton) {
        name = a.text
        ID = b.text
        PW = c.text
        BirthDay = d.text
        navigationController?.pushViewController(RegisterTwoViewController(), animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


