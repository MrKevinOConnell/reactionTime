//
//  ViewController.swift
//  reactionTime
//
//  Created by Kevin O'Connell on 12/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
var time = timer()
class ViewController: UIViewController {
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    @IBAction func startButton(_ sender: UIButton) {
    
    view.backgroundColor = UIColor.red
        //changes background color to red
    func randomTimer() -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(10)))
        print(randomIndex)
       
        let counter = 10
        var myTimer = counter + randomIndex
        
        var randomTime = myTimer + randomIndex
        return randomTime }
   
    }
    if randomTimer() {
    view.backgroundColor = UIColor.green }

    @IBAction func endButton(_ sender: UIButton) {
    
               
    
            
        }
         
            
            
        
    
   
    
    
        
        
               }
        
            
    
