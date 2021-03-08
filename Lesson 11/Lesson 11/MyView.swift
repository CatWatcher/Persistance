import UIKit

// @IBDesignable - чтобы мы видели в сториборде наш вью, а не просто квадрат
@IBDesignable
class MyView: UIView {
    
    var isSetuped = false
    
    // делаем метки с 4-х сторон часов (12 - 3 - 6 - 9)
    private let topMarker = UILabel()
    private let leftMarker = UILabel()
    private let rightMarker = UILabel()
    private let bottomMarker = UILabel()
    
    // размеры для маркеров
    let markerSize: CGFloat = 20
    
    // стрелки
    private let hoursLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    // размеры стрелок
    @IBInspectable
    var hoursSize: CGFloat = 6 {
        didSet {
            setHourLine(hoursSize)
        }
    }
    
    @IBInspectable
    var minuteSize: CGFloat = 4 {
        didSet {
            setMinuteLine(minuteSize)
        }
    }
    
    @IBInspectable
    var secondSize: CGFloat = 2 {
        didSet {
            setSecondLine(secondSize)
        }
    }
    
    // цвета стрелок
    // @IBInspectable - чтобы можно было менять этот параметр в сториборде
    // дид сет - обновление инфы
    @IBInspectable
    var hoursColor:UIColor = .red { didSet { layoutIfNeeded()} }
    @IBInspectable
    var minuteColor: UIColor = .yellow { didSet { layoutIfNeeded()} }
    @IBInspectable
    var secondColor: UIColor = .black { didSet { layoutIfNeeded()} }
    
    let centerPoint = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // обновляем стрелки
        let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.setTime()
        }
        
        // выполнится один раз
        // чтобы не добавлять одни и те же элементы по несколько раз
        if isSetuped { return }
        isSetuped = true
        
        // говорим что вращаться нужно вокруг центра
        // говорим со слоем наших стрелок
        // x and y has values from 0 to 1
        hoursLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        // делаем наше вью круглым
        layer.cornerRadius = frame.width / 2
        
        // для удобства размеры фрейма
        let w = frame.width
        let h = frame.height
        
        // размер стрелок
        setHourLine(hoursSize)
        setMinuteLine(minuteSize)
        setSecondLine(secondSize)
        
        // верхняя цифра располагается по центру на самом верху
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerSize)
        topMarker.text = "12"
        topMarker.textAlignment = .center
        
        // аналогично делаем для остальных
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
        
        // добавляем все наши элементы на наше вью
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
    
    
    // метод для обновления стрелок часов
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
}
