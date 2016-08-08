//
//  Alarm.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import Foundation

class Alarm: NSObject, NSCoding {
    private var _hour: String!
    private var _minute: String!
    private var _meridiem: String!
    private var _alarmToCheck: Int!
    private var _alarmOn: Bool!
    private var _alarmNSDateVersion: NSDate!
    private var _motivType: Int!
    
    var hour: String {
        return _hour
    }
    
    var minute: String {
        return _minute
    }
    
    var meridiem: String {
        return _meridiem
    }
    
    var alarmToCheck: Int {
        return _alarmToCheck
    }
    
    var alarmOn: Bool {
        get {
            return _alarmOn
        }
        
        set {
            _alarmOn = newValue
        }
    }
    
    var alarmNSDateVersion: NSDate {
        return _alarmNSDateVersion
    }
    
    var motivType: Int {
        return _motivType
    }
    
    override init() {
        
    }
    
    init(hour: String, min: String, meridiem: String, check: Int, active: Bool, date: NSDate, motiv: Int) {
        self._hour = hour
        self._minute = min
        self._meridiem = meridiem
        self._alarmToCheck = check
        self._alarmOn = active
        self._alarmNSDateVersion = date
        self._motivType = motiv
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._hour = aDecoder.decodeObjectForKey("hour") as? String
        self._minute = aDecoder.decodeObjectForKey("minute") as? String
        self._meridiem = aDecoder.decodeObjectForKey("meridiem") as? String
        self._alarmToCheck = aDecoder.decodeObjectForKey("alarmToCheck") as? Int
        self._alarmOn = aDecoder.decodeObjectForKey("alarmOn") as? Bool
        self._alarmNSDateVersion = aDecoder.decodeObjectForKey("alarmNSDateVersion") as? NSDate
        self._motivType = aDecoder.decodeObjectForKey("motivType") as? Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._hour, forKey: "hour")
        aCoder.encodeObject(self._minute, forKey: "minute")
        aCoder.encodeObject(self._meridiem, forKey: "meridiem")
        aCoder.encodeObject(self._alarmToCheck, forKey: "alarmToCheck")
        aCoder.encodeObject(self._alarmOn, forKey: "alarmOn")
        aCoder.encodeObject(self._alarmNSDateVersion, forKey: "alarmNSDateVersion")
        aCoder.encodeObject(self._motivType, forKey: "motivType")
    }
    
}
