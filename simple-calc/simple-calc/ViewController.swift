//
//  ViewController.swift
//  simple-calc
//
//  Created by apple on 4/20/16.
//  Copyright © 2016 Sophie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bar: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var input : String = ""
    var result : String = ""
    var op : String = ""
    
    @IBAction func buttonTapped(button: UIButton) {
        input = input + button.titleLabel!.text!
        bar.text = input
    }
    
    @IBAction func Op(button: UIButton) {
        op = op + button.titleLabel!.text!
        input = input + button.titleLabel!.text!
        bar.text = input
    }
    

    @IBAction func equal(sender: AnyObject) {
    
        if input.containsString("+") || input.containsString("-") || input.containsString("*") || input.containsString("/") || input.containsString("%") {
            let separated = input.componentsSeparatedByString(op)
            let first : Int = Int(separated[0])!
            let second : Int = Int(separated[1])!
            if op == "+" {
                result = "\(first + second)"
            } else if op == "-"{
                result = "\(first - second)"
            } else if op == "*" {
                result = "\(first * second)"
            } else if op == "/" {
                result = "\(first / second)"
            } else {
                result = "\(first % second)"
            }
        } else if input.containsString("Count") || input.containsString("Avg") || input.containsString("Fact") {
            let separated = input.componentsSeparatedByString(op)
            if separated.last == "count" {
                result = "\(separated.count - 1)"
            } else if separated.last == "avg" {
                var sum : Int? = 0
                for index in 0...separated.count-2 {
                    sum = sum! + Int(separated[index])!
                }
                var length = separated.count - 1
                result = "\(sum! / length)"
            } else {
                var last : Int? = Int(separated[0])
                func factorial(last: Int) -> (Int) {
                    if (last <= 1) {
                        return 1
                    } else {
                        return last * factorial(last - 1)
                    }
                }
                result = "\(factorial(last!))"
            }
        } else {
            result = "please type in valid input!"
        }
    }
        
}


