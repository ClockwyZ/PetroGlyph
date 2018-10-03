//
//  SpecificRockFunctions.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 8/4/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import Foundation
import UIKit

// MARK: Following two functions create the top and bottom labels
// Creates top "Selectors" label
func electronMicroscopeLabel() -> UILabel {
    let electronMicroscopeLabel = UILabel()
    electronMicroscopeLabel.frame = CGRect(x: screenWidth * 0.505, y: screenHeight * 0.965 - bottomPadding!, width: screenWidth * 0.485, height: screenHeight * 0.035)
    electronMicroscopeLabel.backgroundColor = UIColor.gray
    electronMicroscopeLabel.text = "Electron"
    electronMicroscopeLabel.textAlignment = .center
    electronMicroscopeLabel.font = UIFont.boldSystemFont(ofSize: screenWidth * 0.04)
    return electronMicroscopeLabel
}

// Creates bottom "Slides" label
func opticalMicroscopeLabel() -> UILabel {
    let opticalMicroscopeLabel = UILabel()
    opticalMicroscopeLabel.frame = CGRect(x: screenWidth * 0.01, y: screenHeight * 0.965 - bottomPadding!, width: screenWidth * 0.485, height: screenHeight * 0.035)
    opticalMicroscopeLabel.backgroundColor = UIColor.gray
    opticalMicroscopeLabel.text = "Optical"
    opticalMicroscopeLabel.textAlignment = .center
    opticalMicroscopeLabel.font = UIFont.boldSystemFont(ofSize: screenWidth * 0.04)
    return opticalMicroscopeLabel
}

// Sets the background and the initial picture
func initialBackground(currentVC: UIViewController, image: UIImage) -> UIImageView {
    currentVC.view.backgroundColor = UIColor.black

    var imageView: UIImageView!
    
    // Effectively just makes the picture big enough to fill the whole screen for when we scale aspect fit
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))

    // Sets the imageView above to be the backgroundImage specified and scales it to fit the screen, then adds it to the view
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    
    return imageView
}


// TODO: Figure out if this function will even work
func changeImage(image: UIImage, previousImage: UIImageView) -> UIImageView {
    var imageView: UIImageView!
    
    // MARK: Sets the image to be the size of the entire screen
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    
    // MARK: Sets the imageView above to be the backgroundImage specified and scales it to fit the screen, then adds it to the view
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    
    previousImage.removeFromSuperview()
    
    return imageView
}
