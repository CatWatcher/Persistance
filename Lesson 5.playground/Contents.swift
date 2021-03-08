import UIKit


// Первые 2 части 3-го задания (С игрой):

// Предметы можно использовать
protocol Usable {
    func useItem()
}

// Интерактивные элементы
protocol Interactive {
    func doSomething()
}

// Передвигающиеся объекты
protocol Movable {
    func move()
}


// чтобы в инвентарь можно было положить только 10 предметов одного типа (просто потестить extension)
extension Array {
    mutating func addItem (item: Element) {
        if self.count == 5 {
            print("Not enoght space in the bag")
        } else {
            self.append(item)
        }
    }
}

// типы предметов в игре
enum ItemType {
    case plant, armour, weapon, questItem
}

// класс для предметов
class Item: Usable, Interactive {
    
    var name = ""
    let type: ItemType?
    
    func doSomething() {
    }

    func useItem() {
    }
    
    init(type: ItemType, name: String = "Something") {
        self.type = type
        self.name = name
    }
}

// Стены
class Wall {
    var size = 0
    var position = (0, 0)
}

// Враги
class Enemy: Interactive, Movable {
    func doSomething() {
    }
    
    func move() {
    }
}

// Персонажи
class Character: Interactive, Movable {
    func doSomething() {
    }
    
    func move() {
    }
}

// Карта
class Map {
    var characters: [Movable] = []
    var walls: [Wall] = []
    var enemies: [Movable] = []

    func moveOnMap (object: Movable) {
        if let _ = object as? Character {
            characters.append(object)
            print("Count of characters \(characters.count)")
        } else if let _ = object as? Enemy {
            enemies.append(object)
            print("Count of enemies \(enemies.count)")
        }
        object.move()
    }
    
    func makeObstacle (object: Wall) {
        walls.append(object)
        print("Obstacle was created")
    }
    
    func talkTo (object: Interactive) {
        print("Hello!")
    }
}

// Рюкзак с предметами
struct Bag {
    var plants: [Item] = []
    var weapon: [Item] = []
    var armours: [Item] = []
    var questItems: [Item] = []
    var other: [Item] = []
    
    mutating func addToBag (item: Item) {
        switch item.type {
        case .armour:
            armours.addItem(item: item)
        case .plant:
            plants.addItem(item: item)
        case .questItem:
            questItems.addItem(item: item)
        case .weapon:
            self.weapon.addItem(item: item)
        default:
            print("You find something strange. Throw it out")
            other.addItem(item: item)
        }
    }
    
    func removeFromBag (item: Item) {
    }
}

var map = Map()
var bag = Bag()
var character = Character()
var enemy1 = Enemy()
var enemy2 = Enemy()

map.moveOnMap(object: enemy1)
map.moveOnMap(object: enemy2)
map.moveOnMap(object: character)


var item1 = Item(type: ItemType.armour, name: "Dark armour")
var item2 = Item(type: ItemType.weapon, name: "Sword of destiny")
var item3 = Item(type: ItemType.plant, name: "Zomeokulkas")
var item4 = Item(type: ItemType.questItem, name: "Baium's blood")
bag.addToBag(item: item1)
bag.addToBag(item: item2)
bag.addToBag(item: item3)
bag.addToBag(item: item4)
bag.addToBag(item: item1)
bag.addToBag(item: item1)
bag.addToBag(item: item1)
bag.addToBag(item: item1)
bag.addToBag(item: item1)

// Задание с машинами

enum ToyotaComplectation {
    case econom(price: Int, color: String, engineV: Int)
    case comfort(price: Int, color: String, engineV: Int)
    case premium(price: Int, color: String, engineV: Int)
}
enum TeslaComplectation {
    case econom(price: Int, color: String, engineV: Int)
    case comfort(price: Int, color: String, engineV: Int)
    case premium(price: Int, color: String, engineV: Int)
}

enum ScodaComplectation {
    case econom(price: Int, color: String, engineV: Int)
    case comfort(price: Int, color: String, engineV: Int)
    case premium(price: Int, color: String, engineV: Int)
}

class Car {
    var name: String?
    var image: String?
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

class Toyota: Car {
    var complectation: ToyotaComplectation?
    
    init(name: String, image: String, complectation: ToyotaComplectation) {
        super.init(name: name, image: image)
        self.complectation = complectation
    }
}

class Tesla: Car {
    var complectation: TeslaComplectation?
    
    init(name: String, image: String, complectation: TeslaComplectation) {
        super.init(name: name, image: image)
        self.complectation = complectation
    }
}

class Scoda: Car {
    var complectation: ScodaComplectation?
    
    init(name: String, image: String, complectation: ScodaComplectation) {
        super.init(name: name, image: image)
        self.complectation = complectation
    }
}



/*
 4.
  Расширения лучше использовать, когда нам нужно подкорректировать недоступный для нас класс
 или для реализации протоколов. А наследование, когда нужно описать более частный случай уже существующего класса (не знаю как сформулировать)
 т.е перейти от более общей модели к частным моделям
 */

/*
 5.
 a. вывод = "A"
 b. тут будет ошибка, т.к класс С не реализует протокл В
 с. вывод - "D"
 d. вывод = "A"
 
 и не уверен можно ли расширять протокол? Мне кажется тут и будет ошибка
 */

/*
 6.
 Полиморфизм - механизм языка, позволяющий работать с различными типами в едином стиле (т.е когда функция может получать данные разных типов)
 
 Инкапсуляция - механизм для сокрытия реализации и данных для доступа извне,
 а так же для объеденения различных данных и методов в одну структуру
 
 Наследование - позволяет создавать новый класс на основе уже существующего, переняв весь его функционал
 
 */


