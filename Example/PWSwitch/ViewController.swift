//
//  ViewController.swift
//  PWSwitch
//
//  Created by Nikita Shanin on 08/30/2016.
//  Copyright (c) 2016 Nikita Shanin. All rights reserved.
//

import UIKit
import PWSwitch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pwSwitch = PWSwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 26))
        pwSwitch.setOn(true, animated: true)
        pwSwitch.addTarget(self, action: #selector(self.onSwitchChanged), forControlEvents: .ValueChanged)
        if pwSwitch.on {
            //do something is switch is on
        }
        view.addSubview(pwSwitch)
    }

    func onSwitchChanged() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

