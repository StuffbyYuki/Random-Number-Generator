//
//  ViewController2.swift
//  RandomNumberGenerator
//
//  Created by 掛川優希 on 1/23/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit

protocol MinMaxChangeDelegate{
    func userEnterMinMax(min: Int, max: Int)
}

class ViewController2: UIViewController, UITextFieldDelegate {

    var delegate : MinMaxChangeDelegate?
    
   
    
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupTextField()
        
    }
    
    func setupTextField(){
        minTextField.delegate = self
        maxTextField.delegate = self
        
        minTextField.keyboardType = .numberPad
        maxTextField.keyboardType = .numberPad
        
        minTextField.adjustsFontSizeToFitWidth = true
        maxTextField.adjustsFontSizeToFitWidth = true
        
        
    }
    
    
    @IBAction func backToMain(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        updateNewNums()
        
        return true
    }
   

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func settingsSaved(_ sender: UIButton) {
        
        updateNewNums()
       
    }
    
    
    func updateNewNums(){
        
        if let minEntered: Int = Int(minTextField.text ?? "1"), let maxEntered: Int = Int(maxTextField.text ?? "10") {
            
            if minEntered >= maxEntered {
                let alert = UIAlertController(title: "Error", message: "Max has to be bigger than Min", preferredStyle: .alert)
                let action = UIAlertAction(title: "Dismiss", style: .default) { (action) in

                }
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                
            } else {
                
                delegate?.userEnterMinMax(min: minEntered , max: maxEntered)
                self.view.endEditing(true)
                self.dismiss(animated: true, completion: nil)
                
            }

            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a legitimate number", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Dismiss", style: .default) { (action) in
            
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    

}
