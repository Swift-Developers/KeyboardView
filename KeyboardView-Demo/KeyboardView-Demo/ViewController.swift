//
//  ViewController.swift
//  KeyboardView-Demo
//
//  Created by 方林威 on 2020/11/5.
//

import UIKit
import KeyboardView

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    lazy var keyboard = AlphabeticKeyboardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputView = keyboard
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        keyboard.frame = CGRect(x: 0, y: 0, width: 375, height: 212 + view.safeAreaInsets.bottom + 40)
    }
}



class AlphabeticKeyboardView: UIView {
    
    let keyboard = KeyboardViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(keyboard.view)
        keyboard.view.translatesAutoresizingMaskIntoConstraints = false
        keyboard.view.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        keyboard.view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboard.view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
