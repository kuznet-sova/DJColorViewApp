//
//  StartViewController.swift
//  DJColorViewApp
//
//  Created by Ирина Кузнецова on 06.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

protocol DJColorViewDelegate {
    func startViewColor(_ startViewColor: UIColor)
}

class StartViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let djColorView = segue.destination as? DJColorViewController
            else { return }
        djColorView.startViewBackgroundColor = view.backgroundColor
        djColorView.delegateColorView = self
    }
}

extension StartViewController: DJColorViewDelegate {
    func startViewColor(_ startViewColor: UIColor) {
        view.backgroundColor = startViewColor
    }
}
