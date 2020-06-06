//
//  ViewController.swift
//  DJColorViewApp
//
//  Created by Ирина Кузнецова on 22.05.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class DJColorViewController: UIViewController {
    @IBOutlet var djColorView: UIView!
    
    @IBOutlet var valueRedSlider: UILabel!
    @IBOutlet var valueGreenSlider: UILabel!
    @IBOutlet var valueBlueSlider: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var backgroundColorStartView: UIColor?
    var delegateColorView: DJColorViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
        djColorView.backgroundColor = backgroundColorStartView
    }
    
    func mixColors() {
        let mixColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )

        djColorView.backgroundColor = mixColor
    }
    
    @IBAction func valueColorSlider() {
        valueRedSlider.text = String(
            format: "%.2f",
            Float(redSlider.value)
        )
        valueGreenSlider.text = String(
            format: "%.2f",
            Float(greenSlider.value)
        )
        valueBlueSlider.text = String(
            format: "%.2f",
            Float(blueSlider.value)
        )
        
        mixColors()
    }
    
    @IBAction func doneButton() {
        delegateColorView.startViewColor(djColorView.backgroundColor!)
        dismiss(animated: true)
    }
}
