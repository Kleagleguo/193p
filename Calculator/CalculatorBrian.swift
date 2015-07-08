//
//  CalculatorBrian.swift
//  Calculator
//
//  Created by Bingkun Guo on 7/7/15.
//  Copyright (c) 2015 Bingkun Guo. All rights reserved.
//

import Foundation

class CalculatorBrian
{
    enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    var opStack = [Op]()
    
    var knowOps = Dictionary<String, Op>()
    
    init() {
        knowOps["×"] = Op.BinaryOperation("×", *)
        knowOps["÷"] = Op.BinaryOperation("÷", { $1 / $0 })
        knowOps["+"] = Op.BinaryOperation("+", +)
        knowOps["−"] = Op.BinaryOperation("−", { $0 - $1 })
        knowOps["√"] = Op.UnaryOperation("√",  sqrt)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        if let operation = knowOps[symbol]  {// dictionary always returns an optional, cuz it might be null
            opStack.append(operation)
        }
    }
}