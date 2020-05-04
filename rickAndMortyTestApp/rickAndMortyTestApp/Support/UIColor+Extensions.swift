//
//  UIColor+Extensions.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 30/04/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import UIKit

enum pixelWolfColors {
    case gray1
    case gray2
    case gray3
    case gray4
    case gray5
    case gray6
    case indigo
    case black
    case white
}

extension UIColor {
    
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
    
    convenience init(_ color: pixelWolfColors) {
        switch color {
        case .gray1:
            self.init(rgb: 0x8E8E92)
        case .gray2:
            self.init(rgb: 0xAEAEB2)
        case .gray3:
            self.init(rgb: 0xC8C7CC)
        case .gray4:
            self.init(rgb: 0xD2D1D6)
        case .gray5:
            self.init(rgb: 0xE6E5EA)
        case .gray6:
            self.init(rgb: 0xF3F2F7)
        case .indigo:
            self.init(rgb: 0x5856D6)
        case .black:
            self.init(rgb: 0x092032)
        case .white:
            self.init(rgb: 0xFFFFFF)
        }
    }
}
