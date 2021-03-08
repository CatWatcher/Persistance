//
//  ResultView.swift
//  DataPass
//
//  Created by Феликс Фимберг on 30.08.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class ResultView: UIViewController {

    
    // напрямую менять IBOutlet нельзя
    // поэтому создаем отдельную переменную для этого
    var result: String?
    @IBOutlet weak var ResultLabel: UILabel!
    
    // меняем информацию на нашем лейбле
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // т.к result у нас опциональный, нужно проверить на нил
        guard let result = self.result else { return }
        ResultLabel.text = "Hello, \(result)"
    }
    @IBAction func GoBack(_ sender: UIButton) {
    }
}
