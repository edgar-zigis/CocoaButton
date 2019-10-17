//
//  AttributedLabel.swift
//  CocoaButtonTest
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit

class AttributedLabel: UILabel {
    
    var plainText: String? = nil {
        didSet { drawText() }
    }
    
    var highlightedText: String? = nil {
        didSet { drawText() }
    }
    
    override var font: UIFont? {
        didSet { drawText() }
    }
    
    override var textColor: UIColor? {
        didSet { drawText() }
    }
    
    override var highlightedTextColor: UIColor? {
        didSet { drawText() }
    }
    
    private func drawText() {
        var text = ""
        var rangeToHighlight = NSRange(location: 0, length: 0)
        
        if let highlightedText = highlightedText {
            text += highlightedText
            rangeToHighlight = (text as NSString).range(of: highlightedText)
        }
        
        if let plainText = plainText { text += plainText }
        
        let attributedString = NSMutableAttributedString(string: text)
        if let highlightedTextColor = highlightedTextColor {
            attributedString.addAttribute(.foregroundColor, value: highlightedTextColor, range: rangeToHighlight)
        }
        if let font = font {
            attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: text.count))
        }
        attributedText = NSTextStorage(attributedString: attributedString)
    }
    
    //  MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
