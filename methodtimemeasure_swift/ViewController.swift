//
//  ViewController.swift
//  methodtimemeasure_swift
//
//  Created by Dmitrii Pronin on 24.06.2021.
//

import UIKit
import AdServices

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rerunBtn: UIButton!
    
    @IBAction func buttonTap(_ sender: Any) {
        displayResult()
    }
    
    func calculateExecutionTime() -> Double {
        var executionTime = 0.0
        if #available(iOS 14.3, *) {
            let methodStart = Date()
            _ = try! AAAttribution.attributionToken()
            let methodFinish = Date()
            executionTime = methodFinish.timeIntervalSince(methodStart)
            print("Execution time of attributionToken() method was: \(executionTime) sec")
        }
        return round(1000000 * executionTime) / 1000000
    }
    
    func displayResult() {
        textField.text = String(calculateExecutionTime()) + " sec"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
}
