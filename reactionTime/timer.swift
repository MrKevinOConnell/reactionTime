//
//  timer.swift
//  reactionTime
//
//  Created by Kevin O'Connell on 12/15/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class timer: Timer {
   
    startTime: TimeInterval
    
    //Sart the timer
    startTime = NSDate.timeIntervalSinceReferenceDate()
    NSTimer.scheduledTimerWithTimeInterval(0.02,
    target: self,
    selector: Selector("advanceTimer:"),
    userInfo: nil,
    repeats: true)
    
    
    //And your  timer method...
    func advanceTimer(timer: Timer)
    {
        //Total time since timer started, in seconds
        self.time = NSDate.timeIntervalSinceReferenceDate() - startTime
        //The rest of your code goes here
    }
}
