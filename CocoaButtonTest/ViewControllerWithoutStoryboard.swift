//
//  ViewControllerWithoutStoryboard.swift
//  CocoaButtonTest
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit
import CocoaButton

class ViewControllerWithoutStoryBoard: UIViewController {
    
    let submitButton = CocoaButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.width
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.frame = CGRect(x: width * 0.1, y: 300, width: width * 0.8, height: 52)
        applyStyle(to: submitButton)
        submitButton.addTarget(self, action: #selector(onSubmit), for: .touchUpInside)
        view.addSubview(submitButton)
        
        view.backgroundColor = .white
    }
    
    @objc func onSubmit() {
        submitButton.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.submitButton.stopLoading()
        }
    }
    
    private func applyStyle(to v: CocoaButton) {
        v.setTitle("Submit", for: .normal)
        v.backgroundColor = UIColor(displayP3Red: 49/255, green: 190/255, blue: 169/255, alpha: 1)
        v.borderColor = UIColor.gray
        v.borderWidth = 1
        v.shadowColor = UIColor(red: 94/255, green: 186/255, blue: 187/255, alpha: 0.6)
    }
}
