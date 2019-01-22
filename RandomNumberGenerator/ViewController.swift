//
//  ViewController.swift
//  RandomNumberGenerator
//
//  Created by 掛川優希 on 1/21/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var numLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numGeneratePressed(_ sender: UIButton) {
        
        let num = Int.random(in: 1...10)
        
        
    }
    
}

