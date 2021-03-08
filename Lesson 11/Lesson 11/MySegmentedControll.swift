//
//  MySegmentedControll.swift
//  Lesson 11
//
//  Created by Феликс Фимберг on 27.10.2020.
//

import UIKit

protocol segmentedDelegate {
    func moveSegment(_ segmentControl: MySegmentedControll)
}

@IBDesignable
class MySegmentedControll: UIView {

    var isSetupped = false
    
    var delegate: segmentedDelegate?
    
    let segment = UIView()
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    
    
    
    var x1: CGFloat = 0 {
        didSet {
            setSegment(x1)
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }
    
    @IBInspectable var leftText: String = "Left" {
        didSet {
            leftLabel.text = leftText
        }
    }
    
    @IBInspectable var rightText: String = "Right" {
        didSet {
            rightLabel.text = rightText
        }
    }
    
    override func layoutSubviews() {
        
        let w = frame.width
        let h = frame.height
        
        setSegment(x1)
        segment.layer.borderWidth = borderWidth + 1
        segment.layer.borderColor = UIColor.black.cgColor
        segment.layer.cornerRadius = borderRadius
        
        leftLabel.frame = CGRect(x: 0, y: 0, width: w / 2, height: h)
        leftLabel.textAlignment = .center
        
        rightLabel.frame = CGRect(x: w / 2, y: 0, width: w / 2, height: h)
        rightLabel.textAlignment = .center
        
        if isSetupped { return }
        isSetupped = true
        
        for item in [segment, leftLabel, rightLabel] {
            addSubview(item)
        }
    }
    
    func setSegment(_ x: CGFloat) {
        UIView.animate(withDuration: 0.6){
            self.segment.frame = CGRect(x: self.x1, y: 0, width: self.frame.width / 2, height: self.frame.height)
            self.segment.backgroundColor = .white
        }
    }
    
    
    func moveView () {
        if x1 == 0 {
            for _ in 0..<Int(frame.width / 2) {
                x1 += 1
            }
                rightLabel.isHidden = false
                leftLabel.isHidden = true
        } else {
            for _ in 0..<Int(frame.width / 2) {
                x1 -= 1
            }
                rightLabel.isHidden = true
                leftLabel.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.moveSegment(self)
    }
}
