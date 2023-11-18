//
//  TAExtension+UIViewController.swift
//  TianSources
//
//  Created by ThienTran on 18/11/2023.


import Foundation
import UIKit


public extension UIViewController {

    
    static var bundle: Bundle? {
        return Bundle(for: self)
    }

    private static func genericInstance<T: UIViewController>() -> T {
        return T.init(nibName: String(describing: self), bundle: self.bundle)
    }

    static func instance() -> Self {
        return genericInstance()
    }
   
}

//MARK: Push Pop Default
public extension UIViewController {
    
    func push(vc: UIViewController,
              transType: CATransitionType = CATransitionType.fade,
              transDur: CFTimeInterval = 0.5,
              completion: (() -> Void)? = nil) {
        
        let transition = CATransition()
        transition.duration = transDur
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transType
        transition.subtype = CATransitionSubtype.fromTop
        
        var navController: UINavigationController?
        if self is UINavigationController {
            navController = self as? UINavigationController
        } else {
            navController = self.navigationController
        }
        
        if let completion = completion {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            if self.responds(to: #selector(getter: navController?.interactivePopGestureRecognizer)) {
                navController?.interactivePopGestureRecognizer?.isEnabled = false
            }
            navController?.view.layer.add(transition, forKey: nil)
            navController?.pushViewController(vc, animated: false)
            CATransaction.commit()
        } else {
            navController?.view.layer.add(transition, forKey: nil)
            navController?.pushViewController(vc, animated: false)
        }
        
    }
    
    func pop(transType: CATransitionType = CATransitionType.fade,
             transDur: CFTimeInterval = 0.5,
             completion: (() -> Void)? = nil) {
        
        let transition:CATransition = CATransition()
        transition.duration = transDur
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transType
        transition.subtype = CATransitionSubtype.fromRight
        
        var navController: UINavigationController?
        if self is UINavigationController {
            navController = self as? UINavigationController
        } else {
            navController = self.navigationController
        }
        
        if let completion = completion {
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            if self.responds(to: #selector(getter: navController?.interactivePopGestureRecognizer)) {
                navController?.interactivePopGestureRecognizer?.isEnabled = false
            }
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popViewController(animated: false)
            CATransaction.commit()
            
        } else {
            
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popViewController(animated: false)
        }
    }
    
    func popToViewController(vc: UIViewController,
                             transType: CATransitionType = CATransitionType.fade,
                             transDur: CFTimeInterval = 0.5,
                             completion: (() -> Void)? = nil) {
        
        let transition:CATransition = CATransition()
        transition.duration = transDur
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transType
        transition.subtype = CATransitionSubtype.fromRight
        
        var navController: UINavigationController?
        if self is UINavigationController {
            navController = self as? UINavigationController
        } else {
            navController = self.navigationController
        }
        
        if let completion = completion {
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            if self.responds(to: #selector(getter: navController?.interactivePopGestureRecognizer)) {
                navController?.interactivePopGestureRecognizer?.isEnabled = false
            }
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popToViewController(vc, animated: false)
            CATransaction.commit()
            
        } else {
            
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popToViewController(vc, animated: false)
        }
    }
    
    func push(vc: UIViewController, completion: (() -> Void)?) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        if self.responds(to: #selector(getter: self.navigationController?.interactivePopGestureRecognizer)) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        CATransaction.commit()
    }
    
    func popToRootViewControoler(transType: CATransitionType = CATransitionType.fade,
                                 transDur: CFTimeInterval = 0.5,
                                 completion: (() -> Void)? = nil) {
        let transition:CATransition = CATransition()
        transition.duration = transDur
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transType
        transition.subtype = CATransitionSubtype.fromRight
        
        var navController: UINavigationController?
        if self is UINavigationController {
            navController = self as? UINavigationController
        } else {
            navController = self.navigationController
        }
        
        if let completion = completion {
            
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            if self.responds(to: #selector(getter: navController?.interactivePopGestureRecognizer)) {
                navController?.interactivePopGestureRecognizer?.isEnabled = false
            }
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popToRootViewController(animated: false)
            CATransaction.commit()
            
        } else {
            navController?.view.layer.add(transition, forKey: kCATransition)
            navController?.popToRootViewController(animated: false)
        }
    }
    
    
    func setRootView(vc: UIViewController,
              transType: CATransitionType = CATransitionType.fade,
              transDur: CFTimeInterval = 0.5,
              completion: (() -> Void)? = nil) {
        
        let transition = CATransition()
        transition.duration = transDur
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transType
        transition.subtype = CATransitionSubtype.fromTop
        
        var navController: UINavigationController?
        if self is UINavigationController {
            navController = self as? UINavigationController
        } else {
            navController = self.navigationController
        }
        
        if let completion = completion {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            if self.responds(to: #selector(getter: navController?.interactivePopGestureRecognizer)) {
                navController?.interactivePopGestureRecognizer?.isEnabled = false
            }
            navController?.view.layer.add(transition, forKey: nil)
            navController?.setViewControllers([vc], animated: false)
            CATransaction.commit()
        } else {
            navController?.view.layer.add(transition, forKey: nil)
            navController?.setViewControllers([vc], animated: false)
        }
        
    }
    
    func showAlert(title: String?, message: String?, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: Keyboard handle
public extension UIViewController {
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

//MARK: Dark/Light Mode Handle
public extension UIViewController {
    //can rxswift
//    func changeAppearance(style: UIUserInterfaceStyle) {
//        UIWindow.key.changeAppearanceMode(style: style)
//    }
    
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }
}


public extension UIViewController {
    var className: String {
        return String(describing: Self.self)
    }
}

