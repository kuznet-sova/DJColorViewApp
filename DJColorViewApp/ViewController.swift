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
    
    var redColor: CGFloat = 0.00
    var greenColor: CGFloat = 0.00
    var blueColor: CGFloat = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
        
        redSlider.value = 0.00
        valueRedSlider.text = "0.00"
        greenSlider.value = 0.00
        valueGreenSlider.text = "0.00"
        blueSlider.value = 0.00
        valueBlueSlider.text = "0.00"
        
    }
    
    func mixColors() {
        let mixColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        if redSlider.value == 0.00 && greenSlider.value == 0.00 && blueSlider.value == 0.00 {
            djColorView.backgroundColor = .white
        } else {
            djColorView.backgroundColor = mixColor
        }
    }
    
    @IBAction func redSliderScroll() {
        let newValueRedSlider = Float(Int(redSlider.value * 100)) / 100
        valueRedSlider.text = String(newValueRedSlider)
        
        djColorView.backgroundColor = .red
        djColorView.alpha = CGFloat(newValueRedSlider)
        
        redColor = CGFloat(newValueRedSlider)
        mixColors()
    }
    @IBAction func greenSliderScroll() {
        let newValueGreenSlider = Float(Int(greenSlider.value * 100)) / 100
        valueGreenSlider.text = String(newValueGreenSlider)
        
        djColorView.backgroundColor = .green
        djColorView.alpha = CGFloat(newValueGreenSlider)
        
        greenColor = CGFloat(newValueGreenSlider)
        mixColors()
    }
    @IBAction func blueSliderScroll() {
        let newValueBlueSlider = Float(Int(blueSlider.value * 100)) / 100
        valueBlueSlider.text = String(newValueBlueSlider)
        
        djColorView.backgroundColor = .blue
        djColorView.alpha = CGFloat(newValueBlueSlider)
        
        blueColor = CGFloat(newValueBlueSlider)
        mixColors()
    }
}

