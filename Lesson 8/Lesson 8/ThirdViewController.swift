//
//  ThirdViewController.swift
//  Lesson 8
//
//  Created by Феликс Фимберг on 08.10.2020.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .green
        segmentsControll.selectedSegmentIndex = 0
        createTF()
        
    }
    
    @IBOutlet weak var segmentsControll: UISegmentedControl!

    @IBAction func segmentedControll(_ sender: UISegmentedControl) {
        if segmentsControll.selectedSegmentIndex == 0 {
            self.view.backgroundColor = .green
            for item in self.view.subviews {
                if let _ = item as? UISegmentedControl {
                    continue
                }
                item.removeFromSuperview()
            }
            createTF()
        } else if segmentsControll.selectedSegmentIndex == 1 {
            self.view.backgroundColor = .blue
            for item in self.view.subviews {
                if let _ = item as? UISegmentedControl {
                    continue
                }
                item.removeFromSuperview()
            }
            createBtn()
        } else {
            self.view.backgroundColor = .purple
            for item in self.view.subviews {
                if let _ = item as? UISegmentedControl {
                    continue
                }
                item.removeFromSuperview()
            }
            createIV()
        }
    }
    
    func createTF () {
        let tf1 = UITextField(frame: CGRect(x: self.view.center.x - 90, y: 300, width: 180, height: 20))
        let tf2 = UITextField(frame: CGRect(x: self.view.center.x - 90, y: 340, width: 180, height: 20))
        
        tf1.placeholder = "Text field 1"
        self.view.addSubview(tf1)
        
        tf2.placeholder = "Text field 2"
        self.view.addSubview(tf2)
    }
    
    func createBtn () {
        let btn1 = UIButton(frame: CGRect(x: self.view.center.x - 50, y: 300, width: 100, height: 40))
        let btn2 = UIButton(frame: CGRect(x: self.view.center.x - 50, y: 340, width: 100, height: 40))
        
        btn1.setTitle("Button 1", for: .normal)
        self.view.addSubview(btn1)
        
        btn2.setTitle("Button 2", for: .normal)
        self.view.addSubview(btn2)
    }
    
    func createIV () {
        let iv1 = UIImageView(frame: CGRect(x: self.view.center.x - 95, y: 80, width: 190, height: 300))
        let iv2 = UIImageView(frame: CGRect(x: self.view.center.x - 95, y: 420, width: 190, height: 300))
        
        iv1.contentMode = .scaleAspectFill
        iv1.clipsToBounds = true
        iv1.image = UIImage.init(named: "img5")
        self.view.addSubview(iv1)
        
        iv2.contentMode = .scaleAspectFill
        iv2.clipsToBounds = true
        iv2.image = UIImage.init(named: "img6")
        self.view.addSubview(iv2)
    }
}
