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
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var valueRedTextField: UITextField!
    @IBOutlet var valueGreenTextField: UITextField!
    @IBOutlet var valueBlueTextField: UITextField!
    
    var startViewBackgroundColor: UIColor?
    var delegateColorView: DJColorViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        djColorView.layer.cornerRadius = 20
        djColorView.backgroundColor = startViewBackgroundColor
        
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
        valueRedLabel.text = getString(
            float: Float(redSlider.value)
        )
        valueGreenLabel.text = getString(
            float: Float(greenSlider.value)
        )
        valueBlueLabel.text = getString(
            float: Float(blueSlider.value)
        )
        
        valueRedTextField.text = valueRedLabel.text
        valueGreenTextField.text = valueGreenLabel.text
        valueBlueTextField.text = valueBlueLabel.text
        
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
        let rgbValueColor = startViewBackgroundColor!.rgba
        redSlider.value = Float(rgbValueColor.red)
        greenSlider.value = Float(rgbValueColor.green)
        blueSlider.value = Float(rgbValueColor.blue)
        valueColorSlider()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        var newColorValue: Float?
        
        if textField == valueRedTextField {
            valueRedLabel.text = textField.text
            newColorValue = getFloat(string: textField.text)
            redSlider.value = getColorValue(
                colorValue: newColorValue,
                colorSliderMinValue: redSlider.minimumValue
            )
        }
        else if textField == valueGreenTextField {
            valueGreenLabel.text = textField.text
            newColorValue = getFloat(string: textField.text)
            greenSlider.value = getColorValue(
                colorValue: newColorValue,
                colorSliderMinValue: greenSlider.minimumValue
            )
        }
        else if textField == valueBlueTextField {
            valueBlueLabel.text = textField.text
            newColorValue = getFloat(string: textField.text)
            blueSlider.value = getColorValue(
                colorValue: newColorValue,
                colorSliderMinValue: greenSlider.minimumValue
            )
        }
        
        mixColors()
    }
    
    func getFloat(string: String?) -> Float? {
        guard let string = string
            else { return nil }
        return Float(string)
    }
    
    func getString(float: Float) -> String {
        let float = float
        return String (format: "%.2f", float)
    }
    
    func getColorValue(colorValue: Float?, colorSliderMinValue: Float) -> Float {
        guard colorValue != nil
            else { return colorSliderMinValue }
        return colorValue!
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
