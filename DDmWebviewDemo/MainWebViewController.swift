//
//  MainWebViewController.swift
//  DDmWebviewDemo
//
//  Created by yaoqi on 17/2/7.
//  Copyright © 2017年 yaoqi. All rights reserved.
//

import UIKit

class MainWebViewController: UIViewController, UIWebViewDelegate,SecondViewControllerDelegate {

    @IBOutlet weak var mainWebview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.mainWebview.backgroundColor = UIColor.red
        self.mainWebview.loadRequest(URLRequest(url: URL(string: "http://www.baidu.com")!))
        
//        let context = self.mainWebview.value(forKeyPath:"documetView.webView.mainFrame.jsvaScriptContext") as!JSContext

        
        let label = UILabel.init()
        label.frame = CGRect(x: 90, y: 90, width: 90, height: 60)
        label.backgroundColor = UIColor.red
        label.text = "sss"
        label.height = 10
        self.view.addSubview(label)
        
        let lab = UILabel.init()
        lab.frame = CGRect(x: label.rightViewX(), y: label.frame.origin.y, width: 89, height: 89)
        lab.backgroundColor = UIColor.yellow
        self.view.addSubview(lab)
        
        let btn = UIButton.init()
        btn.frame = CGRect(x: 90, y: 190, width: 90, height: 90)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(ssssAct(send:)), for: UIControlEvents.touchUpInside)
        btn.tag = 9009
        self.view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }
    
    func ssssAct(send:AnyObject) -> Void {
        let btn:UIButton = send as! UIButton
        print("btn.tag == \(btn.tag)")
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("nihao")
        return true
    }
    
    
    @IBAction func presentController(_ sender: Any) {

        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        let svc = mainStory.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        //闭包传值
        svc.inputReturn = {
            (backStr: String) -> Void in
            print(backStr)
            print("闭包传值成功了！！！")
        }
        svc.closure = {
            (color: UIColor) -> Void in
            self.view.backgroundColor = color
        }
        
        self.present(svc, animated: true) {
            
        }
        
        svc.color = UIColor.purple//属性传值

        
        //代理传值
        svc.delegate = self
        
        print("tiaozhuan")
        
        
    }
    
    func delegateSendString(str: String) -> Void {
        print(str)
        print("代理传值成功了！！！！！！")
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
