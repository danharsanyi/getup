//
//  AlarmCell.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class AlarmCell: MGSwipeTableCell {

    @IBOutlet weak var alarmHourLbl: UILabel!
    @IBOutlet weak var alarmMinuteLbl: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var alarmTypeLbl: UILabel!
    @IBOutlet weak var alarmAMpmLbl: UILabel!
    @IBOutlet weak var motivTypeLbl: UILabel!
    
    var alarm: Alarm!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(alarm: Alarm, hour: String, min: String, meridiem: String, activeStatus: Bool, motiv: Int) {
        self.alarm = alarm
        
        self.alarmHourLbl.text = hour
        self.alarmMinuteLbl.text = min
        self.alarmAMpmLbl.text = meridiem
        self.alarmSwitch.on = activeStatus
        
        if motiv == 0 {
            self.motivTypeLbl.text = "Male Fitness"
        } else if motiv == 1 {
            self.motivTypeLbl.text = "Female Fitness"
        } else if motiv == 2 {
            self.motivTypeLbl.text = "Business"
        } else if motiv == 3 {
            self.motivTypeLbl.text = "Inspiration"
        }
    }
    
    @IBAction func alarmStatusChanged(sender: UISwitch) {
        if sender.on == true {
            self.alarm.alarmOn = true
        } else {
            self.alarm.alarmOn = false
        }
        updateAlarmsArrayInMemory()
    }
}
