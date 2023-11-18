//
//  TASnackbarView.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 29/08/2022.
//

import UIKit

class TASnackbarView: UIView {
    
    let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var imageView:UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    let viewModel: SnackbarViewModel
    var handler:Handlers?
    
    init(viewModel: SnackbarViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        addSubview(label)
        if viewModel.image != nil {
            addSubview(imageView)
        }
        backgroundColor = .gray
        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.masksToBounds = true
        configure()
    }
    
    private func configure() {
        label.text = viewModel.text
        imageView.image = viewModel.image
        
        switch viewModel.type {
            case .info:
                break
            case .action(handler: let handler):
                self.handler = handler
                isUserInteractionEnabled = true
                let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSnackbar))
                gesture.numberOfTapsRequired = 1
                gesture.numberOfTouchesRequired = 1
                addGestureRecognizer(gesture)
        }
    }
    
    @objc func didTapSnackbar() {
        handler?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if viewModel.image != nil {
            imageView.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
            label.frame = CGRect(
                x: imageView.frame.size.width,
                y: 0,
                width: frame.size.width - imageView.frame.size.width,
                height: frame.size.height)
        } else {
            label.frame = bounds
        }
    }
    
    public func show(top ViewControler: UIViewController) {
        
    }
}
