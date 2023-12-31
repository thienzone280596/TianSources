//
//  AppColors.swift
//  TianSources
//
//  Created by ThienTran on 31/12/2023.
//

import Foundation
import UIKit

public class AppColors {
    
    static var bundle: Bundle? {
        return Bundle(for: Self.self)
    }
    
    
    //MARK: Primary
    // MARK: - whites
    public static let kFFFFFF = UIColor(named: "#FFFFFF", in: AppColors.bundle, compatibleWith: nil) ?? .white
    // MARK: - Blacks
    public static let k090909 = UIColor(named: "#090909", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k121826 = UIColor(named: "#121826", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k212936 = UIColor(named: "#212936", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k394150 = UIColor(named: "#394150", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k4D5562 = UIColor(named: "#4D5562", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k6C727F = UIColor(named: "#6C727F", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let k767676 = UIColor(named: "#767676", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let kCBCBCB = UIColor(named: "#CBCBCB", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let kEBEBEB = UIColor(named: "#EBEBEB", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let kF6F6F6 = UIColor(named: "#F6F6F6", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let K000000 = UIColor(named: "#000000", in: AppColors.bundle, compatibleWith: nil) ?? .black
    
    public static let k111112 = UIColor(named: "#111112", in: AppColors.bundle, compatibleWith: nil) ?? .black
       
    // MARK: - Grey
    public static let k9DA3AE = UIColor(named: "#9DA3AE", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kD2D5DA = UIColor(named: "#D2D5DA", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kE5E7EB = UIColor(named: "#E5E7EB", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kF3F4F6 = UIColor(named: "#F3F4F6", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kF9FAFB = UIColor(named: "#F9FAFB", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    
    public static let kD1D1D1 = UIColor(named: "#D1D1D1", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kD0D0D0 = UIColor(named: "#D0D0D0", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    
    public static let k707070 = UIColor(named: "#707070", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    
    
    // MARK: - Blue
    public static let k34317C = UIColor(named: "#34317C", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let k434A96 = UIColor(named: "#434A96", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let k6B72BE = UIColor(named: "#6B72BE", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let kC6D2FB = UIColor(named: "#C6D2FB", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let kE1E8FA = UIColor(named: "#E1E8FA", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let kF7F8FF = UIColor(named: "#F7F8FF", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let k211F5F = UIColor(named: "#211F5F", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    
    // MARK: - Yellow
    
    public static let kFDB818 = UIColor(named: "#FDB818", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kF0E1A9 = UIColor(named: "#F0E1A9", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kFFF7D9 = UIColor(named: "#FFF7D9", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kFFFFF7 = UIColor(named: "#FFFFF7", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kCB8600 = UIColor(named: "#CB8600", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kFFDD35 = UIColor(named: "#FFDD35", in: AppColors.bundle,
        compatibleWith: nil) ?? .yellow
    
    // MARK:  Services
    // MARK: - Brown
    
    public static let k554933 = UIColor(named: "#554933", in: AppColors.bundle, compatibleWith: nil) ?? .brown
    public static let k9F8F79 = UIColor(named: "#9F8F79", in: AppColors.bundle, compatibleWith: nil) ?? .brown
    public static let kEFDFC9 = UIColor(named: "#EFDFC9", in: AppColors.bundle, compatibleWith: nil) ?? .brown
    public static let kFFF3DD = UIColor(named: "#FFF3DD", in: AppColors.bundle, compatibleWith: nil) ?? .brown
    
    // MARK: - Green
    
    public static let k28AE72 = UIColor(named: "#28AE72", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let k6DD1A4 = UIColor(named: "#6DD1A4", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let kD4EFE3 = UIColor(named: "#D4EFE3", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let kEAF7F1 = UIColor(named: "#EAF7F1", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let k00864A = UIColor(named: "#00864A", in: AppColors.bundle, compatibleWith: nil) ?? .green
    
    // MARK: - Red
    
    public static let kEC5750 = UIColor(named: "#EC5750", in: AppColors.bundle, compatibleWith: nil) ?? .red
    public static let kF4B3B2 = UIColor(named: "#F4B3B2", in: AppColors.bundle, compatibleWith: nil) ?? .red
    public static let kFDEDEE = UIColor(named: "#FDEDEE", in: AppColors.bundle, compatibleWith: nil) ?? .red
    public static let kBD6968 = UIColor(named: "#BD6968", in: AppColors.bundle, compatibleWith: nil) ?? .red
    public static let kEC5750_20 = UIColor(named: "#EC5750_20", in: AppColors.bundle, compatibleWith: nil) ?? .red
    // MARK: - Purple
             
    public static let k7882DC = UIColor(named: "#7882DC", in: AppColors.bundle, compatibleWith: nil) ?? .purple
    public static let kB6B8EE = UIColor(named: "#B6B8EE", in: AppColors.bundle, compatibleWith: nil) ?? .purple
    public static let kE8E8FB = UIColor(named: "#E8E8FB", in: AppColors.bundle, compatibleWith: nil) ?? .purple
    
    // MARK: - Purple
    
    public static let kA3DDC9 = UIColor(named: "#A3DDC9", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let kC2F9E7 = UIColor(named: "#C2F9E7", in: AppColors.bundle, compatibleWith: nil) ?? .green
    public static let kECFFF9 = UIColor(named: "#ECFFF9", in: AppColors.bundle, compatibleWith: nil) ?? .green
    
    // MARK: Overlay
    // MARK: - Black
    public static let k090909_30 = UIColor(named: "#090909_30", in: AppColors.bundle, compatibleWith: nil) ?? .black
    public static let KF2F2F5 = UIColor(named: "#F2F2F5", in: AppColors.bundle, compatibleWith: nil) ?? .white
    
    //MARK: Utils
    public static let k262463 = UIColor(named: "#262463", in: AppColors.bundle, compatibleWith: nil) ?? .blue
    public static let kD9D9D9 = UIColor(named: "#D9D9D9", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kFEEEB6 = UIColor(named: "#FEEEB6", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
    public static let kEAECF3 = UIColor(named: "#EAECF3", in: AppColors.bundle, compatibleWith: nil) ?? .gray
    public static let kFEF6DA = UIColor(named: "#FEF6DA", in: AppColors.bundle, compatibleWith: nil) ?? .yellow
}

extension AppColors {
    //MARK: Dark/Light Color mode
    public static let titleColor = UIColor(light: AppColors.k090909, dark: .white)
    public static let descColor = UIColor(light: AppColors.k767676, dark: AppColors.k9DA3AE)

    //MARK: - background default (using for viewController and using for UIiew)
    public static let backgroundDefaultColor =  UIColor(light: .white, dark: AppColors.k121826)

}
