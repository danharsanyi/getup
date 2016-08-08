//
//  FirstViewController.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {

    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var colonLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var amPMLbl: UILabel!
    
    var currentDate = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let dateFormatter = NSDateFormatter()
    var convertedTime: NSDate!
    var currentTimeInt: Int!
    var checkingForAlarm: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let loadedAlarms = NSUserDefaults.standardUserDefaults().objectForKey("alarms") as? NSData {
            alarms = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedAlarms) as? [Alarm])!
        }
        
        updateTime()
        makeAudioSession()
        
        let timer = NSTimer.self
        timer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.updateTime), userInfo: nil, repeats: true)
        
        timer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.flashColon), userInfo: nil, repeats: true)
        
        timer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.checkForAlarm), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        readyForAlarm = true
    }
    
    func makeAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func generateRandomMusic(){
        let randomNum = Int(arc4random_uniform(UInt32(5)))
        do {
            try alarmPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(randomNum)", ofType: "mp3")!))
        } catch let err as NSError {
            print(err.debugDescription)
        }
        alarmPlayer.prepareToPlay()
        alarmPlayer.play()
    }
    
    
    func flashColon(){
        if colonLbl.layer.opacity == 1.0 {
            colonLbl.layer.opacity = 0.2
        } else {
            colonLbl.layer.opacity = 1.0
        }
        
    }
    
    func updateTime() {
        currentDate = NSDate()
        
        let dateComponents = calendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute], fromDate: currentDate)
        
        currentTimeInt = Int("\(dateComponents.hour)\(dateComponents.minute)")
        
        if dateComponents.hour == 13 {
            hourLbl.text = "1"
        } else if dateComponents.hour == 14 {
            hourLbl.text = "2"
        } else if dateComponents.hour == 15 {
            hourLbl.text = "3"
        } else if dateComponents.hour == 16 {
            hourLbl.text = "4"
        } else if dateComponents.hour == 17 {
            hourLbl.text = "5"
        } else if dateComponents.hour == 18 {
            hourLbl.text = "6"
        } else if dateComponents.hour == 19 {
            hourLbl.text = "7"
        } else if dateComponents.hour == 20 {
            hourLbl.text = "8"
        } else if dateComponents.hour == 21 {
            hourLbl.text = "9"
        } else if dateComponents.hour == 22 {
            hourLbl.text = "10"
        } else if dateComponents.hour == 23 {
            hourLbl.text = "11"
        } else if dateComponents.hour == 0 {
            hourLbl.text = "12"
        } else {
            hourLbl.text = "\(dateComponents.hour)"
        }
        
        colonLbl.text = ":"
        
        if dateComponents.minute <= 9 {
            minuteLbl.text = "0\(dateComponents.minute)"
        } else {
            minuteLbl.text = "\(dateComponents.minute)"
        }
        
        
        if dateComponents.hour >= 12 {
            amPMLbl.text = "PM"
        } else {
            amPMLbl.text = "AM"
        }
    }
    
    func checkForAlarm() {
        
        let allAlarmsArray = alarms
        for alarm in allAlarmsArray {
            
            if alarm.alarmToCheck == currentTimeInt && alarm.alarmOn == true && readyForAlarm == true {
                print("ALARM FIRED")
                generateRandomMusic()
                readyForAlarm = false
                performSegueWithIdentifier("alarmTriggered", sender: alarm)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "alarmTriggered" {
            if let alarmVC = segue.destinationViewController as? StopAlarmViewController {
                if let alarm = sender as? Alarm {
                    alarmVC.alarmToStop = alarm
                }
            }
        }
    }
    
}

