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
    var maxNum = 100
    
    
    @IBOutlet weak var numLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        numLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
////        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGesture))
////        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
////        view.addGestureRecognizer(swipeRight)
//
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGesture))
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        view.addGestureRecognizer(swipeLeft)
        
    
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
    
    
    func userEnterMinMax(min: Int, max: Int) {
        
        minNum = min
        maxNum = max
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newNums()
    }
    
    func newNums(){
        
        userEnterMinMax(min: minNum, max: maxNum)
        let num = Int.random(in: minNum...maxNum)
        numLabel.setTitle(String(num), for: .normal)
        
    }
    
    
    
    @IBAction func numGeneratePressed(_ sender: UIButton) {
        
        newNums()
    
//        present(.animation, animated: true, completion: nil)
     
    }
    
//    @objc func responseToSwipeGesture(gesture: UISwipeGestureRecognizer){
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//            switch swipeGesture.direction {
////            case UISwipeGestureRecognizer.Direction.right:
////                print("Swiped right")
//            case UISwipeGestureRecognizer.Direction.left:
//                print("Swiped left")
//            default:
//                break
//            }
//        }
//    }
    
}

