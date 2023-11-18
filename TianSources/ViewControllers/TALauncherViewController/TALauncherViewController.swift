//
//  TALauncherViewController.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 11/07/2022.
//

import UIKit

class TALauncherViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController()
        // Do any additional setup after loading the view.
    }
    

    func pushViewController() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let vc = AppStoryboard.Home.viewController(viewControllerClass: TAMainViewController.self)
        let nv = UINavigationController.init(rootViewController: vc)
        nv.setNavigationBarHidden(true, animated: false)
        window.rootViewController = nv
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.makeKeyAndVisible()
        })
    }

}
