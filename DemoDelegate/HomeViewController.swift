//
//  HomeViewController.swift
//  DemoDelegate
//
//  Created by MBP0020 on 4/17/19.
//  Copyright © 2019 truongnv15. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var textField: UITextField!
    var customView: MyCustomView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tfFrame = CGRect(x: 100, y: 300, width: 200, height: 50)
        textField = UITextField(frame: tfFrame)
        textField.placeholder = "User name"
        textField.borderStyle = .bezel
        view.addSubview(textField)


        let btFrame = CGRect(x: 100, y: tfFrame.maxY + 20, width: 200, height: 50)
        let button = UIButton(frame: btFrame)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(HomeViewController.handleButtonAddSubViewClick), for: .touchUpInside)
        button.setTitle("Add View", for: .normal)
        view.addSubview(button)

        let cvFrame = CGRect(x: 50, y: 500, width: 300, height: 200)
        customView = MyCustomView(frame: cvFrame)
        customView.delegate = self
        customView.backgroundColor = .green
    }

    @objc func handleButtonAddSubViewClick() {
        customView.userName = textField.text
        view.addSubview(customView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        customView.removeFromSuperview()
    }
}

extension HomeViewController: MyCustomViewDelegate {
    func myCustomView(view: MyCustomView, needPerformAction action: MyCustomView.Action) {
        switch action {
        case .edit(let newValue):
            textField.text = newValue
        }
    }
}
