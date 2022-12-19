//
//  ViewController.swift
//  Fitness
//
//  Created by Ali Asif Zuberi on 2021-02-14.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    @IBOutlet weak var DateLbl: UILabel!
    
    @IBOutlet weak var StepNumberLbl: UILabel!
    
   
    
    @IBOutlet weak var waterNumberLbl: UILabel!
    
    var days:[String] = []
        var stepsTaken:[Int] = []
    var currentGlass = 0
    
    let activityManager = CMMotionActivityManager()
        let pedoMeter = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DateLbl.text = ("\(Date())xboxnhl")
       
        var cal = NSCalendar.current
        
        var comps = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: NSDate() as Date)
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let timeZone = NSTimeZone.system
        cal.timeZone = timeZone
        
        let midnightOfToday = cal.date(from: comps)!
        
        
        if (CMPedometer.isStepCountingAvailable()) {
            let fromDate = NSDate(timeIntervalSinceNow: -86400 * 7)
            self.pedoMeter.queryPedometerData(from: fromDate as Date, to: NSDate() as Date) { (data : CMPedometerData!, error) -> Void in
                            print(data)
        
                DispatchQueue.main.async {
                    if (error == nil){
                        self.StepNumberLbl.text = ("\(data.numberOfSteps)")
                    }
                }
    
        
        
            }
            
            self.pedoMeter.startUpdates(from: midnightOfToday) { (data: CMPedometerData!, error) in
                DispatchQueue.main.async {
                    if (error == nil) {
                        self.StepNumberLbl.text = ("\(data.numberOfSteps)")
                        self.waterNumberLbl.text = ("\(0)")
                    }
                }
            }
   
        
    }
        
    }

    @IBAction func addbtn(_ sender: Any) {
        
        
        
        self.currentGlass += 1
        
        waterNumberLbl.text = ("\(currentGlass)")
             
    }
    @IBAction func minusbtn(_ sender: Any) {
        
        waterNumberLbl.text = ("\(currentGlass - 1)")
    }
    
}

