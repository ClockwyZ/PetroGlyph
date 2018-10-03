//
//  RockTypeFunctions.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/30/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import Foundation
import UIKit

class rockTypeButtons {
    // MARK: Function to customize specific rock button appearance:
    static func customizeRockTypeButtons(button: UIButton, yCoordinate: CGFloat, buttonName: String) {
        let buttonHeight = screenHeight * 0.15
        let buttonWidth = screenWidth * 0.65
        
        // Gives x and y placement coordinates and height and width of button
        button.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: yCoordinate, width: buttonWidth, height: buttonHeight)
        
        // Delegates to other declared functions
        buttonLabelCustomization(button: button, label: buttonName)
        buttonBackgroundCustomization(button: button)
    }

    // Sets title, color, and size of button labels
    static func buttonLabelCustomization(button: UIButton, label: String) {
        button.setTitle(label, for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenHeight / 40)
        button.setTitleColor(UIColor.white, for: .normal)
    }


    // Customizes the look of the given button by rounding the edges. Gives the button a given color and opacity
    static func buttonBackgroundCustomization(button: UIButton) {
        // Makes button slightly transparent
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
        
        // Gives button rounded look
        button.layer.cornerRadius = (button.frame.height / 2)
    }
}


// MARK: Variables that are used to position buttons on scroll view
public let edgeGap = screenHeight * 0.01
public let buttonHeightFunction = screenHeight * 0.16


// MARK: The following two functions create the scroll view and set its boundaries
// Creates the scrolling screen so that all buttons may be seen
func scrollView(length: CGFloat) -> UIScrollView {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = length
        
        return view
    }()
    return scrollView
}

// Sets the boundaries for the scroll view
func setupScrollView(scrollView: UIScrollView, currentVC: UIViewController) {
    scrollView.topAnchor.constraint(equalTo: currentVC.view.topAnchor, constant: 45 + topPadding!).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: currentVC.view.bottomAnchor, constant: bottomPadding!).isActive = true
    scrollView.leftAnchor.constraint(equalTo: currentVC.view.leftAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: currentVC.view.rightAnchor).isActive = true
}
