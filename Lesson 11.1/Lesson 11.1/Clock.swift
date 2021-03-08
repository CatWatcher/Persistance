//
//  Clock.swift
//  Lesson 11.1
//
//  Created by Феликс Фимберг on 05.11.2020.
//

import UIKit

@IBDesignable
class Clock: UIView {
    
    private let hoursLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    private let topMarker = UILabel()
    private let leftMarker = UILabel()
    private let rightMarker = UILabel()
    private let bottomMarker = UILabel()
    
    let markerSize: CGFloat = 20
    
    let centerPoint = UIView()
    
    var hoursSize: CGFloat = 6
    var minuteSize: CGFloat = 4
    var secondSize: CGFloat = 2
    
    @IBInspectable
    var hoursColor:UIColor = .red { didSet { layoutIfNeeded()} }
    @IBInspectable
    var minuteColor: UIColor = .yellow { didSet { layoutIfNeeded()} }
    @IBInspectable
    var secondColor: UIColor = .black { didSet { layoutIfNeeded()} }
    
    // load xib file with our view
    static func loadFromNib () -> Clock {
        let clock = UINib(nibName: "Clock", bundle: nil)
        return clock.instantiate(withOwner: self, options: nil).first as! Clock
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        layer.backgroundColor = UIColor.cyan.cgColor
        
        hoursLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        layer.cornerRadius = frame.width / 2
        
        let w = frame.width
        let h = frame.height
        
        setHourLine(hoursSize)
        setMinuteLine(minuteSize)
        setSecondLine(secondSize)
        
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerSize)
        topMarker.text = "12"
        topMarker.textAlignment = .center
        
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerSize, height: markerSize)
        leftMarker.text = "9"
        leftMarker.textAlignment = .center
        
        rightMarker.frame = CGRect(x: w - markerSize, y: h / 2 - markerSize / 2, width: markerSize, height: markerSize)
        rightMarker.text = "3"
        rightMarker.textAlignment = .center
        
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerSize, width: markerSize, height: markerSize)
        bottomMarker.text = "6"
        bottomMarker.textAlignment = .center
        
        centerPoint.frame = CGRect(x: w / 2 - 15, y: h / 2 - 15, width: 30, height: 30)
        centerPoint.layer.cornerRadius = 15
        centerPoint.backgroundColor = .green
        
        for item in [topMarker, leftMarker, rightMarker, bottomMarker, hoursLine, minuteLine, secondLine, centerPoint] {
            addSubview(item)
        }
    }
    
    func setHourLine (_ size: CGFloat) {
        
        let w = frame.width
        let h = frame.height
        
        // настраиваем стрелки
        hoursLine.frame = CGRect(x: w / 2 - hoursSize / 2, y: h / 2 - h / 4, width: hoursSize, height: h / 4)
        hoursLine.backgroundColor = hoursColor
    }
    
    func setMinuteLine (_ size: CGFloat) {
        let w = frame.width
        let h = frame.height
        
        minuteLine.frame = CGRect(x: w / 2 - minuteSize / 2, y: 0 + markerSize + 10, width: minuteSize, height: h / 2 - markerSize - 10)
        minuteLine.backgroundColor = minuteColor
    }
    
    func setSecondLine (_ size: CGFloat) {
        let w = frame.width
        let h = frame.height
        
        secondLine.frame = CGRect(x: w / 2 - secondSize / 2, y: 0 + markerSize + 10, width: secondSize, height: h / 2 - markerSize - 10)
        secondLine.backgroundColor = secondColor
    }
    
    func setTime () {
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        // будем рассчитывать угол поворота в зависимости от времени
        // максимальный угол поворота в радианах - 2пи
        let angleForHours = CGFloat.pi * 2 * (CGFloat(hour) / 12)
        hoursLine.transform = CGAffineTransform(rotationAngle: angleForHours)
        
        let angleForMinutes = CGFloat.pi * 2 * (CGFloat(minutes) / 60)
        minuteLine.transform = CGAffineTransform(rotationAngle: angleForMinutes)
        
        let angleForSeconds = CGFloat.pi * 2 * (CGFloat(seconds) / 60)
        secondLine.transform = CGAffineTransform(rotationAngle: angleForSeconds)
    }
    
    override func awakeFromNib() {
        let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.setTime()
        }
    }
}
