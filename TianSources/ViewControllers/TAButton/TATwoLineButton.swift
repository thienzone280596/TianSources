//
//  TwoLineButton.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 29/08/2022.
//

import Foundation
import UIKit


struct TATwoLineButtonViewModel {
    let primaryText: String
    let secondaryText: String
}

final class TATwoLineButton: UIButton {
    
    private let primaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let secondaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGreen
    }
    //Config
    func config(with viewModel:TATwoLineButtonViewModel ) {
        primaryLabel.text = viewModel.primaryText
        secondaryLabel.text = viewModel.secondaryText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 5, y: 0, width: frame.size.width - 10, height: frame.size.height/2)
        secondaryLabel.frame = CGRect(x: 5, y: frame.size.height/2, width: frame.size.width - 10, height: frame.size.height/2)
    }
    
}
