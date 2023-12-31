//
//  TATextFieldViewController.swift
//  TianSources
//
//  Created by ThienTran on 31/12/2023.
//

import UIKit

class TATextFieldViewController: UIViewController {
    private let exampleView:UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
       return view
    }()
    
    private let textfield:FloatingTextfield = {
       let tf = FloatingTextfield()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(exampleView)
        exampleView.addSubview(textfield)
        NSLayoutConstraint.activate([
            exampleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            exampleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            exampleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            exampleView.heightAnchor.constraint(equalToConstant: 60),
            textfield.topAnchor.constraint(equalTo: exampleView.topAnchor, constant: 0),
            textfield.leftAnchor.constraint(equalTo: exampleView.leftAnchor, constant: 0),
            textfield.rightAnchor.constraint(equalTo: exampleView.rightAnchor, constant: 0),
            textfield.bottomAnchor.constraint(equalTo: exampleView.bottomAnchor, constant: 0),
        ])
        // Do any additional setup after loading the view.
        textfield.configureUI(with: .Default,
                              placeHolder: "Password",
                              isShowSecurity: false)
    }
    


}
