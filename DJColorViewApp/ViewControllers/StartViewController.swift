//
//  StartViewController.swift
//  DJColorViewApp
//
//  Created by Ирина Кузнецова on 06.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var startViewController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let djColorView = segue.destination as? DJColorViewController
            else { return }
        djColorView.backgroundColorStartView = startViewController.backgroundColor
    }
    
    @IBAction func editColorViewButton(_ sender: UIBarButtonItem) {
        
    }
}
