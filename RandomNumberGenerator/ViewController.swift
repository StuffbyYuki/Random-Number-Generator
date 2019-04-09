//
//  ViewController.swift
//  RandomNumberGenerator
//
//  Created by 掛川優希 on 1/21/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MinMaxChangeDelegate {
    

    var minNum = 1
    var maxNum = 10
    
    var startValue = 0
    var endValue = 10
    
    var nowCounting: Bool = true
    
    var displayLink: CADisplayLink?
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        numberLabel.adjustsFontSizeToFitWidth = true

    
    }

    
//    func makeLabelFadeInOut(){
//        if fadingLabel.alpha == 0 {
//            UILabel.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
//                self.fadingLabel.alpha = 1
//            })
//        }
//    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        startValue = minNum
        endValue = maxNum
        nowCounting = true
        countingNumberAnimation()
        numberLabel.text = "0"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.delegate = self
        }
    }
    
    
    func countingNumberAnimation(){
        
    
        if nowCounting == true {
            
            displayLink?.invalidate()
            displayLink = nil

            let num = Int.random(in: minNum...maxNum)
            numberLabel.text = String(num)
            
        } else if nowCounting == false {
            
            displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
            displayLink?.add(to: .main, forMode: .default)
            
        }
        
        if nowCounting == false {
            
            nowCounting = true
            
        } else {
            
            nowCounting = false
            
        }
        
        
        
    }
    
    @objc func handleUpdate(){

        numberLabel.text = String(startValue)
        startValue = Int.random(in: minNum...maxNum)
        
    }
    
    
    func userEnterMinMax(min: Int, max: Int) {
        
        minNum = min
        maxNum = max
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getNewNums()
    }
    
    
    
    
    
    func getNewNums(){
        
        userEnterMinMax(min: minNum, max: maxNum)
        
        countingNumberAnimation()
        
        print(nowCounting)
        
       
   
    }
    
    
    
    @IBAction func numGeneratePressed(_ sender: UIButton) {
        
        getNewNums()
        
    }
    

    
}

