//
//  TAFloatingTextfield.swift
//  TianSources
//
//  Created by ThienTran on 31/12/2023.
//

import Foundation
import UIKit

public enum TextFieldType {
    case Default
    case Focus
    case Filled
    case Error
    case Filled_Disable
    case Disable
    
}

@objc public protocol FloatingTextfieldDelegate: AnyObject {
    @objc optional func textFieldDidBeginEditing(sender: FloatingTextfield,_ textField: UITextField)
    @objc optional func textFieldDidEndEditing(sender: FloatingTextfield,_ textField: UITextField)
    @objc optional func textFieldDidChange(sender: FloatingTextfield,_ textField: UITextField)
    @objc optional func textField(_ sender: FloatingTextfield,
                   textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    @objc optional func textFieldShouldReturn(sender: FloatingTextfield,_ textField: UITextField) -> Bool
    @objc optional func didTapClearData(sender: FloatingTextfield)
    
}

public class FloatingTextfield: UIView {
    //view main
    private let vContent:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let vTextField:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //textfield and place hoder
    private let lblPlaceHolder:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Place holder"
        label.textColor = .black
        label.frame.size.height = 14
        return label
    }()
    
    private let textField:UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.placeholder = "TextField"
        return tf
    }()
    //btnClear || btn eye
    private let btnClear:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.frame.size.width = 20
        button.frame.size.height = 20
        return button
    }()
    
    private let btnEye:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.frame.size.width = 20
        button.frame.size.height = 20
        return button
    }()
    
    private lazy var stackViewButton: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [btnEye, btnClear])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewInput: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lblPlaceHolder, textField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let lblError:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error code text field"
        label.textColor = .red
        return label
    }()
    
    public var state:TextFieldType = .Default
    private var defaultErrLblTopConstant: CGFloat = 8.0
    private var isTextSecured = false
    weak var delegate:FloatingTextfieldDelegate?
    
    // MARK: Colors
    private let backgroundColorDefault =  UIColor(light: .white, dark: AppColors.k121826)
    private let txtColor = UIColor(light: AppColors.k090909, dark: .white)
    ///Default (include background color and border color)
    private let backgroundTextfieldDefaultColor = UIColor(light: .white, dark: AppColors.k212936)
    private let borderDefaultTextfieldColor = UIColor(light: AppColors.kD1D1D1, dark: AppColors.k394150)
    
    ///Focus (include background color, border color, placeholder color)
    private let backgroundTextfieldFocusColor = UIColor(light: AppColors.kF7F8FF, dark: AppColors.k4D5562)
    private let boderTextfieldFocusColor = UIColor(light: AppColors.k6B72BE, dark: AppColors.k6B72BE)
    private let placehoderTexfieldFocusColor = UIColor(light: AppColors.k6B72BE, dark: AppColors.k9DA3AE)
    
    ///Filled (include background color, border color, placeholder color)
    private let backgroundTextfieldFilledColor = UIColor(light: AppColors.kFFFFFF, dark: AppColors.k212936)
    private let borderTextfieldFilledColor = UIColor(light: AppColors.kD1D1D1, dark: AppColors.k394150)
    private let placehoderTextfieldFilledColor = UIColor(light: AppColors.k767676, dark: AppColors.k9DA3AE)
    
    ///Error (include background color, border color, placeholder color)
    private let backgroundTextfieldErrorColor =  UIColor(light: AppColors.kFDEDEE, dark: AppColors.kEC5750_20)
    private let borderTextfieldErrorColor =  UIColor(light:  AppColors.kEC5750, dark: AppColors.kEC5750)
    private let placeholderTextfieldErrorColor = UIColor(light: AppColors.k767676, dark: AppColors.k9DA3AE)
    
    ///Filled Disable (include background color, border color, placeholder color)
    private let backgroundTextfieldFilledDisableColor =  UIColor(light:  AppColors.kE8E8FB, dark: AppColors.k394150)
    private let borderTextfieldFilledDisableColor =  UIColor(light:  AppColors.kE8E8FB, dark: AppColors.k394150)
    private let placeholderTextfieldFilledDisableColor = UIColor(light: AppColors.kE8E8FB, dark: AppColors.k394150)
    
    ///Disable (include background color, border color, placeholder color)
    private let backgroudTextfieldDisableColor =  UIColor(light:  AppColors.kFFFFFF, dark: AppColors.k394150)
    private let borderTextfieldDisableColor =  UIColor(light:  AppColors.kF6F6F6, dark: AppColors.K000000)
    
    var lblErrTopConstraint:NSLayoutConstraint?
    var rightTextfieldContraint:NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.layer.cornerRadius = 8
    }
    
    private func setupConstraint() {
        self.addSubview(vContent)
        vContent.addSubview(vTextField)
        vContent.addSubview(stackViewButton)
        vTextField.addSubview(stackViewInput)
        self.addSubview(lblError)
        NSLayoutConstraint.activate([
            vContent.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            vContent.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            vContent.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            vContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            vTextField.topAnchor.constraint(equalTo: vContent.topAnchor, constant: 10),
            vTextField.bottomAnchor.constraint(equalTo: vContent.bottomAnchor, constant: -10),
            vTextField.leftAnchor.constraint(equalTo: vContent.leftAnchor, constant: 12),
            stackViewButton.leftAnchor.constraint(equalTo: vTextField.rightAnchor, constant: 12),
            stackViewButton.rightAnchor.constraint(equalTo: vContent.rightAnchor, constant: -12),
            stackViewButton.centerYAnchor.constraint(equalTo: vTextField.centerYAnchor),
            
            btnClear.widthAnchor.constraint(equalToConstant: 20),
            btnEye.widthAnchor.constraint(equalToConstant: 20),
            
            stackViewInput.topAnchor.constraint(equalTo: vTextField.topAnchor, constant: 0),
            stackViewInput.leftAnchor.constraint(equalTo: vTextField.leftAnchor, constant: 0),
            stackViewInput.rightAnchor.constraint(equalTo: vTextField.rightAnchor, constant: 0),
            stackViewInput.bottomAnchor.constraint(equalTo: vTextField.bottomAnchor, constant: 0),
            
            lblError.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            lblError.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            lblError.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0)
        ])
        
        lblErrTopConstraint = lblError.topAnchor.constraint(equalTo: vContent.bottomAnchor, constant: 0)
        lblErrTopConstraint?.isActive = true
        rightTextfieldContraint = vTextField.rightAnchor.constraint(equalTo: vContent.rightAnchor, constant: -42)
        rightTextfieldContraint?.isActive = true
    }
    
    public func configureUI(with textfieldType:TextFieldType,
                            placeHolder: String = "",
                            isShowSecurity: Bool = false,
                            keyboardType: UIKeyboardType = .default) {
        if isShowSecurity {
            self.setEyeButton(isHidden: false)
            self.isTextSecured = true
            self.setupUISecured(isSecured: isTextSecured)
        } else {
            self.setEyeButton(isHidden: true)
        }
        self.lblPlaceHolder.text = placeHolder.isEmpty ? self.lblPlaceHolder.text : placeHolder
        self.btnClear.setImage(UIImage(systemName: "xmark.circle"),for: .normal)
        self.changeState(with: textfieldType)
        self.textField.keyboardType = keyboardType
        self.textField.delegate = self
        self.textField.clearsOnBeginEditing = false
        self.vContent.addTapGesture(tapNumber: 1, target: self, action: #selector(tapToEdditing))
    }
    
    // MARK:  change sate
    public func changeState(with textfieldType: TextFieldType) {
        self.state = textfieldType
        UIView.animate(withDuration: 0.3, animations: { [self] in
            switch textfieldType {
            case .Default:
                self.setupDefault()
            case .Focus:
                self.focusOnStateUI()
            case .Filled:
                self.filledStateUI()
            case .Error:
                self.errorStateUI()
            case .Filled_Disable:
                self.disableFilledStateUI()
            case .Disable:
                self.disableStateUI()
            }
            
            //txtInput.textColor = txtColor
            self.layoutIfNeeded()
        })
    }
    
    // TODO: - focus On StateUI
    public func focusOnStateUI() {
        self.textField.alpha = 1
        self.textField.isHidden = false
        self.vContent.backgroundColor = backgroundTextfieldFocusColor
        self.vContent.addBorder(with: boderTextfieldFocusColor, width: 1.5)
        self.lblPlaceHolder.textColor = placehoderTexfieldFocusColor
        self.setClearButton(isHidden: true)
        self.animHideErrLbl()
    }
    
    // TODO: - filled StateUI
    public func filledStateUI() {
        self.textField.alpha = 1
        self.textField.isHidden = false
        self.vContent.backgroundColor = backgroundTextfieldFilledColor
        self.stackViewInput.backgroundColor = backgroundTextfieldFilledColor
        self.vContent.addBorder(with: borderTextfieldFilledColor, width: 1)
        self.lblPlaceHolder.textColor = placehoderTextfieldFilledColor
        //self.lblPlaceHolder.font = AppFonts.shared.interRegular(ofSize: 12)
        self.setClearButton(isHidden: true)
        self.animHideErrLbl()
        self.layoutIfNeeded()
    }
    
      // TODO: - Error state UI
    public func errorStateUI() {
        self.textField.alpha = 1
        self.textField.isHidden = false
        self.vContent.backgroundColor = backgroundTextfieldErrorColor
        self.vContent.addBorder(with: borderTextfieldErrorColor, width: 1)
        self.lblPlaceHolder.textColor = placeholderTextfieldErrorColor
        //self.lblPlaceHolder.font = AppFonts.shared.interRegular(ofSize: 12)
        self.backgroundColor = backgroundColorDefault
        self.setClearButton(isHidden: false)
        self.animShowErrLbl()
    }
    
    // TODO: - disable Filled StateUI
    public func disableFilledStateUI() {
        self.textField.alpha = 1
        self.textField.isHidden = false
        self.textField.isEnabled = false
        self.vContent.backgroundColor = backgroundTextfieldFilledDisableColor
        self.vContent.addBorder(with: borderTextfieldFilledDisableColor, width: 0)
        self.setClearButton(isHidden: true)
        self.animHideErrLbl()
    }
    
    // TODO: - disable StateUI
    public func disableStateUI() {
        self.textField.isHidden = true
        self.textField.isEnabled = false
        self.vContent.backgroundColor = backgroudTextfieldDisableColor
        self.vContent.addBorder(with: borderTextfieldDisableColor, width: 1)
        self.lblPlaceHolder.textColor = placeholderTextfieldFilledDisableColor
        self.setClearButton(isHidden: true)
        self.animHideErrLbl()
    }
    
    // TODO: - setup Type default
    public func setupDefault() {
        //set view main
        self.lblError.alpha = 0.0
        self.vContent.layer.cornerRadius = 6
        self.vContent.layer.borderWidth = 1.0
        self.vContent.layer.borderColor = borderDefaultTextfieldColor.cgColor
        self.vContent.backgroundColor = backgroundTextfieldDefaultColor
        self.textField.isHidden = true
        self.setClearButton(isHidden: true)
        self.lblPlaceHolder.textColor = txtColor
        self.rightTextfieldContraint?.constant = -12
       // self.lblPlaceHolder.font = AppFonts.shared.interRegular(ofSize: 16)
        self.animHideErrLbl()
    }
    
    // MARK: -- animation
    @objc func tapToEdditing() {
        self.textField.becomeFirstResponder()
    }
    
    //TODO: Get set vale data
    public func getTextFieldData() -> String {
        return self.textField.text ?? ""
    }
    
      // TODO: - set Textfield Data
    public func setTextFielData(text: String) {
        self.textField.text = text
        updateUIAfterSetText()
    }
    
    // MARK:  update ui after set text
    func updateUIAfterSetText() {
        if ((self.textField.text ?? "").count > 0) {
            if (self.textField.isHidden) {
                self.textField.isHidden = false
            }
            self.lblPlaceHolder.font = UIFont.systemFont(ofSize: 12)
            self.lblPlaceHolder.textColor = AppColors.descColor
        }
    }
    
    // TODO: - set Label text
  public func setErrLabelText(errText: String, placeHolder:String = "") {
      self.lblError.text = errText
      self.lblError.textColor = AppColors.kEC5750
      self.lblPlaceHolder.text = placeHolder.isEmpty  ? self.lblPlaceHolder.text : placeHolder
  }
  
  // TODO: - set Err Text
  public func setErrText(errText: String) {
      self.lblError.text = errText
      self.lblError.textColor = AppColors.kEC5750
  }
      // TODO: - Begin Edit
    func beginEdit() {
        self.textField.alpha = 0
        UIView.animate(withDuration: 0.3) {
            if let font = self.lblPlaceHolder.font {
                self.lblPlaceHolder.font = UIFont.systemFont(ofSize: 12)
            }
            self.focusOnStateUI()
        }
    }
    
      // TODO: - End edit
    func endEdit() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            if let text = self.textField.text, text.isEmpty == false {
                // MARK: -- if input has value
                self.filledStateUI()
            } else {
                self.setupDefault()
                if let font = self.lblPlaceHolder.font {
                    self.lblPlaceHolder.font = UIFont(name: font.fontName, size: 16)
                    self.lblPlaceHolder.textColor = self.placehoderTexfieldFocusColor
                    self.vContent.backgroundColor = self.backgroundTextfieldDefaultColor
                }
            }
        }
    }
    
    //MARK: -- set state UI
    private func toggleClearButton(){
        let isEmpty = self.getTextFieldData().isEmpty
        self.setClearButton(isHidden: (isEmpty ? true : false))
    }
    
    // MARK:  set Clear button
    private func setClearButton(isHidden: Bool) {
        if btnClear.isHidden != isHidden {
            self.btnClear.isHidden = isHidden
        }
    }
    
    // MARK:  set Eye Button
    private func setEyeButton(isHidden: Bool) {
        if btnEye.isHidden != isHidden {
            self.btnEye.isHidden = isHidden
        }
    }
    
    //MARK: Animation
    private func animShowErrLbl() {
        if  self.lblError.alpha == 1.0 {return}
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.lblErrTopConstraint?.constant = self?.defaultErrLblTopConstant ?? 0.0
            self?.lblError.alpha = 1.0
            self?.layoutIfNeeded()
        })
    }
    // MARK:  anmate hide Error label
    private func animHideErrLbl() {
        guard let errText = lblError.text else {return}
        if  self.lblError.alpha == 0.0 || errText.isEmpty {return}
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.lblErrTopConstraint?.constant = 0.0
            self?.lblError.alpha = 0.0
            self?.layoutIfNeeded()
        })
    }
    // TODO: - setup open-close eye
  public func setupUISecured(isSecured: Bool) {
      let img: UIImage?
      if isSecured {
          self.textField.isSecureTextEntry = true
          img = UIImage(systemName: "eye")
      } else {
          self.textField.isSecureTextEntry = false
          img = UIImage(systemName: "eye.slash.fill")
      }
      self.btnEye.setImage(img, for: .normal)
   
  }
  
}

extension FloatingTextfield: UITextFieldDelegate {
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        if self.state == .Error {
            self.changeState(with: .Filled)
        }
        self.delegate?.textFieldDidChange?(sender: self, textField)
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        beginEdit()
        self.delegate?.textFieldDidBeginEditing?(sender: self, textField)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        endEdit()
        self.delegate?.textFieldDidEndEditing?(sender: self, textField)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(self, textField: textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(sender: self, textField) ?? true
    }
}

