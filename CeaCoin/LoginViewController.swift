//
//  LoginViewController.swift
//  CeaCoin
//
//  Created by 김민서 on 2018. 1. 20..
//  Copyright © 2018년 김민서. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var a: UITextField!
    var b: UITextField!
    
    let defaultValues = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        title = "로그인"
        
        setUI()
    }
    
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUI() {
        
        let superjump = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.3))
        superjump.addTarget(self, action: #selector(jump(_:)), for: .touchUpInside)
        view.addSubview(superjump)
        
        let logo = UIImageView(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.1, width: view.frame.width * 0.4, height: view.frame.width * 0.4))
        logo.image = #imageLiteral(resourceName: "wave")
        view.addSubview(logo)
        
        let lblID = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.3, width: view.frame.width, height: view.frame.height * 0.1))
        lblID.text = "아이디"
        lblID.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblID)
        
        let txfID = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.37, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfID.placeholder = "아이디 입력"
        txfID.layer.borderWidth = 1
        txfID.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfID.layer.cornerRadius = txfID.frame.height / 15
        txfID.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfID.frame.height))
        txfID.leftViewMode = UITextFieldViewMode.always
        view.addSubview(txfID)
        
        let lblPW = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.41, width: view.frame.width, height: view.frame.height * 0.1))
        lblPW.text = "비밀번호"
        lblPW.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        view.addSubview(lblPW)
        
        let txfPW = UITextField(frame: CGRect(x: view.frame.width * 0.075, y: view.frame.height * 0.48, width: view.frame.width * 0.85, height: view.frame.height * 0.05))
        txfPW.placeholder = "비밀번호 입력"
        txfPW.layer.borderWidth = 1
        txfPW.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        txfPW.layer.cornerRadius = txfID.frame.height / 15
        txfPW.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txfPW.frame.height))
        txfPW.leftViewMode = UITextFieldViewMode.always
        txfPW.isSecureTextEntry = true
        view.addSubview(txfPW)
        
        let loginButton = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.6, width: view.frame.width * 0.25, height: view.frame.height * 0.05))
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.setTitle("로그인 하기", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        
        let registerButton = UIButton(frame: CGRect(x: view.frame.width * 0.6, y: view.frame.height * 0.6, width: view.frame.width * 0.25, height: view.frame.height * 0.05))
        registerButton.layer.cornerRadius = 5
        registerButton.layer.borderWidth = 1
        registerButton.setTitle("회원가입 하기", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        registerButton.addTarget(self, action: #selector(register(_:)), for: .touchUpInside)
        view.addSubview(registerButton)
        
        let lblDanger = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width, height: view.frame.height * 0.1))
        lblDanger.text = "모든 불상사는 본 앱의 책임이 없으므로,\n이 점 유의하여 사용하여 주시길 바랍니다."
        lblDanger.numberOfLines = 2
        lblDanger.textAlignment = .center
        lblDanger.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        lblDanger.textColor = UIColor(hex: 0xACACAC)
        view.addSubview(lblDanger)
        
        a = txfID
        b = txfPW
    }
    
    @objc func jump(_ button: UIButton) {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    @objc func register(_ button: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func login(_ button: UIButton) {
        
        let parameters = [
            "id" : a.text!,
            "password" : b.text!
        ]
        
        Alamofire.request("http://175.208.235.91:80/users/", method: .get, parameters: parameters).responseJSON {
            
            response in
            //응답 출력
            print(response)
            
            //서버로 제이선값 보내기
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                //에러가 없을때
                
                if((jsonData.value(forKey: "result") as! NSNumber)).boolValue == true{
                    print(result)
                    
                    //리스폰에서 데이터가져오기
                    
                    let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                    //유저 정보 가져오기
                    let userId = user.value(forKey: "id") as! String
                    
                    
                    //유저 정보 저장
                    self.defaultValues.set(userId, forKey: "id")
                    
                    
                    //                뷰 ㅈ전환
                    self.navigationController?.pushViewController(MainViewController(), animated: true)
                }
                    
                else {
                    self.myAlert("경고", message:"없는 계정입니다")
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
