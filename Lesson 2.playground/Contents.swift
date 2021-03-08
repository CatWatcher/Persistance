import UIKit

// 3. array of Int

var array = [1, 2, 3, 4]
let array1: [Int] = []
let array2: [Int] = [1, 2]
let array3 = array1 + array
let arrayInit = Array.init([1, 2, 3])

// 4.

var arrayInt = [1, 2, 3]
arrayInt.append(256)
arrayInt.removeFirst()
arrayInt

var max = arrayInt[0]
var min = arrayInt[0]

for i in arrayInt {
    if i > max {
        max = i
    }
    if i < min {
        min = i
    }
}

max
min

print("From min to max: \(max - min)")

// 5.

array.append(10)
array.insert(512, at: 5)
array[0] = 1024
array += arrayInt

// 6. 11

// 7.

var names = ["Genry", "Ilon", "Nikola", "Imanuil"]
var greeting = ""

for (index, name) in names.enumerated() {
    if index % 2 == 0 {
        greeting = "Go left, \(name)"
    } else {
        greeting = "Go right, \(name)"
    }
    print(greeting)
}

/*
 8.
 массивы хранят данные в определенном порядке и они могут повторяться
 в сете данные в беспорядке, но нет одинаковых значений
 */

/*
 9.
 1 - ["😂", "🎊"]
 2 - все остальные эмодзи кроме тех, что выше
 3 - ["😂", "🎊", "🕺", "🚀", "🎸", "🦋"]
 4 - ["🕺", "🚀"]
 */

// 10.

// Set - например для игры в карты, где нужно хранить масти
let cards: Set = ["Черви", "Буби", "Пики", "Крести"]

// Array - просто для хранения наборов чего-либо, например имен для статистики,
// кто как называет деетй (не знаю кому такое может понадобиться правда)
let stuff = ["Andrey", "Liza"]

// Dictionary - например для базы клиентов, где ключ - имя, а значение - номер телефона
let guests = ["Masha": 9119634536, "Sveta": 9324675656]

// 11.

let number = 5
let power = 3

var result = number

for _ in 1..<power {
    result *= number
}
print(result)

// 12.

let mood = 6

if mood <= 3 {
    print("Sad")
} else if mood <= 7 {
    print("Fine")
} else if mood <= 10 {
    print("Happines")
} else {
    print("Super happy!")
}

switch mood {
case ...3:
    print("Sad")
case 4...7:
    print("Fine")
case 8...10:
    print("Happy")
default:
    print("Other")
}

/*
 collections - ["🏆", "💃", "💃😎", "🎰"]
 conditions - Good emoji
 cycles - 24
 
 switch удобнее когда есть набор конкретных простых значений для проверки,
 а if удобнее использовать в циклах (не уверен, мне кажется они очень похожи, только switch легче для восприятия)
 */





