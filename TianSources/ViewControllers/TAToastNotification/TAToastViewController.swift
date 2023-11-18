//
//  TAToastViewController.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 29/08/2022.
//

import UIKit

class TAToastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Create Button
        for x in 0..<2 {
            let button = UIButton(frame: CGRect(x: 20, y: 130 + (CGFloat(x) * 55) + (CGFloat(x) * 10), width: view.frame.size.width - 40, height: 55))
            button.tag = x + 1
            button.backgroundColor = .systemBlue
            button.setTitle("Show snackbar\(x + 1)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            view.addSubview(button)
        }
        
    }
    
    @objc func didTapButton(_ sender: UIButton){
        let viewModel:SnackbarViewModel
        
        if sender.tag == 1 {
            //Chọn button 1
            print("Click button 1")
            viewModel = SnackbarViewModel(type: .info, text: "Hello Word", image: UIImage(named: "bell"))
        } else {
            print("Click Button 2")
            viewModel = SnackbarViewModel(type: .action(handler: {
                [weak self] in
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }),
            text: "Hello Word",
            image: UIImage(named: "bell"))
        }
        let frame = CGRect(x: 0, y: 0, width: view.frame.width/1.5, height: 60)
        let snackBar = TASnackbarView(viewModel: viewModel, frame: frame)
        showSnackbar(snackbar: snackBar)
        
    }
    // MARK: - show alert
    private func showAlert() {
        let alert = UIAlertController(
            title: "It works",
            message: "this tap action",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    // MARK: - show show Snackbar
    public func showSnackbar(snackbar:TASnackbarView) {
        
        let width = view.frame.width/1.5
        snackbar.frame = CGRect(
            x: (view.frame.size.width-width)/2,
            y: view.frame.height,
            width: width,
            height: 60)
        view.addSubview(snackbar)
        
        UIView.animate(withDuration: 0.3, animations: {
            snackbar.frame = CGRect(
                x: (self.view.frame.size.width-width)/2,
                y: self.view.frame.height - 70,
                width: width,
                height: 60)
        }) { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    UIView.animate(withDuration: 0.3, animations: {
                        snackbar.frame = CGRect(
                            x: (self.view.frame.size.width-width)/2,
                            y: self.view.frame.height,
                            width: width,
                            height: 60)
                    }) { finish in
                        if finish {
                            snackbar.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
}
