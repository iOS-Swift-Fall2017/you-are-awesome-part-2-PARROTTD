//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Duncan Parrott on 8/29/17.
//  Copyright © 2017 Parrott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var index = 0
    
    // this code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("The View Controller Loaded")
    }


    @IBAction func MessageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You are fantastic",
                       "You are Great",
                       "You are Amazing",
                       "When the Genius Bar needs help, they call you",
                       "You brighton my day",
                       "You are da bomb",
                       "I can't wait to use your app"]
        
        var newIndex = -1
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        
        /*messageLabel.text = message[index]
        index = index + 1
        
        if index == message.count {
            index = 0 */
        
        /* let message1 = "You are fantastic"
        let message2 = "You are great"
        let message3 = You are amazing"
 
 messageLabel.text == message1{
 messageLabel.text = message2
 } else if messageLabel.text == message2{
 messageLabel.text = message3
         }else messageLabel.text = message1}*/
        }
        
    }
    


