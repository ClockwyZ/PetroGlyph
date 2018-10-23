//
//  RockTypeVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 8/22/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import UIKit
import AssetsLibrary

class RockTypeVC: UIViewController {
    public var navBarTitle: String! = "nil"
    public var buttons: Array<UIButton?> = []
    public var sampleNames: Array<String?> = []
    public var rockVCs: Array<UIViewController> = []
    let scrollView = UIScrollView()

    
    func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
        let homeButton = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.done, target: self, action: #selector(goHome))
        self.navigationItem.rightBarButtonItem = homeButton
        self.navigationItem.title = navBarTitle
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = screenHeight * 0.16 * CGFloat(buttons.endIndex) + screenHeight * 0.01
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)!).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomPadding!).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupButtons() {
        let edgeGap = screenHeight * 0.01
        let buttonHeightFunction = screenHeight * 0.16
        let buttonHeight = screenHeight * 0.15
        let buttonWidth = screenWidth * 0.65
        
        for index in 0...(buttons.endIndex - 1) {
            buttons[index]! = UIButton(type: UIButtonType.system)
            buttons[index]!.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            
            // Gives x and y placement coordinates and height and width of button
            buttons[index]!.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: edgeGap + (buttonHeightFunction * CGFloat(index)), width: buttonWidth, height: buttonHeight)
            
            // Creates and customizes the button label
            buttons[index]!.setTitle(sampleNames[index]!, for: .normal)
            buttons[index]!.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenHeight / 40)
            buttons[index]!.setTitleColor(UIColor.white, for: .normal)
            
            // Makes button slightly transparent
            buttons[index]!.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
            
            // Gives button rounded look
            buttons[index]!.layer.cornerRadius = (buttons[index]!.frame.height / 2)
            
            buttons[index]?.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            
            scrollView.addSubview(buttons[index]!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        view.addSubview(scrollView)
        
        setupNavBar()
        setupScrollView()
        setupButtons()
    }
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func goHome() {
        transitionBackward(currentVC: self)
        _ = navigationController?.popToRootViewController(animated: false)
    }
    
    @objc func buttonAction(sender: UIButton) {
        transitionForward(currentVC: self)
        let index = buttons.firstIndex(of: sender)
        
        let sample = SampleVC()
        sample.navBarTitle = sampleNames[index!]

        sample.slideImages = [UIImage(named: "DolomitePPL0"), UIImage(named: "DolomiteXPL0"), UIImage(named: "DolomiteRef"), UIImage(named: "DolomiteCL"), UIImage(named: "DolomiteBSE")] as! Array<UIImage> // Plane polarized, cross polarized, reflected light, cathode luminescence, backscatter electrons
        
        sample.planePolarizedRotatePolarImage = UIImage(named: "DolomitePPL90")!
        
        sample.crossPolarizedRotatePolarImages = [UIImage(named: "DolomiteXPL15"), UIImage(named: "DolomiteXPL30"), UIImage(named: "DolomiteXPL45"), UIImage(named: "DolomiteXPL60"), UIImage(named: "DolomiteXPL75")] as! Array<UIImage>
        
        sample.elementMapImages = [UIImage(named: "DolomiteAl"), UIImage(named: "DolomiteCa"), UIImage(named: "DolomiteFe"), UIImage(named: "DolomiteK"), UIImage(named: "DolomiteMg"), UIImage(named: "DolomiteSi"), UIImage(named: "DolomiteTi")] as! Array<UIImage> // Al, Ca, Fe, K, Mg, Si, Ti
        
        // TODO: Add the mapped images to this sucker
        // TODO: Create switch statements for each button with all the images

        
        self.navigationController?.pushViewController(sample, animated: false)
    }
}
