//
//  ViewController.swift
//  DJColorViewApp
//
//  Created by Ирина Кузнецова on 22.05.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class DJColorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var djColorView: UIView!
    
    @IBOutlet var valueRedSlider: UILabel!
    @IBOutlet var valueGreenSlider: UILabel!
    @IBOutlet var valueBlueSlider: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var valueRedTextField: UITextField!
    @IBOutlet var valueGreenTextField: UITextField!
    @IBOutlet var valueBlueTextField: UITextField!
    
    var backgroundColorStartView: UIColor?
    var delegateColorView: DJColorViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
        djColorView.backgroundColor = backgroundColorStartView
        
        valueRedTextField.delegate = self
        valueGreenTextField.delegate = self
        valueBlueTextField.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneKeyboardButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneKeyboardButtonClicked))
        
        toolBar.setItems([flexibleSpace, doneKeyboardButton], animated: false)
        valueRedTextField.inputAccessoryView = toolBar
        valueGreenTextField.inputAccessoryView = toolBar
        valueBlueTextField.inputAccessoryView = toolBar
        
        valueRedTextField.keyboardType = .decimalPad
        valueGreenTextField.keyboardType = .decimalPad
        valueBlueTextField.keyboardType = .decimalPad
        
        rgbValueForColor()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
        
        valueRedTextField.text = valueRedSlider.text
        valueGreenTextField.text = valueGreenSlider.text
        valueBlueTextField.text = valueBlueSlider.text
        
        mixColors()
    }
    
    @IBAction func doneButton() {
        delegateColorView.startViewColor(djColorView.backgroundColor!)
        dismiss(animated: true)
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
    
    func rgbValueForColor() {
        let rgbValueColor = backgroundColorStartView!.rgba
        redSlider.value = Float(rgbValueColor.red)
        greenSlider.value = Float(rgbValueColor.green)
        blueSlider.value = Float(rgbValueColor.blue)
        valueColorSlider()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        var newColorValue: Float?
        
        if textField == valueRedTextField {
            valueRedSlider.text = textField.text
            newColorValue = Float(textField.text!)
            redSlider.value = newColorValue!
        }
        else if textField == valueGreenTextField {
            valueGreenSlider.text = textField.text
            newColorValue = Float(textField.text!)
            greenSlider.value = newColorValue!
        }
        else if textField == valueBlueTextField {
            valueBlueSlider.text = textField.text
            newColorValue = Float(textField.text!)
            blueSlider.value = newColorValue!
        }
        
        mixColors()
    }
    
    @objc func doneKeyboardButtonClicked() {
        view.endEditing(true)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
