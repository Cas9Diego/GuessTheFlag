//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Diego Castro on 06/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries = [String]()
    var items = [String]()
    var score = 0
    var correctAnswer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default //Open default FileManager
        let strPath = "/Users/diegocastro/Desktop/100 day of swift/GuessTheFlag/GuessTheFlag/Assets.xcassets"
        let directoryContents = try? fm.contentsOfDirectory(atPath: strPath)
        items = directoryContents ?? []
        let filteredItems  = items.filter { $0 != "Contents.json"  && $0 != "AccentColor.colorset" && $0 != "AppIcon.appiconset"}
        for i in 0..<filteredItems.count {
            countries.append(filteredItems[i].replacingOccurrences(of: ".imageset", with: ""))
        }
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal) //.normal refers to the standard state of the boton
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        //IMPORTANT: To make sure that the image covers all the space of the button, you should go to the attribute inspector, and change the "Scale" option from "Unspecified" to "default", set Contesnt inset to custom, and padding to 0.
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            } else {
                title = "Wrong"
                score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion)) //The handler is a piece of code that is excecuted when the button is tapped
        present(ac, animated: true)
    }
    
}

