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
        mixColors()
    }
    
    func mixColors() {
        let mixColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        
        if redSlider.value == 0 && greenSlider.value == 0 && blueSlider.value == 0 {
            djColorView.backgroundColor = .black
        } else {
            djColorView.backgroundColor = mixColor
        }
    }
    
    @IBAction func redSliderScroll() {
        valueRedSlider.text = String(format: "%.2f", Float(redSlider.value))
        redColor = CGFloat(redSlider.value)
        mixColors()
    }
    @IBAction func greenSliderScroll() {
        valueGreenSlider.text = String(format: "%.2f", Float(greenSlider.value))
        greenColor = CGFloat(greenSlider.value)
        mixColors()
    }
    @IBAction func blueSliderScroll() {
        valueBlueSlider.text = String(format: "%.2f", Float(blueSlider.value))
        blueColor = CGFloat(blueSlider.value)
        mixColors()
    }
}
