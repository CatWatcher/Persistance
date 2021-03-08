//
//  ViewController.swift
//  Lesson 13
//
//  Created by Феликс Фимберг on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfCurrentAnimation = 0
    var isStarted = false

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var viewTraillingConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func prevButton(_ sender: UIButton) {
        self.mainView.layer.removeAllAnimations()
        
        if isStarted {
            numberOfCurrentAnimation -= 1
        }
        
        switch numberOfCurrentAnimation {
        case 0:
            numberOfCurrentAnimation = 7
            isStarted = true
            fallthrough
        case 7:
            animationLabel.text = "7"
            rotateSquareEver()
        case 6:
            animationLabel.text = "6"
            wOw()
        case 5:
            animationLabel.text = "5"
            hideSquare()
        case 4:
            animationLabel.text = "4"
            rotateSquare()
        case 3:
            animationLabel.text = "3"
            makeItMoreOval()
        case 2:
            animationLabel.text = "2"
            moveToRightAngle()
        case 1:
            animationLabel.text = "1"
            redToYellowAnimation()
        default:
            print("")
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        self.mainView.layer.removeAllAnimations()
        
        if isStarted {
            numberOfCurrentAnimation += 1
        }
                
        switch numberOfCurrentAnimation {
        case 0:
            numberOfCurrentAnimation = 1
            isStarted = true
            fallthrough
        case 1:
            animationLabel.text = "1"
            redToYellowAnimation()
        case 2:
            animationLabel.text = "2"
            moveToRightAngle()
        case 3:
            animationLabel.text = "3"
            makeItMoreOval()
        case 4:
            animationLabel.text = "4"
            rotateSquare()
        case 5:
            animationLabel.text = "5"
            hideSquare()
        case 6:
            animationLabel.text = "6"
            wOw()
        case 7:
            animationLabel.text = "7"
            rotateSquareEver()
        default:
            numberOfCurrentAnimation = 1
            animationLabel.text = "1"
            redToYellowAnimation()
        }
    }
    
    func redToYellowAnimation () {
        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .autoreverse]) {
            self.mainView.backgroundColor = .yellow
        } completion: { (isCompleted) in
            self.mainView.backgroundColor = .red
        }
    }
    
    func moveToRightAngle () {
        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .autoreverse]) {
            self.viewTraillingConstraint.constant = 0
            self.viewTopConstraint.constant = 0
            self.viewLeadingConstraint.constant += 47
            self.view.layoutIfNeeded()
        } completion: { (isCompleted) in
            self.viewTraillingConstraint.constant = 47
            self.viewTopConstraint.constant = 47
            self.viewLeadingConstraint.constant -= 47
            self.view.layoutIfNeeded()
        }
    }
    
    func makeItMoreOval () {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = mainView.bounds.width / 2
        animation.duration = 1.0
        animation.autoreverses = true
        mainView.layer.add(animation, forKey: "cornerRadius")
    }

    func rotateSquare () {
        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .autoreverse]) {
            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } completion: { (isCompleted) in
            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
    }
    
    func hideSquare () {
        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .autoreverse]) {
            self.mainView.alpha = 0
        } completion: { (isCompleted) in
            self.mainView.alpha = 1
        }
    }
    
    func wOw () {
        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .autoreverse]) {
            self.viewTraillingConstraint.constant = 47 / 2
            self.viewTopConstraint.constant = 47 / 2
            self.viewLeadingConstraint.constant = 47 / 2
            self.view.layoutIfNeeded()
        } completion: { (isCompleted) in
            self.viewTraillingConstraint.constant = 47
            self.viewTopConstraint.constant = 47
            self.viewLeadingConstraint.constant = 47
            self.view.layoutIfNeeded()
        }
    }
    
    func rotateSquareEver () {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = CGFloat.zero
        animation.toValue = CGFloat.pi * 2
        animation.duration = 1.0
        animation.autoreverses = false
        animation.repeatCount = Float.infinity
        
        self.mainView.layer.add(animation, forKey: nil)

//        UIView.animate(withDuration: 1.0, delay: 0, options: [UIView.AnimationOptions(), .repeat, .autoreverse]) {
//            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//
//        } completion: { (isCompleted) in
//            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
//        }
    }
}

