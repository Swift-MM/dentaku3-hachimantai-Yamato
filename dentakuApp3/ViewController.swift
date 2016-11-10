//
//  ViewController.swift
//  dentakuApp3
//
//  Created by 大和芳隆 on 2016/11/09.
//  Copyright © 2016年 BETA-yamato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel = UILabel()
    let numRows = 4
    let numColumns = 4
    let btnMargin = 10
    let labelHeight = 190
    var num1:Double = 0.0
    var num2:Double = 0.0
    var calcResult:Double = 0.0
    var operatorType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenWidth:Double = Double(UIScreen.main.bounds.size.width)
        let screenHeight:Double = Double(UIScreen.main.bounds.size.height)
        
        resultLabel.frame = CGRect(x: btnMargin, y: 40, width: Int(screenWidth-Double(btnMargin*2)), height: 150)
    resultLabel.backgroundColor = UIColor.lightGray
    resultLabel.text = "0"
        resultLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(resultLabel)
        
        
        let btnLabel = ["7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", "C", "+", "="]
        for i in 0..<numRows {
            for j in 0..<numColumns {
                
                let button = UIButton()
                let btnWidth = (screenWidth - Double(btnMargin * (numColumns + 1)))/Double(numColumns)
                let btnHeight = (screenHeight - Double(labelHeight) - Double(btnMargin * (numRows + 1))) / Double(numRows)
                let btnX = Double(btnMargin) + (screenWidth - Double(btnMargin))/Double(numColumns) * Double(j)
                let btnY = Double(labelHeight) + Double(btnMargin) + (screenHeight - Double(labelHeight) - Double(btnMargin))/Double(numRows) * Double(i)
                button.frame = CGRect(x: Int(btnX), y: Int(btnY), width: Int(btnWidth), height: Int(btnHeight))
                button.backgroundColor = UIColor.blue
                
                let btnNum = i * numRows + Int(j)
                button.setTitle(btnLabel[btnNum], for: UIControlState.normal)
                button.addTarget(self, action: #selector(buttonTouched), for: UIControlEvents.touchUpInside)
                self.view.addSubview(button)

            
            }
    }
    }

    func buttonTouched(sender: UIButton){
        let btnTitle:String = sender.currentTitle!
        
        
        print("\(btnTitle) のボタンがタッチされました")
        
        switch btnTitle {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            numberTouched(btnTitle: btnTitle)
            case "+", "-", "×", "÷":
            operatorTouched(btnTitle: btnTitle)
            case "=":
            equalTouched(btnTitle: btnTitle)
            default:
            clearTouched(btnTitle: btnTitle)
        }
    }
    
    func numberTouched(btnTitle:String){
        print(" 数字がタッチされました")
        let btnValue:Double = Double(btnTitle)!
        num1 = num1 * 10 + btnValue
        resultLabel.text = String(format: "%.0f", num1)
        }
    func operatorTouched(btnTitle:String){
        print(" 演算子がタッチされました")
        operatorType = btnTitle
        num2 = num1
        num1 = 0
        
    }
    func equalTouched(btnTitle:String){
        print(" イコールがｔッチされました")
        switch operatorType {
        case "+":
            calcResult = num1 + num2
        case "-":
            calcResult = num1 - num2
        case "×":
            calcResult = num1 * num2
        case "÷":
            calcResult = num1 / num2
        default:
            print("その他")
        }
        num1 = calcResult
        resultLabel.text = String("\(calcResult)")
    }
    func clearTouched(btnTitle:String){
        print(" クリアがタッチされました")
        num1 = 0
        num2 = 0
        operatorType = ""
        resultLabel.text = "0"
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

