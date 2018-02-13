//
//  ViewController.swift
//  demo3
//
//  Created by ios on 2018/1/5.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class shot: UIViewController
{
    @IBAction func backto(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "presentVc")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    @IBOutlet weak var speed: UITextField!
    @IBOutlet weak var bow: UIImageView!
    @IBOutlet weak var fire: UIImageView!
    @IBOutlet weak var rockC: UIImageView!
    
    let myimrockmanC:[UIImage] = [UIImage(named: "rockman01")!,
                                 UIImage(named: "rockman02")!,
                                 UIImage(named: "rockman03")!,]
    let myimshotA:[UIImage] = [UIImage(named: "shot01")!,
                            UIImage(named: "shot01")!,
                            UIImage(named: "shot02")!,
//                            UIImage(named: "shot02")!,
                            UIImage(named: "shot03")!,
//                            UIImage(named: "shot03")!,
                            UIImage(named: "shot04")!,
//                            UIImage(named: "shot04")!,
                            UIImage(named: "shot05")!,
//                            UIImage(named: "shot05")!,
                            UIImage(named: "shot06")!,
//                            UIImage(named: "shot06")!,
                            UIImage(named: "shot07")!,
//                            UIImage(named: "shot07")!
    ]
    let myimfireB:[UIImage] = [UIImage(named: "fire01")!,
                            UIImage(named: "fire02")!,
                            UIImage(named: "fire03")!,
                            UIImage(named: "fire04")!,
                            UIImage(named: "fire05")!,
                            UIImage(named: "fire06")!,
                            UIImage(named: "fire01")!,
                            UIImage(named: "fire02")!,
                            UIImage(named: "fire03")!,
                            UIImage(named: "fire04")!,
                            UIImage(named: "fire05")!,
                            UIImage(named: "fire06")!,]
    var indexshotA = 0 , indexfireB = 0 ,indexrockmanc = 0
    var timerCount = 0
    var runBow = true
    var runFire = false
    var mytimer: Timer!
    var a = 0.18
    
    @IBAction func speedchange(_ sender: UITextField) {
        a = Double(speed.text!)!
        mytiming(speed1: a)
        print(a)
    }
    @objc func timerRun()
    {
        if runBow
        {
            if indexshotA == myimshotA.count //換view時 Ｂ
            {
                indexshotA = 0; indexfireB = 0; indexrockmanc = 0
                runBow = false; runFire = true //執行哪個view  Ｂ
                fire.isHidden = false; //打開下一個viewＢ
                fire.image = myimfireB[indexfireB]
            }
            else //run bow
            {
                fire.isHidden = true; rockC.isHidden = true //關閉還沒執行的
                bow.image = myimshotA[indexshotA]
                indexshotA = indexshotA + 1
            }
        }
        else if runFire  //run fire
        {
            if indexfireB == myimfireB.count //換view時 Ｃ
            {
                indexshotA = 0; indexfireB = 0; indexrockmanc = 0
                runBow = false; runFire = false//執行哪個view  Ｃ
                rockC.isHidden = false//打開下一個view Ｃ
                rockC.image = myimrockmanC[indexrockmanc]
            }
            else //run fire
            {
                bow.isHidden = true ; rockC.isHidden = true//關閉還沒執行的
                fire.image = myimfireB[indexfireB]
                indexfireB = indexfireB + 1
                
            }
        }
        else //run rockC

        {
            if indexrockmanc == myimrockmanC.count //換view時 Ａ
            {
                indexshotA = 0; indexfireB = 0; indexrockmanc = 0
                runBow = true; runFire = false//執行哪個view  A
                bow.isHidden = false//打開下一個view A
                bow.image = myimshotA[indexshotA]
            }
            else //run rockC
            {
                bow.isHidden = true ; fire.isHidden = true//關閉還沒執行的
                rockC.image = myimrockmanC[indexrockmanc]
                indexrockmanc = indexrockmanc + 1
                
            }
            
        }
        
    }
    @IBAction func attack(_ sender: UIButton)
    {
        a = Double(speed.text!)! //字串可以直接轉浮點
       
        print(a)
        
        
            if  mytimer == nil
            {
                mytiming(speed1: a)
            }
            else
            {
                mytimer.invalidate()
                mytiming(speed1: a)
            }
    }
        
    func mytiming(speed1: Double)
//    func mytiming()
    {
        mytimer = Timer.scheduledTimer(timeInterval: speed1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        mytimer.fire()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fire.isHidden = true
        rockC.isHidden = true
//        a = Double(Int(speed.text!)!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




