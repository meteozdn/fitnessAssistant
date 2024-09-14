//
//  ImageButtonComponent.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation
import UIKit


extension HomeViewController{
    
    func buttonWithImage(image: UIImage, text: String) -> UIButton? {
        let text = "\(text.capitalized)"
        let textColor = UIColor.white
        let textFont = UIFont.systemFont(ofSize: 60, weight: .bold)
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
       // let blurEffect = UIBlurEffect(style: .dark)
        //let blurEffectView = UIVisualEffectView(effect: blurEffect)

        let image = applyBlurEffect(to: image)
        

        
        image?.draw(in: CGRect(origin: CGPoint.zero, size: image!.size))
        let textFontAttributes: [NSAttributedString.Key: Any] = [
            .font: textFont,
            .foregroundColor: textColor
        ]
        
        let textSize = text.size(withAttributes: textFontAttributes)
        let textRect = CGRect(x: (image!.size.width - textSize.width) / 2,
                              y: (image!.size.height - textSize.height) / 2,
                              width: textSize.width,
                              height: textSize.height)

        text.draw(in: textRect, withAttributes: textFontAttributes)
        let buttonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        

        let imageButton = UIButton()
        
        imageButton.setImage(buttonImage, for: .normal)
        imageButton.layer.cornerRadius = 20
        imageButton.imageView?.contentMode = .scaleAspectFill
        
        imageButton.layer.masksToBounds = true

        return imageButton
    }
    
    
    
    func applyBlurEffect(to image: UIImage) -> UIImage? {
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: image)
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(5.0, forKey: kCIInputRadiusKey)
        if let outputImage = filter?.outputImage,
           let cgImage = context.createCGImage(outputImage, from: inputImage!.extent) {
            return UIImage(cgImage: cgImage)
        }

        return nil
    }
}
