//
//  ViewController.swift
//  TestSensor
//
//  Created by Andi Ikhsan Eldrian on 21/06/19.
//  Copyright © 2019 Andi Ikhsan Eldrian. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xGyro: UILabel!
    @IBOutlet weak var yGyro: UILabel!
    @IBOutlet weak var zGyro: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGyroscope()
    }

    func myGyroscope() {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.rotationRate.x
                let y = trueData.rotationRate.y
                let z = trueData.rotationRate.z
                self.xGyro.text = "x: \(Double(x).rounded(toDecimalPlaces: 3))"
                self.yGyro.text = "y: \(Double(y).rounded(toDecimalPlaces: 3))"
                self.zGyro.text = "z: \(Double(z).rounded(toDecimalPlaces: 3))"
                
            }
        }
        
    }

}

extension Double {
    func rounded(toDecimalPlaces n: Int) -> Double {
        let multiplier = pow(10, Double(n))
        return (multiplier * self).rounded()/multiplier
    }
}
