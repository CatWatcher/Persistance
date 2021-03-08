//
//  ViewController.swift
//  Lesson 8
//
//  Created by Феликс Фимберг on 08.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage.init(named: "img1")
    }

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func nextBtn(_ sender: UIButton) {
        currentIndex += 1
        if currentIndex == 10 {
            currentIndex = 0
            imageView.image = UIImage.init(named: images[currentIndex])
        } else {
            imageView.image = UIImage.init(named: images[currentIndex])
        }
    }
    
    @IBAction func previousBtn(_ sender: UIButton) {
        currentIndex -= 1
        if currentIndex == -1 {
            currentIndex = 9
            imageView.image = UIImage.init(named: images[currentIndex])
        } else {
            imageView.image = UIImage.init(named: images[currentIndex])
        }
    }
    
    
}

