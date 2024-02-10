import Foundation


func combineStrings(_ firstLine: String, _ secondLine: String) -> String {
    return firstLine + secondLine
}


func flipString(_ inputString: String) -> String {
    return String(inputString.reversed())
}


func countCharacters(_ inputString: String) -> Int {
    let trimmedString = inputString.replacingOccurrences(of: " ", with: "")
    return trimmedString.count
}


func searchSubstring(_ mainString: String, _ substring: String) -> [Int] {
    var indexes: [Int] = []
    var searchRange = mainString.startIndex..<mainString.endIndex

    while let range = mainString.range(of: substring, options: .caseInsensitive, range: searchRange) {
        let index = mainString.distance(from: mainString.startIndex, to: range.lowerBound)
        indexes.append(index)
        searchRange = range.upperBound..<mainString.endIndex
    }

    return indexes
}


func getLinesInput() -> (String, String) {
    print("Введите первую строку:")
    guard let firstLine = readLine() else {
        return ("", "")
    }

    print("Введите вторую строку:")
    guard let secondLine = readLine() else {
        return (firstLine, "")
    }

    return (firstLine, secondLine)
}


func getStringInput() -> String {
    print("Введите строку для переворота и подсчета символов:")
    return readLine() ?? ""
}


func getSubstringInput() -> (String, String) {
    print("Введите строку:")
    guard let mainString = readLine() else {
        return ("", "")
    }

    print("Введите подстроку для поиска:")
    guard let substring = readLine() else {
        return (mainString, "")
    }

    return (mainString, substring)
}

// Выбор программы
func getUserChoice() -> Int? {
    print("Выберите программу:")
    print("1. Calculator")
    print("2. String Processing")
    print("Введите 1 или 2:")
    
    guard let choice = readLine(), let option = Int(choice) else {
        print("Неверный ввод")
        return nil
    }

    return option
}

// Кейсы и код калькулятора
if let choice = getUserChoice() {
    switch choice {
    case 1:
        

        
        func add(_ a: Double, _ b: Double) -> Double {
            return a + b
        }

        
        func subtract(_ a: Double, _ b: Double) -> Double {
            return a - b
        }

       
        func multiply(_ a: Double, _ b: Double) -> Double {
            return a * b
        }

        
        func divide(_ a: Double, _ b: Double) -> Double? {
            guard b != 0 else {
                print("Ошибка: Деление на ноль.")
                return nil
            }
            return a / b
        }

        
        func power(_ base: Double, _ exponent: Double) -> Double {
            return pow(base, exponent)
        }

        
        func getUserInput() -> (Double, Double, String)? {
            print("Введите первый номер:")
            guard let num1 = Double(readLine() ?? "") else {
                print("Неверный ввод.")
                return nil
            }

            print("Введите второй номер:")
            guard let num2 = Double(readLine() ?? "") else {
                print("Неверный ввод.")
                return nil
            }

            print("Выберите оператор (+, -, *, /, ^):")
            guard let op = readLine(), ["+", "-", "*", "/", "^"].contains(op) else {
                print("Неверный оператор.")
                return nil
            }

            return (num1, num2, op)
        }

        
        func performOperation(_ num1: Double, _ num2: Double, _ operatorSymbol: String) {
            var result: Double?

            switch operatorSymbol {
            case "+":
                result = add(num1, num2)
            case "-":
                result = subtract(num1, num2)
            case "*":
                result = multiply(num1, num2)
            case "/":
                result = divide(num1, num2)
            case "^":
                result = power(num1, num2)
            default:
                print("Неверный оператор.")
            }

            if let result = result {
                print("Ответ: \(result)")
            }
        }

        
        if let (num1, num2, operatorSymbol) = getUserInput() {
            performOperation(num1, num2, operatorSymbol)
        }

    case 2:
        
        let (firstLine, secondLine) = getLinesInput()
        let combinedString = combineStrings(firstLine, secondLine)
        print("Результат объединения: \(combinedString)")

        let inputString = getStringInput()
        let flippedString = flipString(inputString)
        print("Результат переворота: \(flippedString)")

        let characterCount = countCharacters(inputString)
        print("Количество символов (исключая пробелы): \(characterCount)")

        let (mainString, substring) = getSubstringInput()
        let substringIndexes = searchSubstring(mainString, substring)
        print("Первое вхождение подстроки на позиции: \(substringIndexes)")

    default:
        print("Неверный ввод.")
    }
}
