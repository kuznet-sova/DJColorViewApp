//
//  ViewController.swift
//  DJColorViewApp
//
//  Created by Ирина Кузнецова on 22.05.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var djColorView: UIView!
    
    @IBOutlet var valueRedSwitch: UILabel!
    @IBOutlet var valueGreenSwitch: UILabel!
    @IBOutlet var valueBlueSwitch: UILabel!
    
    @IBOutlet var redSwitch: UISlider!
    @IBOutlet var greenSwitch: UISlider!
    @IBOutlet var blueSwitch: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
    }

    @IBAction func redSwitchScroll() {
        let newValueRedSwitch = Float(Int(redSwitch.value * 100)) / 100
        valueRedSwitch.text = String(newValueRedSwitch)
        
        djColorView.backgroundColor = .red
        djColorView.alpha = CGFloat(newValueRedSwitch)
    }
    @IBAction func greenSwitchScroll() {
        let newValueGreenSwitch = Float(Int(greenSwitch.value * 100)) / 100
        valueGreenSwitch.text = String(newValueGreenSwitch)
        
        djColorView.backgroundColor = .green
        djColorView.alpha = CGFloat(newValueGreenSwitch)
    }
    @IBAction func blueSwitchScroll() {
        let newValueBlueSwitch = Float(Int(blueSwitch.value * 100)) / 100
        valueBlueSwitch.text = String(newValueBlueSwitch)
        
        djColorView.backgroundColor = .blue
        djColorView.alpha = CGFloat(newValueBlueSwitch)
    }
}

