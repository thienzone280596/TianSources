//
//  TAPopupViewController.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 13/07/2022.
//

import UIKit

class TAButtonCustom: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.createButton()
        let button = TATwoLineButton(frame: CGRect(x: 0, y: 0, width: 300, height: 55))
        view.addSubview(button)
        button.center = view.center
        button.config(with: TATwoLineButtonViewModel(primaryText: "Start free trial", secondaryText: "3 days free then 1.99$/month"))
        //Create button with image
        let iconButton = TAIconTextButton(frame: CGRect(x: (view.frame.size.width - 300)/2, y: 60, width: 300, height: 55))
        view.addSubview(iconButton)
        iconButton.config(with: TAIconTextButtonViewModel(
            labelText: "Check Out",
            image: UIImage(systemName: "cart"),
            backgroundColor: .systemRed))

    }
    
    // MARK: - Create button using config iOS 15
    fileprivate func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.tintColor = .white
        button.center = view.center
        button.configuration = .primary()
//        button.configurationUpdateHandler = { button in
//            if button.isHighlighted {
//                button.backgroundColor = .systemYellow
//            }
//        }
        self.view.addSubview(button)
    }
  
    

}


extension UIButton.Configuration {
    //Button config
    static func primary() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemPink
        config.title = "Tap me"
        config.subtitle = "3.99$/month after trial ends"
        config.cornerStyle = .medium
        config.titleAlignment = .center
        //Hieu ung loading
        //config.showsActivityIndicator = true
        return config
    }
}
