

import UIKit
import QuartzCore
import Alamofire


var btnInter: UIButton!
var btnReturn: UIButton!


class MainViewController: UIViewController, LineChartDelegate {
    
    
    
    
    var label = UILabel()
    var lineChart: LineChart!
    var side: SideView!
    var button: UIButton!
    var isOn = true
    var grayLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sea Coin"
        navigationController?.navigationBar.isHidden = true
        
        var views: [String: AnyObject] = [:]
        
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        
        let ETC: [CGFloat] = [3, 4, 7, 11, 13, 15] //동해
        let WTC: [CGFloat] = [1, 3, 5, 13, 17, 30] //서해
        let STC: [CGFloat] = [3, 4, 2, 8, 13, 20] //남해
        
        // simple line with custom x axis labels
        let xLabels = [String]() //날짜
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = false
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.addLine(ETC)
        lineChart.addLine(WTC)
        lineChart.addLine(STC)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
        setUI()
    }
    
    func setUI() {
        
        Alamofire.request("http://175.208.235.91:80/coin/", method: .get).responseJSON {
            response in
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                //에러가 없을때
                
                if((jsonData.value(forKey: "result") as! NSNumber)).boolValue == true {
                    

                    
                    let etc = jsonData.value(forKey: "ETC")
                    print(etc!)
                    
                    
                    
                    
                   
                }
            }
            
        }
        
        
        
        let lblTitle = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0, width: view.frame.width, height: view.frame.height * 0.15))
        lblTitle.textAlignment = .center
        lblTitle.text = "Sea Coin"
        lblTitle.font = UIFont(name: "AppleSDGothicNeoB", size: view.frame.height * 0.15)
        view.addSubview(lblTitle)
        
        let bgETC = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.53, width: view.frame.width, height: view.frame.height * 0.07))
        bgETC.backgroundColor = UIColor(hex: 0xEEEEEE)
        view.addSubview(bgETC)
        
        let nameETC = UILabel(frame: CGRect(x: view.frame.width * 0.05, y: view.frame.height * 0.53, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        nameETC.text = "동해코인"
        nameETC.textColor = UIColor(hex: 0x0072BB)
        view.addSubview(nameETC)
        
        let priceETC = UILabel(frame: CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.53, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        priceETC.textAlignment = .right
        priceETC.text = "1,700"
        priceETC.textColor = .black
        view.addSubview(priceETC)
        
        let varianceETC = UILabel(frame: CGRect(x: view.frame.width * 0.45, y: view.frame.height * 0.53, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        varianceETC.text = "(+ 2.7%)"
        varianceETC.textColor = .black
        view.addSubview(varianceETC)
        
        let amountETC = UILabel(frame: CGRect(x: view.frame.width * 0.65, y: view.frame.height * 0.53, width: view.frame.width * 0.3, height: view.frame.height * 0.07))
        amountETC.text = "7,324,120"
        amountETC.textAlignment = .right
        amountETC.textColor = UIColor(hex: 0x000000)
        view.addSubview(amountETC)
        
        
        let bgWTC = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.6, width: view.frame.width, height: view.frame.height * 0.07))
        bgWTC.backgroundColor = UIColor(hex: 0xFFFFFF)
        view.addSubview(bgWTC)
        
        let nameWTC = UILabel(frame: CGRect(x: view.frame.width * 0.05, y: view.frame.height * 0.6, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        nameWTC.text = "서해코인"
        nameWTC.textColor = UIColor(hex: 0xFF4C3B)
        view.addSubview(nameWTC)
        
        let priceWTC = UILabel(frame: CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.6, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        priceWTC.textAlignment = .right
        priceWTC.text = "800"
        priceWTC.textColor = .black
        view.addSubview(priceWTC)
        
        let varianceWTC = UILabel(frame: CGRect(x: view.frame.width * 0.45, y: view.frame.height * 0.6, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        varianceWTC.text = "(- 3.7%)"
        varianceWTC.textColor = .black
        view.addSubview(varianceWTC)
        
        let amountWTC = UILabel(frame: CGRect(x: view.frame.width * 0.65, y: view.frame.height * 0.6, width: view.frame.width * 0.3, height: view.frame.height * 0.07))
        amountWTC.text = "4,213,210"
        amountWTC.textAlignment = .right
        amountWTC.textColor = UIColor(hex: 0xBDBDBD)
        view.addSubview(amountWTC)
        
        let bgNTC = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.67, width: view.frame.width, height: view.frame.height * 0.07))
        bgNTC.backgroundColor = UIColor(hex: 0xEEEEEE)
        view.addSubview(bgNTC)
        
        let nameNTC = UILabel(frame: CGRect(x: view.frame.width * 0.05, y: view.frame.height * 0.67, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        nameNTC.text = "남해코인"
        nameNTC.textColor = UIColor(hex: 0xFFD034)
        view.addSubview(nameNTC)
        
        let priceNTC = UILabel(frame: CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.67, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        priceNTC.textAlignment = .right
        priceNTC.text = "950"
        priceNTC.textColor = .black
        view.addSubview(priceNTC)
        
        let varianceNTC = UILabel(frame: CGRect(x: view.frame.width * 0.45, y: view.frame.height * 0.67, width: view.frame.width * 0.2, height: view.frame.height * 0.07))
        varianceNTC.text = "(- 1.2%)"
        varianceNTC.textColor = .black
        view.addSubview(varianceNTC)
        
        let amountNTC = UILabel(frame: CGRect(x: view.frame.width * 0.65, y: view.frame.height * 0.67, width: view.frame.width * 0.3, height: view.frame.height * 0.07))
        amountNTC.text = "1.4"
        amountNTC.textColor = UIColor(hex: 0xFFFFFF)
        amountNTC.textAlignment = .right
        amountNTC.textColor = .black
        view.addSubview(amountNTC)
        
        let lblTip = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width, height: view.frame.height * 0.2))
        lblTip.textAlignment = .center
        lblTip.numberOfLines = 2
        lblTip.textColor = UIColor(hex: 0xACACAC)
        lblTip.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        lblTip.text = "아, 비트코인 오르기 전에 사둘걸... 이라 생각 할 때 사둘걸...\n이라 생각 할 때 사둘걸... 이라 생각 할 때 사둘걸..."
        view.addSubview(lblTip)
        
        let lbl = UILabel(frame: CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: view.frame.height))
        lbl.backgroundColor = UIColor.gray
        lbl.alpha = 0.8
        view.addSubview(lbl)
        
        let menuButton = UIButton(frame: CGRect(x: view.frame.width * 0.06, y: view.frame.height * 0.063, width: view.frame.width * 0.05, height: view.frame.width * 0.05))
        menuButton.setBackgroundImage(#imageLiteral(resourceName: "menu"), for: .normal)
        menuButton.addTarget(self, action: #selector(moveView(_:)), for: .touchUpInside)
        view.addSubview(menuButton)
        
        let sideMenu = SideView(frame: CGRect(x: -view.frame.width * 0.7, y: 0, width: view.frame.width * 0.7, height: view.frame.height), profile: "김민서", id: "min101110001", cardNumber: "0000-0000-0000-0000")
        sideMenu.backgroundColor = .white
        view.addSubview(sideMenu)
        
        btnInter.addTarget(self, action: #selector(interMoney(_:)), for: .touchUpInside)
        btnReturn.addTarget(self, action: #selector(returnMoney(_:)), for: .touchUpInside)
        
        side = sideMenu
        button = menuButton
        grayLabel = lbl
    }
    
    @objc func interMoney(_ button : UIButton) {
        navigationController?.pushViewController(InterMoneyViewController(), animated: true)
    }
    
    @objc func returnMoney(_ button: UIButton) {
        navigationController?.pushViewController(ReturnMoneyViewController(), animated: true)
    }
    
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        
    }
    
    @objc func moveView(_ button: UIButton) {
        if isOn == true {
            UIView.animate(withDuration: 0.5) {
                button.center.x += self.view.frame.width * 0.7
                self.side.center.x += self.view.frame.width * 0.7
                self.grayLabel.center.x += self.view.frame.width
            }
            
        } else if isOn == false {
            UIView.animate(withDuration: 0.5) {
                button.center.x -= self.view.frame.width * 0.7
                self.side.center.x -= self.view.frame.width * 0.7
                self.grayLabel.center.x -= self.view.frame.width
            }
            
        }
        
        isOn = !isOn
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
    
}


class SideView: UIView {
    var profile: String!
    var id: String!
    var cardNumber: String!
    
    init(frame: CGRect, profile: String, id: String, cardNumber: String) {
        super.init(frame: frame)
        self.profile = profile
        self.id = id
        self.cardNumber = cardNumber
        setLayOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setLayOut() {
        let imgLogo = UIImageView(frame: CGRect(x: frame.width * 0.2, y: frame.height * 0.1, width: frame.width * 0.2, height: frame.width * 0.2))
        imgLogo.image = #imageLiteral(resourceName: "wave")
        addSubview(imgLogo)
        
        let name = UILabel(frame: CGRect(x: frame.width * 0.42, y: frame.height * 0.1, width: frame.width * 0.6, height: frame.height * 0.1))
        name.text = profile
        addSubview(name)
        
        let uid = UILabel(frame: CGRect(x: frame.width * 0.2, y: frame.height * 0.1 + frame.width * 0.2, width: frame.width * 0.6, height: frame.height * 0.05))
        uid.font = UIFont.systemFont(ofSize: 9)
        uid.text = id
        addSubview(uid)
        
        let line = UILabel(frame: CGRect(x: frame.width * 0.2, y: frame.height * 0.1 + frame.width * 0.2, width: frame.width * 0.6, height: 1))
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor(hex: 0xBDBDBD).cgColor
        addSubview(line)
        
        let cardImage = UIImageView(frame: CGRect(x: frame.width * 0.2, y: frame.height * 0.2 + frame.width * 0.2, width: frame.width * 0.6, height: frame.width * 0.6 * 119 / 200))
        cardImage.image = #imageLiteral(resourceName: "MasterCard")
        addSubview(cardImage)
        
        let _cardNumber = UILabel(frame: CGRect(x: 0, y: frame.height * 0.45, width: frame.width, height: frame.height * 0.05))
        _cardNumber.text = cardNumber
        _cardNumber.textColor = UIColor(hex: 0xDEDEDE)
        _cardNumber.textAlignment = .center
        addSubview(_cardNumber)
        
        let interMoney = UIButton(frame: CGRect(x: frame.width * 0.05, y: frame.height * 0.6, width: frame.width * 0.4, height: frame.width * 0.4))
        interMoney.setBackgroundImage(#imageLiteral(resourceName: "insertMoney"), for: .normal)
        addSubview(interMoney)
        
        let lblInterMoney = UILabel(frame: CGRect(x: frame.width * 0.05, y: frame.height * 0.6 + frame.width * 0.4 + 6, width: frame.width * 0.4, height: frame.height * 0.04))
        lblInterMoney.textAlignment = .center
        lblInterMoney.text = "입금"
        addSubview(lblInterMoney)
        
        let returnMoney = UIButton(frame: CGRect(x: frame.width * 0.55, y: frame.height * 0.6, width: frame.width * 0.4, height: frame.width * 0.4))
        returnMoney.setBackgroundImage(#imageLiteral(resourceName: "returnMoney"), for: .normal)
        addSubview(returnMoney)
        
        let lblReturnMoney = UILabel(frame: CGRect(x: frame.width * 0.55, y: frame.height * 0.6 + frame.width * 0.4 + 6, width: frame.width * 0.4, height: frame.height * 0.04))
        lblReturnMoney.textAlignment = .center
        lblReturnMoney.text = "출금"
        addSubview(lblReturnMoney)
        
        let lblLogo = UILabel(frame: CGRect(x: 0, y: frame.height * 0.95, width: frame.width, height: frame.height * 0.05))
        lblLogo.backgroundColor = .black
        lblLogo.textAlignment = .center
        lblLogo.textColor = .white
        lblLogo.text = "Sea Coin"
        addSubview(lblLogo)
        
        btnInter = interMoney
        btnReturn = returnMoney
    }
    
    
}
