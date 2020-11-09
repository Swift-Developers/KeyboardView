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
    
    @IBOutlet weak var textField: UITextField!
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
        keyboard.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 212.0 + view.safeAreaInsets.bottom)
        
        UIResponder.keyboardDidShowNotification
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
        keyboard.view.topAnchor.constraint(equalTo: topAnchor, constant: 5.0).isActive = true
        keyboard.view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        keyboard.view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

extension Double {
    
    func auto() -> Double {
        guard UIDevice.current.userInterfaceIdiom == .phone else {
            return self
        }
        let base = 375.0
        let screenWidth = Double(UIScreen.main.bounds.width)
        let screenHeight = Double(UIScreen.main.bounds.height)
        let width = min(screenWidth, screenHeight)
        
        let result = self * (width / base)
        let scale = Double(UIScreen.main.scale)
        return (result * scale).rounded(.up) / scale
    }
}
//
//extension BinaryInteger {
//
//    func auto() -> Double {
//        let temp = Double("\(self)") ?? 0
//        return temp.auto()
//    }
//    func auto<T>() -> T where T : BinaryInteger {
//        let temp = Double("\(self)") ?? 0
//        return temp.auto()
//    }
//    func auto<T>() -> T where T : BinaryFloatingPoint {
//        let temp = Double("\(self)") ?? 0
//        return temp.auto()
//    }
//}

extension BinaryFloatingPoint {
    
    func auto() -> Double {
        let temp = Double("\(self)") ?? 0
        return temp.auto()
    }
    func auto<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.auto())
    }
    func auto<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.auto())
    }
}
