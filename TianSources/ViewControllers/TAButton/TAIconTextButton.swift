//
//  TAIconTextButton.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 29/08/2022.
//

import Foundation
import UIKit

struct TAIconTextButtonViewModel {
    let labelText: String
    let image: UIImage?
    let backgroundColor: UIColor?
}

final class TAIconTextButton: UIButton {
    
    private let label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor

    }
    
    func config(with viewModel:TAIconTextButtonViewModel ) {
        label.text = viewModel.labelText
        backgroundColor = viewModel.backgroundColor
        iconImageView.image = viewModel.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        //icon size tang kich thuoc icon
        let iconSize: CGFloat = 30
        let iconX: CGFloat = (frame.size.width - label.frame.size.width - iconSize - 5)/2
        iconImageView.frame = CGRect(x: iconX, y: (frame.size.height - iconSize)/2, width: iconSize, height: iconSize)
        label.frame = CGRect(x: iconX + iconSize + 5, y: 0, width: label.frame.size.width, height: frame.size.height)
    }
    
}

