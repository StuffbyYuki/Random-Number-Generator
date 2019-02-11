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

class ViewController2: UIViewController {

    var delegate : MinMaxChangeDelegate?
    
   
    
    @IBOutlet weak var minTextFiled: UITextField!
    @IBOutlet weak var maxTextField: UITextField!

    
    
    @IBAction func backToMain(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    


    
    @IBAction func settingsSaved(_ sender: UIButton) {
        
        if let minEntered: Int? = Int(minTextFiled.text!), let maxEntered: Int? = Int(maxTextField.text!) {
            delegate?.userEnterMinMax(min: minEntered!, max: maxEntered!)
        self.dismiss(animated: true, completion: nil)
        } else {
            print("error in updating the new min and max...")
        }
    }
    

}
