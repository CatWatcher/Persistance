import UIKit

/*
 2.
 Думаю рубашки можно было бы хранить в энуме, так же сделать отдельный класс для карты
 и отдельный класс класс для всех карт в руке, где список карт хранится в сете
 */

enum Suits {
    case heart, diamond, club, spade
}

enum Values {
    case six, seven, eight, nine, ten, jack, queen, king, ace
}

class Card {
    var suit: Suits?
    var value: Values?
    
    init(suit: Suits, value: Values) {
        self.suit = suit
        self.value = value
    }
}

// 3. Строки, символы, целые и с точкой числа

// 4.

struct Position {
    var x = 0
    var y = 0
}

struct Size {
    var square = 0
}

class Circle {
    var square: Size?
    var x: Position?
    var y: Position?
    
    init(x: Position, y: Position, square: Size) {
        self.x = x
        self.y = y
        self.square = square
    }
}

struct Rectangle {
    var leftAngleX: Position?
    var leftAngleY: Position?
    var square: Size?
    
    init(x: Position, y: Position, square: Size) {
        leftAngleX = x
        leftAngleY = y
        self.square = square
    }
}

/*
 5.
 class ClassUser1{
     let name: String
     init(name: String) {
         self.name = name
     }
 }

 class ClassUser2{
     var name: String
     init(name: String) {
         self.name = name
     }
 }

 struct StructUser1{
     let name: String
     init(name: String) {
         self.name = name
     }
 }

 struct StructUser2{
     var name: String
     init(name: String) {
         self.name = name
     }
 }

 let user1 = ClassUser1(name: "Nikita")  ошибка, так как пытаемся изменить константу внутри класса
 user1.name = «Anton»

 let user2 = ClassUser2(name: "Nikita")
 user2.name = «Anton»

 let user3 = StructUser1(name: "Nikita")  ошибка, так как внутри структуры все поля - это константы
 user3.name = «Anton»

 let user4 = StructUser2(name: "Nikita")  тут сам экзепляр структуры является константой, нельзя менять
 user4.name = «Anton»

 var user5 = ClassUser1(name: "Nikita")  так же пытаемся менять константу name - ошибка
 user5.name = «Anton»

 var user6 = ClassUser2(name: "Nikita")
 user6.name = «Anton»

 var user7 = StructUser1(name: "Nikita") снова пытаемся менять константу
 user7.name = «Anton»

 var user8 = StructUser2(name: "Nikita")
 user8.name = «Anton»

 */

// 6.

class Auto {
    var model: String
    var type: String
    var power: Int
    
    init(model: String, type: String, power: Int = 100) {
        self.model = model
        self.type = type
        self.power = power
    }
    
}

// 7.

class Calculator {
    var numbers: (Int, Int)
    
    init(number1: Int, number2: Int) {
        numbers = (number1, number2)
    }
    
    func addition(numbers: (Int, Int)) -> Int {
        return numbers.0 + numbers.1
    }
    
    func multiple (numbers: (Int, Int)) -> Int {
        return numbers.0 * numbers.1
    }
    
    func devision(numbers: (Int, Int)) -> Int {
        return numbers.0 / numbers.1
    }
    
    func subtraction(numbers: (Int, Int)) -> Int {
        return numbers.0 - numbers.1
    }
}

// 8. Если нам нужно поле, которое будет принадлежать классу или структуре, а не отдельному экземпляру

// 9. Классы могут иметь наследников, остальные - нет

// 10.

struct Coordinates {
    var x = 0
    var y = 0
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

enum Direction {
    case up, down, right, left
}

func move (xy: inout Coordinates, drctn: Direction) -> (Int, Int) {
    
    switch drctn {
    case Direction.down:
        xy.y -= 1
        print("move down, new position \(xy)")
    case .left:
        xy.x -= 1
        print("move left, new position  \(xy)")
    case .right:
        xy.x += 1
        print("move right, new position  \(xy)")
    case .up:
        xy.y += 1
        print("move up, new position  \(xy)")
    }
    
    return (xy.x, xy.y)
}

var startPosition = Coordinates(1, 1)

move(xy: &startPosition, drctn: .down)
move(xy: &startPosition, drctn: .left)
move(xy: &startPosition, drctn: .right)
move(xy: &startPosition, drctn: .up)

// Enum - можно добавить функции и дополнительную информацию к кейсам,
// например case a(Int, "String"), так же можно присвоить кейсам значения case a = "A"

/*
 Class - Вероятно удобно использовать, когда нужно описать какую-то сущность со своим набором параметров и методов
как отдельная еденица программы, блок или объект из реального мира.
 Например кошка, персонаж, двигатель, отдельный класс для карты мира или какого-то элемента экрана
 */

//  Struct - Я понял разницу между структурой и классом, но не совсем понимаю когда удобнее структуры.
// Классы получается нужны для наследования и в целом более гибкие
// Не приходит в голову где они могут быть полезнее классов
