//
//  KeyboardViewController.swift
//  testingKeyboard
//
//  Created by 전효재 on 2020/06/22.
//  Copyright © 2020 전효재. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var testingKeyboard: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.testingKeyboard = UIButton(type: .system)
        
        self.testingKeyboard.setTitle(NSLocalizedString("Testing", comment: "Title for 'Next Keyboard' button"), for: [])
        self.testingKeyboard.sizeToFit()
        self.testingKeyboard.translatesAutoresizingMaskIntoConstraints = false
        self.testingKeyboard.addTarget(self, action: "inputTextIntoField", for: .allTouchEvents)
        self.view.addSubview(self.testingKeyboard)
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    func inputTextIntoField()
    {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("¶")
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
        
        self.testingKeyboard.setTitleColor(textColor, for: [])
    }

}
