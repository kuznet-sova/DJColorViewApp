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
    
    @IBOutlet var valueRedSlider: UILabel!
    @IBOutlet var valueGreenSlider: UILabel!
    @IBOutlet var valueBlueSlider: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var redColor: CGFloat = 0.0
    var greenColor: CGFloat = 0.0
    var blueColor: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
        
        redSlider.value = 0.0
        valueRedSlider.text = "0.0"
        greenSlider.value = 0.0
        valueGreenSlider.text = "0.0"
        blueSlider.value = 0.0
        valueBlueSlider.text = "0.0"
        
        mixColors()
        
    }
    
    func mixColors() {
        let mixColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        if redSlider.value == 0.0 && greenSlider.value == 0.0 && blueSlider.value == 0.0 {
            djColorView.backgroundColor = .white
        } else {
            djColorView.backgroundColor = mixColor
        }
    }
    
    @IBAction func redSwitchScroll() {
        let newValueRedSwitch = Float(Int(redSlider.value * 100)) / 100
        valueRedSlider.text = String(newValueRedSwitch)
        
        djColorView.backgroundColor = .red
        djColorView.alpha = CGFloat(newValueRedSwitch)
        
        redColor = CGFloat(newValueRedSwitch)
        mixColors()
    }
    @IBAction func greenSwitchScroll() {
        let newValueGreenSwitch = Float(Int(greenSlider.value * 100)) / 100
        valueGreenSlider.text = String(newValueGreenSwitch)
        
        djColorView.backgroundColor = .green
        djColorView.alpha = CGFloat(newValueGreenSwitch)
        
        greenColor = CGFloat(newValueGreenSwitch)
        mixColors()
    }
    @IBAction func blueSwitchScroll() {
        let newValueBlueSwitch = Float(Int(blueSlider.value * 100)) / 100
        valueBlueSlider.text = String(newValueBlueSwitch)
        
        djColorView.backgroundColor = .blue
        djColorView.alpha = CGFloat(newValueBlueSwitch)
        
        blueColor = CGFloat(newValueBlueSwitch)
        mixColors()
    }
}

