//
//  Extension+UIColor.swift
//  TianSources
//
//  Created by ThienTran on 31/12/2023.
//

import Foundation
import UIKit

public extension UIColor {
    
    convenience init(light: UIColor, dark: UIColor) {
        
        if #available(iOS 13, *) {
            self.init(dynamicProvider: { trait in
                return trait.userInterfaceStyle == .light ? light : dark
            })
        } else {
            self.init(cgColor: light.cgColor)
        }
    }
    
    var dark: UIColor  {
        if #available(iOS 13.0, *) {
            return resolvedColor(with: .init(userInterfaceStyle: .dark))
        } else {
            return self
        }
    }
    
    var light: UIColor {
        if #available(iOS 13.0, *) {
            return resolvedColor(with: .init(userInterfaceStyle: .light))
        } else {
            return self
        }
    }
    
}


public extension UIColor {
    convenience init(_ hex: UInt) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
    
    /**
     Creates an UIColor Object based on provided RGB value in integer
     - parameter red:   Red Value in integer (0-255)
     - parameter green: Green Value in integer (0-255)
     - parameter blue:  Blue Value in integer (0-255)
     - returns: UIColor with specified RGB values
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}

// MARK: UIColor Helper
public extension UIColor {
    
    /// Returns random generated color.
    static var random: UIColor {
        srandom(arc4random())
        var red: Double = 0
        
        while (red < 0.1 || red > 0.84) {
            red = drand48()
        }
        
        var green: Double = 0
        while (green < 0.1 || green > 0.84) {
            green = drand48()
        }
        
        var blue: Double = 0
        while (blue < 0.1 || blue > 0.84) {
            blue = drand48()
        }
        
        return .init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    static func colorHash(name: String?) -> UIColor {
        guard let name = name else {
            return .red
        }
        
        var nameValue = 0
        for character in name {
            let characterString = String(character)
            let scalars = characterString.unicodeScalars
            nameValue += Int(scalars[scalars.startIndex].value)
        }
        
        var r = Float((nameValue * 123) % 51) / 51
        var g = Float((nameValue * 321) % 73) / 73
        var b = Float((nameValue * 213) % 91) / 91
        
        let defaultValue: Float = 0.84
        r = min(max(r, 0.1), defaultValue)
        g = min(max(g, 0.1), defaultValue)
        b = min(max(b, 0.1), defaultValue)
        
        return .init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
}
