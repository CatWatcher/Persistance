import UIKit


/*
 1. Прочитано
 
 2. let - константа, значение задается только один раз и потом не меняется
    var - переменная, можем менять значение сколько угодно раз (но не тип)
 
 3. Возможен.
 
 4. Int - Double - String - UInt8 - Int
 
 5. Вероятно будет ошибка так как выйдем за пределы допустимых значений
 
 8. let a = 21 / 8   2
    let b = 21 % 8   5
    let c = a == b   false
    let d = a != b   true
    let e = c && d   false
    let f = c || d   true
    
 */

// tuples

// для хранения разношерстных данных, например информации о животных в питомнике
let animal = (age: 3, name: "Barsik", behavior: "Lazy")

// чтобы получать информацию из какого-нибудь источника с определенным набором параметров (?)
var bacteria = (size: 32, gramPositive: false)

//просто для удобства, когда нужно что-то сгруппировать
let (nameOfThisPerson, lastName, profession, salary) = ("Jhon", "Manovski", "Biologist", 3500)

// Представим, что у нас есть код..
let age = 25
let name = "Nikita"
let greeting = "Hello \(name), your age is \(age)?"
