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
        op = button.titleLabel!.text!
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
            bar.text = result
        } else if input.containsString("Count") || input.containsString("Avg") || input.containsString("Fact") {
            let separated = input.componentsSeparatedByString(op)
            if input.containsString("Count") {
                result = "\(separated.count)"
            } else if input.containsString("Avg") {
                var sum : Int? = 0
                for index in 0...separated.count - 1 {
                    sum = sum! + Int(separated[index])!
                }
                var length = separated.count
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
            bar.text = result
        } else {
            result = "please type in valid input!"
            bar.text = result
        }
        input = ""
    }
}


