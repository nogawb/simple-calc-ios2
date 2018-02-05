//
//  ViewController.swift
//  simple-calc-ios2
//
//  Created by Ben Nogawa on 2/2/18.
//  Copyright © 2018 Ben Nogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var historyArray: [String] = []
    var display = ""

    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    @IBAction func numberTapped(_ sender: UIButton)
    {
        var number = sender.titleLabel!.text!
        self.display = self.display + number
        calculatorDisplay.text = self.display
    }
    
    @IBAction func calculationTapped(_ sender: UIButton)
    {
        let operatorVar = sender.titleLabel!.text!
        self.display = self.display + " " + operatorVar + " "
        calculatorDisplay.text = self.display
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        self.display = ""
        calculatorDisplay.text = ""
    }
    
    
    @IBAction func equalsTapped(_ sender: Any)
    {
        let displayArray = self.display.components(separatedBy: " ")
        var total = Double(displayArray[0])!
        var countTotal = 1.0
        var averageCount = 1.0
        var averageUsed = false
        var countUsed = false
        var index = 1
        while index < displayArray.count-1 {
            if displayArray[index] == "+" //add
            {
                total = total + Double(displayArray[index+1])!
            } else if displayArray[index] == "-" //subtract
            {
                total = total - Double(displayArray[index+1])!
            } else if displayArray[index] == "*" //multiply
            {
                total = total * Double(displayArray[index+1])!
            } else if displayArray[index] == "/" //divide
            {
                total = total / Double(displayArray[index+1])!
            } else if displayArray[index] == "Count" //count function
            {
                countTotal += 1
                countUsed = true
            } else if displayArray[index] == "Avg" //avg function
            {
                averageCount += 1
                total = total + Double(displayArray[index+1])!
                averageUsed = true
            } else if displayArray[index] == "Fact" //fact function
            {
                var number = total
                number = number - 1
                while number > 0
                {
                    total = total * number
                    number = number - 1
                }
            }
            index += 2
        }
        if averageUsed {
            var avgReturn = total / averageCount
            historyArray.append(self.display + " = " + String(avgReturn))
            calculatorDisplay.text = self.display + " = " + String(avgReturn)
        } else if countUsed {
            historyArray.append(self.display + " = " + String(countTotal))
            calculatorDisplay.text = self.display + " = " + String(countTotal)
        } else {
            historyArray.append(self.display + " = " + String(total))
            calculatorDisplay.text = self.display + " = " + String(total)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

