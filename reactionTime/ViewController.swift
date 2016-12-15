//
//  ViewController.swift
//  reactionTime
//
//  Created by Kevin O'Connell on 12/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timing = randomizeTheTime()

   
    @IBOutlet weak var instructions: UITextView!

    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0

    
    

    
        override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.blue
            instructions.backgroundColor = UIColor.blue
           //starts the game at blue
    }
    
    @IBAction func startButton(_ sender: AnyObject) {
    
   
        view.backgroundColor = UIColor.red
        self.instructions.backgroundColor = UIColor.red
        //tells the text background to change to red, below tells it to change its text to "Wait."
        
        self.instructions.text = "wait.."
        
                //gives If statement, if true game is ended early
        
        //below randomizes the numbers, than changes the background to green, and lets the
        
        let randomIndex = Int(arc4random_uniform(UInt32(10)))
        let afterTime = DispatchTime.now() + .seconds(randomIndex)
        DispatchQueue.main.asyncAfter(deadline: afterTime)
        {
           self.startTime = Date().timeIntervalSinceReferenceDate
            self.view.backgroundColor = UIColor.green
            self.instructions.text = "click"
            self.instructions.backgroundColor = UIColor.green
            self.clicked()
            self.timing.numberOfTries = 1
            self.timing.numberOfTries  += 1
            
print("randomize")
        }
        //gives the user his ending time
        
        
    }


    func onTapped(_ sender: UITapGestureRecognizer) {
        if view.backgroundColor == UIColor.red {
            
            self.clicked(timing.onTime = false)
            timer?.invalidate()

        }
       
        if view.backgroundColor == UIColor.green  {
            self.clicked(timing.onTime = true)
            
            timer?.invalidate()
                   }
        

  }


    //for every click a try is added
    func clicked() {
        time = Date().timeIntervalSinceReferenceDate - startTime

print(time)
        
        if timing.numberOfTries == 2 && timing.onTime == true    {
                
            whatWasYourTime("Your time was " + String(format: "%.2f", time))
            time = Date().timeIntervalSinceReferenceDate - startTime

                print("ayy") }
        
            if timing.onTime == false {
                whatWasYourTime("You clicked too early!")
                
                time = Date().timeIntervalSinceReferenceDate - startTime


                print("nah") }
          }
    
   //adds the alert
            func whatWasYourTime(_ time:String)
        {
            let alert = UIAlertController(title:time
        , message: nil, preferredStyle: UIAlertControllerStyle.alert)
          let resetButton = UIAlertAction(title: "Let's see what you are!", style: .default, handler: { (sender) in

            self.timing.numberOfTries = 0
            self.instructions.backgroundColor = UIColor.blue
            self.view.backgroundColor = UIColor.blue
            self.instructions.text = ""
            
                })
            alert.addAction(resetButton)
                self.present(alert, animated: true, completion: nil )}
    
    
    
    
}
