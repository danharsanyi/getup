//
//  SecondViewController.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SecondViewController.reloadTable), name: "NOTIF_ALARM_ADDED" , object: nil)
        
        if let loadedAlarms = NSUserDefaults.standardUserDefaults().objectForKey("alarms") as? NSData {
            alarms = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedAlarms) as? [Alarm])!
        }
    }
    
    
    func titleForEmptyDataSet(scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Tap the '+' button above to add your first motivational alarm!"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView) -> NSAttributedString? {
        let str = "\n Set your alarm time and type of motivational quote and epic wake up music will be chosen for you.\n\n Make sure you leave your phone in clock mode and change your autolock settings (Settings -> General -> Auto-Lock -> Never) for the alarm to go off!"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let alarm = alarms[indexPath.row]
                
        if let cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell") as? AlarmCell {
            
            cell.configureCell(alarm, hour: alarm.hour, min: alarm.minute, meridiem: alarm.meridiem, activeStatus: alarm.alarmOn, motiv: alarm.motivType)
            
            cell.leftButtons =
                [MGSwipeButton(title: "Edit", backgroundColor: UIColor.init(red: 0.35, green: 0.35, blue: 0.35, alpha: 1.00), callback: {
                    (sender: MGSwipeTableCell!) -> Bool in
                    self.performSegueWithIdentifier("editAlarm", sender: alarm)
                    return true
                })
                    ,MGSwipeButton(title: "Delete", backgroundColor: UIColor.init(red: 0.89, green: 0.26, blue: 0.24, alpha: 1.00), callback: {
                        (sender: MGSwipeTableCell!) -> Bool in
                        alarms.removeAtIndex(indexPath.row)
                        updateAlarmsArrayInMemory()
                        self.reloadTable()
                        return true
                    })]
            cell.leftSwipeSettings.transition = MGSwipeTransition.Border
            
            return cell
        } else {
            return AlarmCell()
        }
    }
    
    func reloadTable(){
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editAlarm" {
            if let editingVC = segue.destinationViewController as? SetEditAlarmViewController {
                if let alarm = sender as? Alarm {
                    editingVC.alarmToEdit = alarm
                }
            }
        }
    }
}

