//
//  SecondViewController.swift
//  DDmWebviewDemo
//
//  Created by yaoqi on 17/2/7.
//  Copyright © 2017年 yaoqi. All rights reserved.
//

import UIKit

typealias InputClosureType = (String) -> Void //闭包属性

protocol SecondViewControllerDelegate {
    func delegateSendString(str: String) -> Void//代理传值的方法
}

class SecondViewController: UIViewController {
    
    //闭包传值
    var closure:((UIColor)->Void)?
    var stringTest:String?
    var inputReturn: InputClosureType?
    //接收上个页面传过来的闭包块
    var backClosure: InputClosureType?
    
    //属性传值
    var  color : UIColor?
    
    //代理传值
    var delegate:SecondViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color
        // Do any additional setup after loading the view.
    }

    
    @IBAction func dissmissController(_ sender: Any) {
        
        self.dismiss(animated: true) {
            if self.inputReturn != nil{
                self.inputReturn!("闭包传值")
            }
            if self.closure != nil {
                self.closure!(UIColor.red)
            }
        }
        self.delegate?.delegateSendString(str: "代理传值")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
