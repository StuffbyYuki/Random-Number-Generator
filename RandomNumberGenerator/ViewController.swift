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
    
    
    @IBOutlet weak var labelFadingInOut: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        numberLabel.adjustsFontSizeToFitWidth = true
        setTimer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("view will appear")
        
        labelFadingInOut.isHidden = false
        
        
        startValue = minNum
        endValue = maxNum
        nowCounting = true
        countingNumberAnimation()
        numberLabel.text = "?"
        
        fadeInOut()
    }

  
    func fadeInOut(){
            UIView.animate(withDuration: 1.7, delay: 0.0, options: [UIView.AnimationOptions.curveEaseOut,UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
                self.labelFadingInOut.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                self.labelFadingInOut.text = "Tap or Shake"
                
                // Fade in
                UIView.animate(withDuration: 1.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    self.labelFadingInOut.alpha = 1.0
                }, completion: nil)
            })
    }
    
    func setTimer(){
        var runCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            //print("Timer fired!")
            runCount += 1
            
            if runCount == 6 {
                timer.invalidate()
                self.fadeInOut()
            }
        }
    }

    
 
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.delegate = self
            destinationVC.minToDisplay = String(minNum)
            destinationVC.maxToDisplay = String(maxNum)
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
        
        labelFadingInOut.isHidden = true
        
        userEnterMinMax(min: minNum, max: maxNum)
        
        countingNumberAnimation()
        
        //print(nowCounting)
   
    }
    
    
    
    @IBAction func numGeneratePressed(_ sender: UIButton) {
        
        getNewNums()
        
    }
    

    
}

