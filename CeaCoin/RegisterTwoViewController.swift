//
//  RegisterTwoViewController.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 21..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit
import Alamofire

var cardNumber: String!
var cardBirth: String!
var cardPW: String!

class RegisterTwoViewController: UIViewController {

    var a: UITextField!
    var b: UITextField!
    var c: UITextField!
    var d: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        let lblName = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.1, width: view.frame.width, height: view.frame.height * 0.1))
        lblName.text = "카드 번호"
        lblName.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblName)
        
        let txfName = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.17, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfName.placeholder = "'-' 입력"
        txfName.layer.borderWidth = 1
        txfName.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfName.layer.cornerRadius = txfName.frame.height / 15
        txfName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfName.frame.height))
        txfName.leftViewMode = UITextFieldViewMode.always
        txfName.keyboardType = .numberPad
        view.addSubview(txfName)
        
        let lblID = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.21, width: view.frame.width, height: view.frame.height * 0.1))
        lblID.text = "카드 유효기간"
        lblID.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblID)
        
        let txfID = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.28, width: view.frame.width * 0.4, height: view.frame.height * 0.05))
        txfID.placeholder = "MM"
        txfID.layer.borderWidth = 1
        txfID.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfID.layer.cornerRadius = txfID.frame.height / 15
        txfID.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfID.frame.height))
        txfID.leftViewMode = UITextFieldViewMode.always
        txfID.isSecureTextEntry = true
        txfID.keyboardType = .numberPad
        view.addSubview(txfID)
        
        let txfID2 = UITextField(frame: CGRect(x: view.frame.width * 0.525, y: view.frame.height * 0.28, width: view.frame.width * 0.4, height: view.frame.height * 0.05))
        txfID2.placeholder = "YY"
        txfID2.layer.borderWidth = 1
        txfID2.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfID2.layer.cornerRadius = txfID.frame.height / 15
        txfID2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfID2.frame.height))
        txfID2.leftViewMode = UITextFieldViewMode.always
        txfID2.isSecureTextEntry = true
        txfID2.keyboardType = .numberPad
        view.addSubview(txfID2)
        
        let lblPW = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.32, width: view.frame.width, height: view.frame.height * 0.1))
        lblPW.text = "게좌 비밀번호"
        lblPW.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblPW)
        
        let txfPW = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.39, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfPW.placeholder = "앞 2자리 입력"
        txfPW.layer.borderWidth = 1
        txfPW.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfPW.layer.cornerRadius = txfID.frame.height / 15
        txfPW.isSecureTextEntry = true
        txfPW.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfPW.frame.height))
        txfPW.leftViewMode = UITextFieldViewMode.always
        txfPW.isSecureTextEntry = true
        txfPW.keyboardType = .numberPad
        view.addSubview(txfPW)
        
        let lblDanger = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.45, width: view.frame.width, height: view.frame.height * 0.1))
        lblDanger.text = "타인의 명의 도용 시, 법적 처벌을 받을 수 있습니다."
        lblDanger.textAlignment = .center
        lblDanger.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        lblDanger.textColor = .red
        view.addSubview(lblDanger)
        
        let registerButton = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.7, width: view.frame.width * 0.4, height: view.frame.height * 0.05))
        registerButton.layer.cornerRadius = 5
        registerButton.layer.borderWidth = 1
        registerButton.setTitle("회원 가입", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        registerButton.addTarget(self, action: #selector(register(_:)), for: .touchUpInside)
        view.addSubview(registerButton)
        
        a = txfName //카드번호
        b = txfID2//카드유효기간(년)
        c = txfID //카드유효기간(월)
        d = txfPW //카드비번
    }
    
    @objc func register(_ button : UIButton) {
        cardNumber = a.text
        cardBirth = "20" + b.text! + "-" + c.text!
        cardPW = d.text
        
        
        let parameters = [
            "id" : ID,
            "password" : PW,
            "name" : name,
            "birthday" : BirthDay,
            "cardNumber" : cardNumber,
            "cardExpiary" : cardBirth,
            "cardPassword" : cardPW
            ] as [String : Any]
        
        Alamofire.request("http://175.208.235.91:80/users/", method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
        }
        
        myAlert("회원가입 성공", message: "회원가입에 성공하셨습니다.")
        navigationController?.popToRootViewController(animated: true)
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
