//
//  CocoaButton.swift
//  CocoaButton
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit

@IBDesignable
public class CocoaButton: UIButton {
    
    override open var backgroundColor: UIColor? {
        didSet { configureButton() }
    }
    
    /**
    * Sets button shadow
    */
    @IBInspectable
    open var shadowColor: UIColor? {
        didSet { configureButton() }
    }
    
    private var originalFrame = CGRect.zero
    private var activeFrame: CGRect?
    
    private var isAnimating = false
    private var isLoading = false
    
    private let spinner = SpinnerView()
    
    //  MARK: - Public functions -
    
    public func startLoading() {
        guard !isLoading else { return }
        originalFrame = frame
        UIView.animate(withDuration: 0.4, animations: {
            self.frame.origin.x =
                self.originalFrame.origin.x +
                (self.originalFrame.size.width - self.frame.size.height) / 2
            self.frame.size.width = self.frame.size.height
            self.layer.cornerRadius = self.frame.height / 2
            self.titleLabel?.alpha = 0
        }) { _ in
            self.addSubview(self.spinner)
            self.activeFrame = self.frame
            self.spinner.animate()
            self.spinner.alpha = 0
            UIView.animate(withDuration: 0.1) {
                self.spinner.alpha = 1
            }
        }
        isLoading = true
    }
    
    public func stopLoading() {
        guard isLoading else { return }
        self.activeFrame = nil
        UIView.animate(withDuration: 0.1, animations: {
            self.spinner.alpha = 0
        }) { _ in
            self.spinner.removeFromSuperview()
        }
        UIView.animate(withDuration: 0.4, animations: {
            self.frame = self.originalFrame
            self.layer.cornerRadius = 11
            self.titleLabel?.alpha = 1
        }) { _ in
            self.isLoading = false
        }
    }
    
    //  MARK: - Internal functions -

    private func configureButton() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.cornerRadius = 11
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if let activeFrame = activeFrame {
            frame = activeFrame
        }
        spinner.frame = CGRect(x: 10, y: 10, width: frame.height - 20, height: frame.height - 20)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        defer { super.touchesBegan(touches, with: event) }
        guard !isAnimating, !isLoading else { return }
        
        AnimationHelper.animateShadowOpacity(forLayer: layer, fromValue: 1, toValue: 0, duration: 0.2)
        UIView.animate(withDuration: 0.2) {
            self.transform = self.transform.scaledBy(x: 0.98, y: 0.98)
            self.titleLabel?.alpha = 0.38
        }
        isAnimating = true
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        AnimationHelper.animateShadowOpacity(forLayer: layer, fromValue: 0, toValue: 1, duration: 0.3)
        UIView.animate(withDuration: 0.3, animations: {
            if !self.isLoading {
                self.transform = .identity
                self.titleLabel?.alpha = 1
            }
        }) { _ in
            super.touchesCancelled(touches, with: event)
            self.isAnimating = false
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        AnimationHelper.animateShadowOpacity(forLayer: layer, fromValue: 0, toValue: 1, duration: 0.3)
        UIView.animate(withDuration: 0.3, animations: {
            if !self.isLoading {
                self.transform = .identity
                self.titleLabel?.alpha = 1
            }
        }) { _ in
            self.sendActions(for: .touchUpInside)
            self.isAnimating = false
        }
    }
    
    //  MARK: - Init -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
}
