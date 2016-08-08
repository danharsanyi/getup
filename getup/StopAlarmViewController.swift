//
//  StopAlarmViewController.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import UIKit
import AVFoundation

class StopAlarmViewController: UIViewController {

    @IBOutlet weak var motivImg: UIImageView!
    @IBOutlet weak var motivQuote: UILabel!
    @IBOutlet weak var textInputField: UITextField!
    
    var alarmToStop: Alarm!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomQuote(alarmToStop.motivType)
        generateRandomImage(alarmToStop.motivType)
        
    }
    
    @IBAction func textFieldEditingChanged(sender: AnyObject) {
        if textInputField.text!.lowercaseString == motivQuote.text!.lowercaseString {
            alarmToStop.alarmOn = false
            updateAlarmsArrayInMemory()
            alarmPlayer.stop()
            readyForAlarm = true
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func generateRandomQuote(motivType: Int) {
        if motivType == 0 {
            let randomNum = Int(arc4random_uniform(UInt32(maleFitnessQuotes.count)))
            let randQuote = maleFitnessQuotes[randomNum]
            motivQuote.text = randQuote
        } else if motivType == 1 {
            let randomNum = Int(arc4random_uniform(UInt32(femaleFitnessQuotes.count)))
            let randQuote = femaleFitnessQuotes[randomNum]
            motivQuote.text = randQuote
        } else if motivType == 2 {
            let randomNum = Int(arc4random_uniform(UInt32(businessQuotes.count)))
            let randQuote = businessQuotes[randomNum]
            motivQuote.text = randQuote
        } else if motivType == 3 {
            let randomNum = Int(arc4random_uniform(UInt32(inspriationQuotes.count)))
            let randQuote = inspriationQuotes[randomNum]
            motivQuote.text = randQuote
        }
    }
    
    func generateRandomImage(motivType: Int) {
        if motivType == 0 {
            let randomNum = Int(arc4random_uniform(UInt32(maleFitnessImages.count)))
            if let randImgUrl = NSURL(string: "\(maleFitnessImages[randomNum])") {
                if let data = NSData(contentsOfURL: randImgUrl) {
                    motivImg.image = UIImage(data: data)
                }
            }
        } else if motivType == 1 {
            let randomNum = Int(arc4random_uniform(UInt32(femaleFitnessImages.count)))
            if let randImgUrl = NSURL(string: "\(femaleFitnessImages[randomNum])") {
                if let data = NSData(contentsOfURL: randImgUrl) {
                    motivImg.image = UIImage(data: data)
                }
            }
        } else if motivType == 2 {
            let randomNum = Int(arc4random_uniform(UInt32(businessImages.count)))
            if let randImgUrl = NSURL(string: "\(businessImages[randomNum])") {
                if let data = NSData(contentsOfURL: randImgUrl) {
                    motivImg.image = UIImage(data: data)
                }
            }
        } else if motivType == 3 {
            let randomNum = Int(arc4random_uniform(UInt32(inspriationImages.count)))
            if let randImgUrl = NSURL(string: "\(inspriationImages[randomNum])") {
                if let data = NSData(contentsOfURL: randImgUrl) {
                    motivImg.image = UIImage(data: data)
                }
            }
        }
    }
}
