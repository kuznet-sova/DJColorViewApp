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
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var valueRedSwitch: UILabel!
    @IBOutlet var valueGreenSwitch: UILabel!
    @IBOutlet var valueBlueSwitch: UILabel!
    
    @IBOutlet var redSwitch: UISlider!
    @IBOutlet var greenSwitch: UISlider!
    @IBOutlet var blueSwitch: UISlider!
    
    var redColor: CGFloat = 0.0
    var greenColor: CGFloat = 0.0
    var blueColor: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
    }
    
    func mixColors() {
        let mixColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        djColorView.backgroundColor = mixColor
    }
    
    @IBAction func redSwitchScroll() {
        let newValueRedSwitch = Float(Int(redSwitch.value * 100)) / 100
        valueRedSwitch.text = String(newValueRedSwitch)
        
        djColorView.backgroundColor = .red
        djColorView.alpha = CGFloat(newValueRedSwitch)
        
        redColor = CGFloat(newValueRedSwitch)
        mixColors()
    }
    @IBAction func greenSwitchScroll() {
        let newValueGreenSwitch = Float(Int(greenSwitch.value * 100)) / 100
        valueGreenSwitch.text = String(newValueGreenSwitch)
        
        djColorView.backgroundColor = .green
        djColorView.alpha = CGFloat(newValueGreenSwitch)
        
        greenColor = CGFloat(newValueGreenSwitch)
        mixColors()
    }
    @IBAction func blueSwitchScroll() {
        let newValueBlueSwitch = Float(Int(blueSwitch.value * 100)) / 100
        valueBlueSwitch.text = String(newValueBlueSwitch)
        
        djColorView.backgroundColor = .blue
        djColorView.alpha = CGFloat(newValueBlueSwitch)
        
        blueColor = CGFloat(newValueBlueSwitch)
        mixColors()
    }
}

