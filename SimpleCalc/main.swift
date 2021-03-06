//
//  main.swift
//  SimpleCalc
//
//  Created by Albert on 10/5/16.
//  Copyright © 2016 ischool. All rights reserved.
//
//  Extra credit: Doubles and negatives SHOULD work!
import Foundation
print("Welcome to the Calculator App!")
print("Please enter your commands now")

var runProgram = true

while(runProgram) {
    var response = readLine(strippingNewline: true)!
    var split = response.components(separatedBy:" ")
    if(split.count == 1 && split[0] != "") {
        var operation = readLine(strippingNewline: true)!
        var userPrompt = readLine(strippingNewline: true)!
        if(Double(response) != nil && Double(userPrompt) != nil) {
            var firstValue: Double = Double(response)!
            var secondValue: Double = Double(userPrompt)!
                switch operation {
                case "+":
                    print(firstValue + secondValue)
                case "-":
                    print(firstValue - secondValue)
                case "/":
                    print(firstValue / secondValue)
                case "*":
                    print(firstValue * secondValue)
                case "%":
                    print(firstValue.truncatingRemainder(dividingBy: secondValue))
                default:
                    print("Please choose an operation from the following: +, -, *, /, %")
                }
        } else {
            print("Please enter valid numbers.")
        }
    } else if(split.count > 1) {
        var numberFunction: String = split[split.count - 1]
        switch numberFunction {
        case "count":
            print(split.count - 1)
        case "avg":
            var total = 0.0
            for var currentNumber in split {
                var precise: Double? = Double(currentNumber)
                if(precise != nil) {
                    total += precise!
                }
            }
            print(total / (Double(split.count - 1)))
        case "fact":
            if(split.count == 2) {
                if(Int(split[0]) != nil) {
                    var result: Int = 1
                    if(Int(split[0]) == 0) {
                        print("1")
                    } else if(Int(split[0])! < 0) {
                        print("Cannot factorial a negative number!")
                    } else {
                        for currentMultiplier: Int in ((0 + 1)...Int(split[0])!).reversed() {
                            result *= currentMultiplier
                        }
                        print(result)
                    }
                } else {
                    print("Please use an integer!")
                }
            } else {
                print("Please enter only one number when using factorial")
            }
        default:
            print("Please choose one of the following functions: count, avg, fact")
        }
    } else {
        print("Please input a proper value")
    }
}
