//
//  AlarmViewController.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import UIKit

class SetEditAlarmViewController: UIViewController {

    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    @IBOutlet weak var maleMotivBtn: UIButton!
    @IBOutlet weak var femaleMotivBtn: UIButton!
    @IBOutlet weak var businessMotivBtn: UIButton!
    @IBOutlet weak var selfImproveBtn: UIButton!
    @IBOutlet weak var saveAlarmBtn: UIButton!
    
    
    var alarmHour: Int!
    var alarmMinute: Int!
    var alarmHourToSave: String!
    var alarmMinuteToSave: String!
    var meridiem: String!
    var alarmInt: Int!
    var alarmToEdit: Alarm?
    var motivType: Int!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleMotivBtn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        femaleMotivBtn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        businessMotivBtn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        selfImproveBtn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        
        saveAlarmBtn.layer.cornerRadius = 2
        saveAlarmBtn.clipsToBounds = true
        
        alarmTimePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        
       NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SetEditAlarmViewController.showMessageToType), name: "NOTIF_WAKEUP" , object: nil)
        
        motivType = maleMotivBtn.tag
        
        if alarmToEdit != nil {
            alarmTimePicker.setDate((alarmToEdit?.alarmNSDateVersion)!, animated: true)
            
            if (alarmToEdit?.motivType)! == 0 {
                motivType = maleMotivBtn.tag
                toggleOpacity(self.maleMotivBtn)
            } else if (alarmToEdit?.motivType)! == 1 {
                motivType = femaleMotivBtn.tag
                toggleOpacity(self.femaleMotivBtn)
            } else if (alarmToEdit?.motivType)! == 2 {
                motivType = businessMotivBtn.tag
                toggleOpacity(self.businessMotivBtn)
            } else if (alarmToEdit?.motivType)! == 3 {
                motivType = selfImproveBtn.tag
                toggleOpacity(self.selfImproveBtn)
            }
        }
    }
    
    func showMessageToType() {
        let vc: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("StopAlarmViewController") as! StopAlarmViewController
        showViewController(vc as! UIViewController, sender: self)
    }
    
    func toggleOpacity(sender: UIButton) {
        self.maleMotivBtn.layer.opacity = 1.0
        self.femaleMotivBtn.layer.opacity = 1.0
        self.businessMotivBtn.layer.opacity = 1.0
        self.selfImproveBtn.layer.opacity = 1.0
        sender.layer.opacity = 0.5
    }
    
    @IBAction func maleFitnessBtnPressed(sender: UIButton) {
        motivType = maleMotivBtn.tag
        toggleOpacity(self.maleMotivBtn)
    }
    
    @IBAction func femaleFitnessBtnPressed(sender: UIButton) {
        motivType = femaleMotivBtn.tag
        toggleOpacity(self.femaleMotivBtn)
    }
    
    @IBAction func educationBtnPressed(sender: UIButton) {
        motivType = businessMotivBtn.tag
        toggleOpacity(self.businessMotivBtn)
    }
    
    @IBAction func inspoBtnPressed(sender: UIButton) {
        motivType = selfImproveBtn.tag
        toggleOpacity(self.selfImproveBtn)
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        if let loadedAlarms = NSUserDefaults.standardUserDefaults().objectForKey("alarms") as? NSData {
            alarms = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedAlarms) as? [Alarm])!
        }
        
        let alarmDate = alarmTimePicker.date
        
        alarmHour = alarmTimePicker.calendar.component(NSCalendarUnit.Hour, fromDate: alarmDate)
        alarmMinute = alarmTimePicker.calendar.component(NSCalendarUnit.Minute, fromDate: alarmDate)
        
        alarmInt = Int("\(alarmHour)\(alarmMinute)")
        
        if alarmHour >= 12 {
            meridiem = "PM"
        } else {
            meridiem = "AM"
        }
        
        if alarmHour == 13 {
            alarmHourToSave = "1"
        } else if alarmHour == 14 {
            alarmHourToSave = "2"
        } else if alarmHour == 15 {
            alarmHourToSave = "3"
        } else if alarmHour == 16 {
            alarmHourToSave = "4"
        } else if alarmHour == 17 {
            alarmHourToSave = "5"
        } else if alarmHour == 18 {
            alarmHourToSave = "6"
        } else if alarmHour == 19 {
            alarmHourToSave = "7"
        } else if alarmHour == 20 {
            alarmHourToSave = "8"
        } else if alarmHour == 21 {
            alarmHourToSave = "9"
        } else if alarmHour == 22 {
            alarmHourToSave = "10"
        } else if alarmHour == 23 {
            alarmHourToSave = "11"
        } else if alarmHour == 0 {
            alarmHourToSave = "12"
        } else {
            alarmHourToSave = "\(alarmHour)"
        }
        
        if alarmMinute <= 9 {
            alarmMinuteToSave = "0\(alarmMinute)"
        } else {
           alarmMinuteToSave = "\(alarmMinute)"
        }
        
        
        let alarm = Alarm(hour: alarmHourToSave, min: alarmMinuteToSave, meridiem: meridiem, check: alarmInt, active: true, date: alarmDate, motiv: motivType)
        
        if alarmToEdit != nil {
            var alarmIndex = 0
            for al in alarms {
                if al.alarmNSDateVersion == alarmToEdit?.alarmNSDateVersion {
                    alarms.removeAtIndex(alarmIndex)
                    alarms.insert(alarm, atIndex: alarmIndex)
                }
                alarmIndex += 1
            }
        } else {
            alarms.append(alarm)
        }
        
        updateAlarmsArrayInMemory()
        
        alarmToEdit = nil
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
