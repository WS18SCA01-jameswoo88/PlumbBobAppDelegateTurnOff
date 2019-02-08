//
//  ViewController.swift
//  PlumbBob
//
//  Created by Mark Meretzky on 1/31/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController, PlumbBobDelegate {

    let plumbBob: PlumbBob = PlumbBob();
    @IBOutlet weak var arrowLabel: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        //The plumbBob object will call the angleUpdated(to:) method of some object.
        //Which object will it be?
        plumbBob.delegate = self;   //self is the ViewController object.
    }
    
    //Turn on the plumbBob object at the last possible moment.
    
    override func viewDidAppear(_ animated: Bool) {
        plumbBob.turnOn();
    }
    
    //Turn off the plumbBob object at the first possible moment.
    
    override func viewWillDisappear(_ animated: Bool) {
        plumbBob.turnOff();
        print("did swipe up work?")
    }
    
    //Called by the PlumbBob object whenever it has a new angle.
    
    func angleUpdated(to angle: CGFloat) {
        //Rotate the arrow so it points straight down.
        arrowLabel.transform = CGAffineTransform(rotationAngle: angle);
    }
    
}
