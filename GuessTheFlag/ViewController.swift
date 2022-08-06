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
    var filteredTrimmedItems = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let strPath = "/Users/diegocastro/Desktop/100 day of swift/GuessTheFlag/GuessTheFlag/Assets.xcassets"
        let directoryContents = try? fm.contentsOfDirectory(atPath: strPath)
        items = directoryContents ?? []
        let filteredItems  = items.filter { $0 != "Contents.json"  && $0 != "AccentColor.colorset" && $0 != "AppIcon.appiconset"}
        for i in 0..<filteredItems.count {
            filteredTrimmedItems.append(filteredItems[i].replacingOccurrences(of: ".imageset", with: ""))
        }
        
        print (filteredTrimmedItems)
        
        
    }


}

