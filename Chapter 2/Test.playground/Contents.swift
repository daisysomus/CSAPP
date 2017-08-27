//: Playground - noun: a place where people can play

import UIKit

/* Determin wthether arguments can be subtracted without overlfow */
/* WARNING: This code is buggy. */
func tadd_ok(x:Int32, y:Int32) -> Bool {
    let sum:Int = Int(x + y);
    print("sum \(sum) = \(x) + \(y)")
    return (Int32(sum) - x == y) && (Int32(sum) - y == x);
}

tadd_ok(x: Int32.max, y: Int32.max)
