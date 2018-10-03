//
//  HomeVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/19/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    // Declares class variables so that they may be easily accessed in the newSampleButtonPressed and quizButtonPressed objc functions
    var petroGlyphLabel: UILabel!
    var newSampleButton: UIButton!
    var quizButton: UIButton!
    
    // MARK: Functions:
    
    // Sets the background for the current view
    func setBackground() -> UIImageView! {
        let backgroundImage: UIImage = #imageLiteral(resourceName: "background1920x1080")
        var imageView: UIImageView!
        
        // MARK: Sets the image to be the size of the entire screen
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        // MARK: Sets the imageView above to be the backgroundImage specified and scales it to fit the screen, then adds it to the view
        imageView.contentMode = .scaleAspectFill
        imageView.image = backgroundImage
        
        return imageView
    }
    
    
    // Sets the title on the main screen.
    func petroGlyphTitle() -> UILabel {
        // Determines the height and width of the background
        let labelHeight = screenHeight * 0.165
        let labelWidth = screenWidth
        
        // Initializes the label
        petroGlyphLabel = UILabel()
        
        // Customizes the text and background of the label
        petroGlyphLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.65)
        petroGlyphLabel.frame = CGRect(x: 0, y: (screenHeight - labelHeight) - bottomPadding!, width: labelWidth, height: labelHeight)
        petroGlyphLabel.text = "PetroGlyph"
        petroGlyphLabel.textColor = UIColor.white
        petroGlyphLabel.textAlignment = .center
        petroGlyphLabel.font = UIFont.boldSystemFont(ofSize: screenWidth * 0.2)
        
        return petroGlyphLabel
    }
    
    
    // Creates and returns the "New Sample" button.
    func newSample() -> UIButton {
        newSampleButton = UIButton(type: UIButtonType.system)
        
        // Determines the height and width of the button
        let buttonHeight = screenHeight * 0.125
        let buttonWidth = screenWidth * 0.5
        
        // Gives x and y placement coordinates and height and width of the button
        newSampleButton.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: screenHeight * 0.30, width: buttonWidth, height: buttonHeight)
        
        // Uses functions to customize the button further
        buttonLabelCustomization(button: newSampleButton, label: "New Sample", labelColor: UIColor.blue)
        buttonBackgroundCustomization(button: newSampleButton, backgroundColor: UIColor.gray, alphaValue: 0.75)
        
        newSampleButton.addTarget(self, action: #selector(newSampleButtonPressed), for: UIControlEvents.touchUpInside)
        
        return newSampleButton
    }
    
    func quiz() -> UIButton {
        quizButton = UIButton(type: UIButtonType.system)
        
        // Determines the height and width of the button
        let buttonHeight = screenHeight * 0.125
        let buttonWidth = screenWidth * 0.5
        
        // Gives x and y placement coordinates and height and width of the button
        quizButton.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: screenHeight * 0.45, width: buttonWidth, height: buttonHeight)
        
        // Uses functions to customize the button further
        buttonLabelCustomization(button: quizButton, label: "Quiz", labelColor: UIColor.blue)
        buttonBackgroundCustomization(button: quizButton, backgroundColor: UIColor.gray, alphaValue: 0.75)
        
        quizButton.addTarget(self, action: #selector(quizButtonPressed), for: UIControlEvents.touchUpInside)
        
        return quizButton
    }
    
    // A template for the basic design of the three rock type buttons
    func rockTypeButtonCustomization(button: UIButton, yCoordinate: CGFloat, buttonName: String) {
        // Variables that give the size for the buttons
        let buttonHeight = screenHeight * 0.125
        let buttonWidth = screenWidth * 0.5
        
        // Gives x and y placement coordinates and height and width of button
        button.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: yCoordinate, width: buttonWidth, height: buttonHeight)
        
        // Delegates to other declared functions
        buttonLabelCustomization(button: button, label: buttonName, labelColor: UIColor.blue)
        buttonBackgroundCustomization(button: button, backgroundColor: UIColor.gray, alphaValue: 0.75)
    }
    
    
    // Gives the given button a label and a color determined by what arguments are passed into the function.
    func buttonLabelCustomization(button: UIButton, label: String, labelColor: UIColor) {
        button.setTitle(label, for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenHeight / 30)
        button.setTitleColor(labelColor, for: .normal)
    }
    
    
    // Customizes the look of the given button by rounding the edges. Gives the button a given color and opacity
    func buttonBackgroundCustomization(button: UIButton, backgroundColor: UIColor, alphaValue: CGFloat) {
        // Makes button slightly transparent
        button.backgroundColor = backgroundColor.withAlphaComponent(alphaValue)
        
        // Gives button rounded look
        button.layer.cornerRadius = (button.frame.height / 2)
    }
    
    
    // Serves as a main() function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        // Sets the background for the current view
        view.addSubview(setBackground())
        
        
        // Sets the PetroGlyph title on the bottom of the screen
        view.addSubview(petroGlyphTitle())
        
        // Initializes and places the initial buttons, "New Sample" and "Quiz"
        view.addSubview(newSample())
        view.addSubview(quiz())
    }

    
    // MARK: objc functions that determine actions this VC's buttons
    
    @objc func newSampleButtonPressed() {
        transitionForward(currentVC: self)
        let newSample = NewSampleVC()
        newSample.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(newSample, animated: false)
    }
    
    @objc func quizButtonPressed() {
        
    }
}
