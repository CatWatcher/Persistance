//
//  SecondViewController.swift
//  Lesson 8
//
//  Created by Феликс Фимберг on 08.10.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    var x = 10
    var y = 60

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createImageViews(count: 4)
    }
    
    // метод, чтобы были разные картинки
    func toString (_ i: Int) -> String{
        return "img" + String(i)
    }
    
    func createImageViews (count: Int) {
        for i in 1...count {
            // создаем вью
            let iv = UIImageView(frame: CGRect(x: x, y: y, width: 172, height: 240))
            let lv1 = UILabel(frame: CGRect(x: x, y: y + 250, width: 172, height: 20))
            let lv2 = UILabel(frame: CGRect(x: x, y: y + 270, width: 172, height: 20))
            let lv3 = UILabel(frame: CGRect(x: x, y: y + 290, width: 172, height: 20))
            
            // настройка вью
            iv.contentMode = .scaleAspectFill
            iv.image = UIImage.init(named: toString(i))
            iv.clipsToBounds = true
            iv.backgroundColor = .darkGray
            
            lv1.text = toString(i)
            lv1.textAlignment = .left
            lv2.text = toString(i)
            lv2.textAlignment = .center
            lv3.text = toString(i)
            lv3.textAlignment = .right
            
            // добавляем созданные вьюшки
            self.view.addSubview(iv)
            self.view.addSubview(lv1)
            self.view.addSubview(lv2)
            self.view.addSubview(lv3)

            
            // располагаем их равномерно по экрану
            if i % 2 == 0 {
                x = 10
                y += 320
            } else {
                x += 182
            }
        }
    }
}
