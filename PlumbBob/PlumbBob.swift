//
//  PlumbBob.swift
//  PlumbBob
//
//  Created by Mark Meretzky on 1/31/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;
import CoreMotion;   //needed for CMMotionManager

class PlumbBob: NSObject {
    let motionManager: CMMotionManager = CMMotionManager();
    var timer: Timer? = nil;
    var delegate: PlumbBobDelegate? = nil;

    var angle: Double? {
        didSet {
            if let angle: Double = angle {
                //If the PlumbBob has a delegate, call this method of the delegate.
                delegate?.angleUpdated(to: CGFloat(angle));
            }
        }
    }
    
    override init() {
        super.init();

        guard motionManager.isAccelerometerAvailable else {
            fatalError("accelerometer hardware not available");
        }
        motionManager.accelerometerUpdateInterval = 1.0 / 60.0;   //60 times per second
    }

    func turnOn() {
        motionManager.startAccelerometerUpdates();
        
        //Put a new value into the angle property 60 times per second.
        
        timer = Timer(
            fire: Date(),                                        //Start right now.
            interval: motionManager.accelerometerUpdateInterval, //60 times per second
            repeats: true,
            block: {(timer: Timer) in
                // Get the accelerometer data and store it in the angle property.
                if let data: CMAccelerometerData = self.motionManager.accelerometerData {
                    self.angle = -atan2(data.acceleration.x, -data.acceleration.y);
                }
            }
        );
        
        // Add the timer to the current run loop.
        RunLoop.current.add(timer!, forMode: .default);
    }
    
    func turnOff() {
        motionManager.stopAccelerometerUpdates();
    }
}
