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
    private var i: Int = 0

    
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
        
        
        while (i < buttons.endIndex) {
            // Defines the functionality of the button
            buttons[i]! = UIButton(type: UIButtonType.system)
            buttons[i]!.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            
            // Gives x and y placement coordinates and height and width of button
            buttons[i]!.frame = CGRect(x: (screenWidth / 2) - (buttonWidth / 2), y: edgeGap + (buttonHeightFunction * CGFloat(i)), width: buttonWidth, height: buttonHeight)
            
            // Creates and customizes the button label
            buttons[i]!.setTitle(sampleNames[i]!, for: .normal)
            buttons[i]!.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenHeight / 40)
            buttons[i]!.setTitleColor(UIColor.white, for: .normal)
            
            // Makes button slightly transparent
            buttons[i]!.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
            
            // Gives button rounded look
            buttons[i]!.layer.cornerRadius = (buttons[i]!.frame.height / 2)
            
            buttons[i]?.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            
            scrollView.addSubview(buttons[i]!)
            
            i += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        view.addSubview(scrollView)
        
        setupNavBar()
        setupScrollView()
        setupButtons()
        
        i = 0
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
        sample.navBarTitle = sampleNames[index!]/*
        sample.slideImages = [#imageLiteral(resourceName: "DolomitePPL0"),#imageLiteral(resourceName: DolomiteXPL0),#imageLiteral(resourceName: DolomiteRef),#imageLiteral(resourceName: DolomiteCL),#imageLiteral(resourceName: DolomiteBSE)] // Plane polarized, cross polarized, reflected light, cathode luminescence, backscatter electrons
        sample.planePolarizedRotatePolarImages = [#imageLiteral(resourceName: DolomitePPL90),#imageLiteral(resourceName: DolomitePPL0),#imageLiteral(resourceName: DolomitePPL90)] // 90 degree increments
        sample.crossPolarizedRotatePolarImages = [#imageLiteral(resourceName: DolomiteXPL0),#imageLiteral(resourceName: DolomiteXPL15),#imageLiteral(resourceName: DolomiteXPL30),#imageLiteral(resourceName: DolomiteXPL45),#imageLiteral(resourceName: DolomiteXPL60),#imageLiteral(resourceName: DolomiteXPL75),#imageLiteral(resourceName: DolomiteXPL0),#imageLiteral(resourceName: DolomiteXPL15),#imageLiteral(resourceName: DolomiteXPL30),#imageLiteral(resourceName: DolomiteXPL45),#imageLiteral(resourceName: DolomiteXPL60),#imageLiteral(resourceName: DolomiteXPL75),#imageLiteral(resourceName: DolomiteXPL0),#imageLiteral(resourceName: DolomiteXPL15),#imageLiteral(resourceName: DolomiteXPL30),#imageLiteral(resourceName: DolomiteXPL45),#imageLiteral(resourceName: DolomiteXPL60),#imageLiteral(resourceName: DolomiteXPL75),#imageLiteral(resourceName: DolomiteXPL0),#imageLiteral(resourceName: DolomiteXPL15),#imageLiteral(resourceName: DolomiteXPL30),#imageLiteral(resourceName: DolomiteXPL45),#imageLiteral(resourceName: DolomiteXPL60),#imageLiteral(resourceName: DolomiteXPL75)]
        sample.elementMapImages = [] // Al, Ca, Fe, K, Mg, Si, Ti
        */
        // TODO: Add the mapped images to this sucker
        
        self.navigationController?.pushViewController(sample, animated: false)
    }
}
