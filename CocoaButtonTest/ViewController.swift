//
//  ViewController.swift
//  CocoaButtonTest
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var versionWithoutStoryBoardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onVersionWithoutStoryBoard(_ sender: Any) {
        present(ViewControllerWithoutStoryBoard(), animated: true, completion: nil)
    }
}
