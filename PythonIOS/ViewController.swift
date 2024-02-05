//
//  ViewController.swift
//  PythonIOS
//
//  Created by Apple on 05/02/24.
//

import UIKit
import PythonKit
import Python

class ViewController: UIViewController {
    
    @IBOutlet weak var pythonMessage: UILabel!
    override func viewDidLoad() {
           super.viewDidLoad()
           initializePythonEnvironment()
           printPythonInfo()
       
       }
        let dirPath = "/Users/apple/Documents/Test Applications/IOS Test Applicaiton/PythonIos/PythonIOS/PythonIOS"

   
       func initializePythonEnvironment() {
           if let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil),
              let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) {
               setenv("PYTHONHOME", stdLibPath, 1)
               setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
               Py_Initialize()
           }
       }
       
       func printPythonInfo() {
           let sys = Python.import("sys")
           func callPython() {
               sys.path.append(dirPath)
               let greeting = Python.import("greeting")
               let message = greeting.hello("Kumar")
               pythonMessage.text = "Python message: \(message)"
               print(message)
           }
           callPython()

         
       }
    
   

}

