//
//  ViewController.swift
//  reactionTime
//
//  Created by Kevin O'Connell on 12/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
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
        //tells the text view's background color to change to red,
        
        self.instructions.text = "wait.."
        //tells the text view  to change its text to "Wait."

        
        
        
        //below randomizes when the game begins. Text fields change, background turns to green, etc.
        
        let randomIndex = Int(arc4random_uniform(UInt32(7)))
        let afterTime = DispatchTime.now() + .seconds(randomIndex)
        DispatchQueue.main.asyncAfter(deadline: afterTime)
        {
        self.startTime = Date().timeIntervalSinceReferenceDate
        self.clicked()
        self.view.backgroundColor = UIColor.green
        self.instructions.text = "click"
        self.instructions.backgroundColor = UIColor.green
        self.timing.numberOfTries = 1
        self.timing.numberOfTries  += 1
        print("randomize")
        }
}


    func onTapped(_ sender: UITapGestureRecognizer) {
        

        if view.backgroundColor == UIColor.red
            
            //tells game to end if user clicks when red,also enters in poop emoji.
        {
    self.clicked(timing.onTime = false)
            imageView.image = UIImage(named:"poop")
        }
        
        timer?.invalidate()
        //tells timer to stop
        
        if view.backgroundColor == UIColor.green
    {
    self.clicked(timing.onTime = true)
    //tells game if background is green than its good to go to click
    }
}


    //for every click a try is added
    func clicked() {
        time = Date().timeIntervalSinceReferenceDate - startTime
//gives the user the time
print(time)
        
        if timing.numberOfTries == 2 && timing.onTime == true    {
            
            whatWasYourTime("Your time was " + String(format: "%.3f", time) + " seconds")
                            print("ayy") } //prints out the reaction time in 3 decimal points. 
        //ex. 0.465 seconds
        
        
        
        if timing.onTime == false {
                whatWasYourTime("You clicked too early! Please wait til the background turns green to try again, you may have to click this twice.")
                
                //tells system that user clicked when background was red, which ends game.
                print("nah") }
        
        
        
       
        //gives user a image to provide feedback on how fast they reacted
        if time >= 0.01 && time <= 0.23  {
             imageView.image = UIImage(named:"GOAT")
        }
        if time >= 0.24 && time <= 0.49 {
             imageView.image = UIImage(named:"goodJob")
        }
        if time >= 0.5 && time <= 0.8 {
            imageView.image = UIImage(named: "average")
        }
        if time >= 0.8 {
            imageView.image = UIImage(named: "poop")
        }
    
          }
    
   //adds the alert
            func whatWasYourTime(_ time:String)
        {
            let alert = UIAlertController(title:time
        , message: nil, preferredStyle: UIAlertControllerStyle.alert)
          let resetButton = UIAlertAction(title: "play again", style: .default, handler: { (sender) in
            
            self.instructions.backgroundColor = UIColor.blue
            self.view.backgroundColor = UIColor.blue
            self.instructions.text = ""
        self.clicked(self.timing.numberOfTries = 1)
            self.clicked(self.timing.onTime = true)
            self.imageView.image = UIImage(named: "")
            
            //resets game
        

            
                })
            alert.addAction(resetButton)
                self.present(alert, animated: true, completion: nil )}
    //adds reset button to alert
    
}
