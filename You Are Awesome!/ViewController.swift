//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Duncan Parrott on 8/29/17.
//  Copyright © 2017 Parrott. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: - Variables
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 9
    let numberOfSounds = 5
    
    
    // this code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("The View Controller Loaded")
    }
    
    // Mark: - Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset (name: soundName){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("error \(soundName) could not be played")
            }
        }else {
            print("error \(soundName) did not load")
        }
    }
    
    func nonRepeatingRandomNumber(lastNumber: Int, maxNumber: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxNumber)))
        }while lastNumber == newIndex
        return newIndex
    }
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1{
            awesomePlayer.stop()
        }
    }
    
    
    //MARK: - Meat and Potatos
    
    @IBAction func MessageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You are fantastic",
                       "You are Great",
                       "You are Amazing",
                       "When the Genius Bar needs help, they call you",
                       "You brighton my day",
                       "You are da bomb",
                       "I can't wait to use your app"]
        
        
        index = nonRepeatingRandomNumber(lastNumber: index, maxNumber: messages.count)
        messageLabel.text = messages[index]
        
        awesomeImage.isHidden = false
        
        imageNumber = nonRepeatingRandomNumber(lastNumber: imageNumber, maxNumber: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        
        if soundSwitch.isOn == true {
            
            soundNumber = nonRepeatingRandomNumber(lastNumber: soundNumber, maxNumber: numberOfSounds)
            
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        
        }
        
        
        }
        
    }
    


