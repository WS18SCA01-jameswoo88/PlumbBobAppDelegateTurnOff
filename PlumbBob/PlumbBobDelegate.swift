//
//  PlumbBobDelegate.swift
//  PlumbBob
//
//  Created by Mark Meretzky on 1/31/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import Foundation;
import CoreGraphics;   //needed for CGFloat;

//Whenever the primary object (i.e., the PlumbBob object) receives a new angle from the
//accelerometer hardware, the primary object will pass this new angle along to the delegate
//object by calling the angleUpdated(to:) method of the delegate object.
//So the delegate object absolutely must have a method named angleUpdated(to:).

protocol PlumbBobDelegate {
    func angleUpdated(to angle: CGFloat);   //in radians
}
