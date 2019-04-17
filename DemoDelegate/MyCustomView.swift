//
//  MyCustomView.swift
//  DemoDelegate
//
//  Created by MBP0020 on 4/17/19.
//  Copyright © 2019 truongnv15. All rights reserved.
//

import UIKit
protocol MyCustomViewDelegate: class {
    func myCustomView(view: MyCustomView, needPerformAction action: MyCustomView.Action)
}
class MyCustomView: UIView {
    enum Action {
        case edit(String?)
    }

    var textField: UITextField!
    weak var delegate: MyCustomViewDelegate?

    var userName: String? {
        set {
            textField.text = userName
        }
        get {
            return textField.text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        //Add TextField
        let frameTextField = CGRect(x: 10, y: 10, width: frame.width - 20, height: 50)
        textField = UITextField(frame: frameTextField)
        textField.borderStyle = .roundedRect
        addSubview(textField)

        //Add button
        let frameButton = CGRect(x: 10, y: frameTextField.maxY + 10, width: frame.width - 20, height: frame.height - frameTextField.maxY - 10 - 10)
        let button = UIButton(frame: frameButton)
        button.backgroundColor = .blue
        button.setTitle("Click", for: .normal)
        button.addTarget(self, action: #selector(MyCustomView.handleButtonClick), for: .touchUpInside)
        addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleButtonClick() {
        let newValue = textField.text
        delegate?.myCustomView(view: self, needPerformAction: .edit(newValue))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        removeFromSuperview()
    }

}
