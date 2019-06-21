//
//  SecondViewController.swift
//  TestSensor
//
//  Created by Andi Ikhsan Eldrian on 21/06/19.
//  Copyright © 2019 Andi Ikhsan Eldrian. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController {

    @IBOutlet weak var xAccel: UILabel!
    @IBOutlet weak var yAccel: UILabel!
    @IBOutlet weak var zAccel: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAccelerometer()
    }
    
    func myAccelerometer() {
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in print("Accel :\(data as Any)")
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                self.xAccel.text = "x: \(Double(x).rounded(toDecimalPlaces: 3))"
                self.yAccel.text = "y: \(Double(y).rounded(toDecimalPlaces: 3))"
                self.zAccel.text = "z: \(Double(z).rounded(toDecimalPlaces: 3))"
                
            }
        }
    }
    
}
