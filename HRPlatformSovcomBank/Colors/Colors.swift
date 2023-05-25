//
//  Colors.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 24.05.2023.
//

import UIKit

extension UIColor {
    
    // MARK: - Color Scheme
    public class var primary300: UIColor
    {
        UIColor(red: 84/255, green: 118/255, blue: 226/255, alpha: 1)
    }
    
    public class var secondary300: UIColor
    {
        UIColor(red: 222/255, green: 110/255, blue: 113/255, alpha: 1)
    }
    
    public class var primary500: UIColor
    {
        UIColor(red: 53/255, green: 87/255, blue: 196/255, alpha: 1)
    }
    
    public class var secondary500: UIColor
    {
        UIColor(red: 218/255, green: 81/255, blue: 85/255, alpha: 1)
    }
    
    public class var primary700: UIColor
    {
        UIColor(red: 33/255, green: 58/255, blue: 139/255, alpha: 1)
    }
    
    public class var secondary700: UIColor
    {
        UIColor(red: 204/255, green: 75/255, blue: 76/255, alpha: 1)
    }
    
    public class var system300: UIColor
    {
        UIColor(red: 231/255, green: 234/255, blue: 238/255, alpha: 1)
    }
    
    public class var system300b: UIColor
    {
        UIColor(red: 206/255, green: 218/255, blue: 233/255, alpha: 1)
    }
    
    public class var system900: UIColor
    {
        UIColor(red: 4/255, green: 4/255, blue: 4/255, alpha: 1)
    }
    
    public class var system600: UIColor
    {
        UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
    }
    
    public class var grade: UIColor
    {
        UIColor(red: 246/255, green: 186/255, blue: 33/255, alpha: 1)
    }
    
    public class var grade600: UIColor
    {
        UIColor(red: 240/255, green: 221/255, blue: 184/255, alpha: 1)
    }
    
    public class var success: UIColor
    {
        UIColor(red: 124/255, green: 201/255, blue: 26/255, alpha: 1)
    }
    
    // MARK: - Lifecycle
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
