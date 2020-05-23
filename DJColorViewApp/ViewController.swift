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
    }
    @IBAction func greenSwitchScroll() {
    }
    @IBAction func blueSwitchScroll() {
    }
}

