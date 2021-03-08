import UIKit

// 2. Можно

func factorial (number: Int) -> Int {
    if number == 0 { return 1 }
    return factorial(number: number - 1) * number
}

factorial(number: 4)

// 3.

func strings (str: [String]) -> String {
    var result = ""
    for (index, item) in str.enumerated() {
        if index < str.count - 1 {
            result += item + ", "
        } else { result += item }
    }
    return result
}


// 4.

func changeInt (n1: inout Int, n2: inout Int) {
    let temp = n2 * 2
    n2 = n1 * 2
    n1 = temp
    
}

// 5.

func arrays (arr1: [Int], arr2: [Int]) -> Bool {
    var sum1 = 0
    var sum2 = 0
    
    for i in arr1 { sum1 += i }
    for i in arr2 { sum2 += i }
    
    if sum1 > sum1 {
        return true
    } else { return false }
}

// 6.

func arraySort (arr: Int...) -> [Int] {
    
    var temp = 0
    var result = arr
   
    for (index1, _) in result.enumerated() {
        for (index2, item2) in result.enumerated() {
            if result[index2] < result[index1] {
                temp = result[index1]
                result[index1] = item2
                result[index2] = temp
            }
        }
    }
    return result
}

arraySort(arr: 1, 5, 4, 120, 94, 56)

// 7.

func middleValue (arr: Int...) -> Double {
    var sum = 0
    for i in arr {
        sum += i
    }
    return Double(sum) / Double(arr.count)
}


// 8.

func searchString (arr: [String], str: String) -> Int? {
    
    var result: Int?
    
    for (i, string) in arr.enumerated() {
        if str == string {
            result = i
        }
    }
    
        return result
}

// 9. result = "Hello, young man/woman 0"

// 10. result = 4

// Functions - Да, можно вернуть tuples -> (Int, String, Bool) например
// Да, можно внутри функции написать другую локальную функцию

// Опционалы - ! если точно уверены, что сможем извлечь значение

