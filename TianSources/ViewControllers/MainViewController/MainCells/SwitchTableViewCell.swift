//
//  SwitchTableViewCell.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 26/06/2022.
//


import UIKit

class SwitchTableViewCell: UITableViewCell {
    static let identifier = "SWitchTableViewCell"
    //Tao UIView va UIImage tai tableViewCell
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.tintColor = .systemBlue
        return mySwitch
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
       return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize)/2,
            y: (size - imageSize)/2,
            width: imageSize,
            height: imageSize)
        
        mySwitch.frame = CGRect(
            x: contentView.frame.size.width - mySwitch.frame.size
                .width - 20,
            y: (contentView.frame.size.height - mySwitch.frame.size
                    .height)/2,
            width: mySwitch.frame.size.width,
            height: mySwitch.frame.size.width)
        
        
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: iconContainer.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //Xet gia tri cho cac cell
        self.iconImageView.image = nil
        self.iconContainer.backgroundColor = nil
        self.label.text = nil
        self.mySwitch.isOn = false
    }
    
    public func configure(with model: SettingSwitchOption) {
        label.text = model.title
        iconImageView.image =  model.icon
        iconContainer.backgroundColor = model.bacgroundColor
        mySwitch.isOn = model.isOn
    }
}
