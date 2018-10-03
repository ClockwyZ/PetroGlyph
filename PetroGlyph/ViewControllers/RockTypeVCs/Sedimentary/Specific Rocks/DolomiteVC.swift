//
//  DolomiteVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 8/2/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import Foundation
import UIKit

class DolomiteVC: UIViewController {

    var currentSelector: UIButton!
    var currentSlide: UIButton!
    var currentImage: UIImageView!
    var selectorLabel: UILabel!
    
    // Sets the background and the initial picture
    func setImage(currentVC: UIViewController, image: UIImage) -> UIScrollView {
        let topConstant = topPadding! + 45 + screenHeight * 0.175
        let bottomConstant = -(bottomPadding! + screenHeight * 0.21)
        
        var imageView: UIImageView!
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)

        scrollView.delegate = self as? UIScrollViewDelegate
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.isUserInteractionEnabled = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant).isActive = true


        // Effectively just makes the picture big enough to fill the whole screen for when we scale aspect fit
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        imageView.image = image
        
        scrollView.addSubview(imageView)
        
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        imageView.contentMode = .scaleAspectFit
        
        // Sets the imageView above to be the backgroundImage specified and scales it to fit the screen, then adds it to the view
        imageView.translatesAutoresizingMaskIntoConstraints = true
        let screenPinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchAction))
        scrollView.addGestureRecognizer(screenPinch)
        //imageView.addGestureRecognizer(screenPinch)
        
        scrollView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        
        //scrollView.addSubview(imageView)
        
        return scrollView
    }
    
    func addButtonsAndLabels() {
        let iconTopGap = topPadding! + 45
        let buttonSize: CGFloat = screenHeight * 0.08
        let buttonGap: CGFloat = (buttonSize + screenWidth * 0.015)
        let centerTopButton: CGFloat = screenWidth * 0.015
        let iconBottomGap: CGFloat = bottomPadding! + screenHeight * 0.035 + buttonSize
        let centerElectronButtons: CGFloat = screenWidth * 0.7475 - buttonGap
        
        
        selectorLabel = UILabel()
        selectorLabel.frame = CGRect(x: buttonGap * 4 + screenWidth * 0.015, y: iconTopGap, width: screenWidth - (buttonGap * 4 + screenWidth * 0.015), height: buttonSize + buttonGap)
        selectorLabel.backgroundColor = UIColor.darkGray
        selectorLabel.textColor = UIColor.white
        selectorLabel.text = "Nothing Selected\nPress any button to get started"
        selectorLabel.font = UIFont.boldSystemFont(ofSize: screenWidth / 30)
        selectorLabel.textAlignment = .center
        selectorLabel.numberOfLines = 0
        view.addSubview(selectorLabel)
        
        
        // MARK: the following buttons allow for different types of selection of the given image.
        var explore: UIButton!
        explore = UIButton(type: UIButtonType.custom)
        explore.frame = CGRect(x: centerTopButton, y: iconTopGap, width: buttonSize, height: buttonSize)
        explore.setImage(#imageLiteral(resourceName: "Explore"), for: UIControlState.normal)
        explore.setImage(#imageLiteral(resourceName: "Explore_On2"), for: UIControlState.selected)
        explore.addTarget(self, action: #selector(exploreAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(explore)
        
        var query: UIButton!
        query = UIButton(type: UIButtonType.custom)
        query.frame = CGRect(x: centerTopButton + buttonGap, y: iconTopGap, width: buttonSize, height: buttonSize)
        query.setImage(#imageLiteral(resourceName: "Query"), for: UIControlState.normal)
        query.setImage(#imageLiteral(resourceName: "Query_On2"), for: UIControlState.selected)
        query.addTarget(self, action: #selector(queryAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(query)
        
        var measure: UIButton!
        measure = UIButton(type: UIButtonType.custom)
        measure.frame = CGRect(x: centerTopButton + buttonGap * 2, y: iconTopGap, width: buttonSize, height: buttonSize)
        measure.setImage(#imageLiteral(resourceName: "Measure"), for: UIControlState.normal)
        measure.setImage(#imageLiteral(resourceName: "Measure_On"), for: UIControlState.selected)
        measure.addTarget(self, action: #selector(measureAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(measure)
        
        var protractor: UIButton!
        protractor = UIButton(type: UIButtonType.custom)
        protractor.frame = CGRect(x: centerTopButton + buttonGap * 3, y: iconTopGap, width: buttonSize, height: buttonSize)
        protractor.setImage(#imageLiteral(resourceName: "Protractor"), for: UIControlState.normal)
        protractor.setImage(#imageLiteral(resourceName: "Protractor_On"), for: UIControlState.selected)
        protractor.addTarget(self, action: #selector(protractorAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(protractor)

        var pointCounter: UIButton!
        pointCounter = UIButton(type: UIButtonType.custom)
        pointCounter.frame = CGRect(x: centerTopButton, y: iconTopGap + buttonGap, width: buttonSize, height: buttonSize)
        pointCounter.setImage(#imageLiteral(resourceName: "Point Counter"), for: UIControlState.normal)
        pointCounter.setImage(#imageLiteral(resourceName: "Point Counter_On2"), for: UIControlState.selected)
        pointCounter.addTarget(self, action: #selector(pointCounterAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(pointCounter)
        
        var classification: UIButton!
        classification = UIButton(type: UIButtonType.custom)
        classification.frame = CGRect(x: centerTopButton + buttonGap, y: iconTopGap + buttonGap, width: buttonSize, height: buttonSize)
        classification.setImage(#imageLiteral(resourceName: "Classification"), for: UIControlState.normal)
        classification.setImage(#imageLiteral(resourceName: "Classification_On"), for: UIControlState.selected)
        classification.addTarget(self, action: #selector(classificationAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(classification)
        
        var interferenceColors: UIButton!
        interferenceColors = UIButton(type: UIButtonType.custom)
        interferenceColors.frame = CGRect(x: centerTopButton + buttonGap * 2, y: iconTopGap + buttonGap, width: buttonSize, height: buttonSize)
        interferenceColors.setImage(#imageLiteral(resourceName: "Interference Colors"), for: UIControlState.normal)
        interferenceColors.setImage(#imageLiteral(resourceName: "Interference Colors_On"), for: UIControlState.selected)
        interferenceColors.addTarget(self, action: #selector(interferenceColorsAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(interferenceColors)
        
        var mineralList: UIButton!
        mineralList = UIButton(type: UIButtonType.custom)
        mineralList.frame = CGRect(x: centerTopButton + buttonGap * 3, y: iconTopGap + buttonGap, width: buttonSize, height: buttonSize)
        mineralList.setImage(#imageLiteral(resourceName: "Mineral List"), for: UIControlState.normal)
        mineralList.setImage(#imageLiteral(resourceName: "Mineral List_On"), for: UIControlState.selected)
        mineralList.addTarget(self, action: #selector(mineralListAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(mineralList)
        

        // MARK: the following buttons change the background image
        // Optical Microscope slides
        var planePolarized: UIButton!
        planePolarized = UIButton(type: UIButtonType.custom)
        planePolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        planePolarized.setTitle("Plane Polarized", for: .normal)
        planePolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        planePolarized.setTitleColor(UIColor.blue, for: .normal)
        planePolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        planePolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(planePolarized)
        
        var crossPolarized: UIButton!
        crossPolarized = UIButton(type: UIButtonType.custom)
        crossPolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        crossPolarized.setTitle("Cross Polarized", for: .normal)
        crossPolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        crossPolarized.setTitleColor(UIColor.blue, for: .normal)
        crossPolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        crossPolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(crossPolarized)
        
        var reflectedLight: UIButton!
        reflectedLight = UIButton(type: UIButtonType.custom)
        reflectedLight.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        reflectedLight.setTitle("Reflected Light", for: .normal)
        reflectedLight.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        reflectedLight.setTitleColor(UIColor.blue, for: .normal)
        reflectedLight.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        reflectedLight.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(reflectedLight)

        var bertrandLens: UIButton!
        bertrandLens = UIButton(type: UIButtonType.custom)
        bertrandLens.frame = CGRect(x: screenWidth * 0.01 + buttonGap * 2, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        bertrandLens.setTitle("Bertrand Lens", for: .normal)
        bertrandLens.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        bertrandLens.setTitleColor(UIColor.blue, for: .normal)
        bertrandLens.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        bertrandLens.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(bertrandLens)
        
        let rotatePolars: UILabel = UILabel()
        rotatePolars.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight - (iconBottomGap), width: screenWidth * 0.3, height: screenHeight * 0.02)
        rotatePolars.backgroundColor = UIColor.gray
        rotatePolars.text = "Rotate Polars"
        rotatePolars.textAlignment = .center
        rotatePolars.textColor = UIColor.black
        rotatePolars.layer.masksToBounds = true
        view.addSubview(rotatePolars)
        
        var rotateRight: UIButton!
        rotateRight = UIButton(type: UIButtonType.system)
        rotateRight.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight * 1.025 - (iconBottomGap), width: screenWidth * 0.15, height: screenHeight * 0.05)
        rotateRight.setTitle("==>", for: .normal)
        rotateRight.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        rotateRight.setTitleColor(UIColor.blue, for: .normal)
        rotateRight.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DolomitePPL0"))
        view.addSubview(rotateRight)
        
        var rotateLeft: UIButton!
        rotateLeft = UIButton(type: UIButtonType.system)
        rotateLeft.frame = CGRect(x: buttonGap + screenWidth * 0.16, y: screenHeight * 1.025 - (iconBottomGap), width: screenWidth * 0.15, height: screenHeight * 0.05)
        rotateLeft.setTitle("<==", for: .normal)
        rotateLeft.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        rotateLeft.setTitleColor(UIColor.blue, for: .normal)
        rotateLeft.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DolomitePPL0"))
        view.addSubview(rotateLeft)
        
        
        // Electron Microscope slides
        var cathodeLuminescence: UIButton!
        cathodeLuminescence = UIButton(type: UIButtonType.custom)
        cathodeLuminescence.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        cathodeLuminescence.setTitle("Cathode Luminescence", for: .normal)
        cathodeLuminescence.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        cathodeLuminescence.setTitleColor(UIColor.blue, for: .normal)
        cathodeLuminescence.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        cathodeLuminescence.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(cathodeLuminescence)
        
        var elementMap: UIButton!
        elementMap = UIButton(type: UIButtonType.custom)
        elementMap.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        elementMap.setTitle("Element Map", for: .normal)
        elementMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        elementMap.setTitleColor(UIColor.blue, for: .normal)
        elementMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        elementMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(elementMap)
        
        var backscatterElectronMap: UIButton!
        backscatterElectronMap = UIButton(type: UIButtonType.custom)
        backscatterElectronMap.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        backscatterElectronMap.setTitle("Backscatter Electron Map", for: .normal)
        backscatterElectronMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        backscatterElectronMap.setTitleColor(UIColor.blue, for: .normal)
        backscatterElectronMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        backscatterElectronMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(backscatterElectronMap)
        
        var energyDispersive: UIButton!
        energyDispersive = UIButton(type: UIButtonType.custom)
        energyDispersive.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        energyDispersive.setTitle("Energy Dispersive", for: .normal)
        energyDispersive.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        energyDispersive.setTitleColor(UIColor.blue, for: .normal)
        energyDispersive.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        energyDispersive.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(energyDispersive)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        customNavBar.title = "Dolomite"
        customNavBar.currentVC = self
        
        view.addSubview(customNavBar.createNavBar(addHomeButton: true))
        
        view.addSubview(opticalMicroscopeLabel())
        view.addSubview(electronMicroscopeLabel())

        addButtonsAndLabels()
        
        view.addSubview(setImage(currentVC: self, image: #imageLiteral(resourceName: "DolomitePPL0")))
    }
    
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        //switchVC(selfPointer: self, replacementVC: SedimentaryVC(), deleteVC: DolomiteVC())
    }
    
    @objc func goHome() {
        transitionBackward(currentVC: self)
        //switchVC(selfPointer: self, replacementVC: HomeVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func pinchAction(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
    }
    
    
    // TODO: Set the actions by the currentSelctor and currentSlide buttons.
    
    @objc func setCurrentSelector(sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            if sender == currentSelector {
                currentSelector = nil
            }
        }
        else {
            sender.isSelected = true
            if currentSelector != nil {
                currentSelector.isSelected = false
            }
            currentSelector = sender
        }
    }
    
    @objc func exploreAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Selector:\nTap the image at any location to identify the mineral"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func queryAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Query:\nTap the image to be quizzed on the mineral at any location"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func measureAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Measure:\nTap any two locations to see the distance between them"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func protractorAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Protractor:\nTap any two locations to see the angle between them"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func pointCounterAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Point Counter:\n"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func classificationAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Classification"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func interferenceColorsAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Interference Colors"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func mineralListAction(sender: UIButton) {
        setCurrentSelector(sender: sender)
        
        if currentSelector == sender {
            selectorLabel.text = "Mineral List"
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    
    @objc func setCurrentSlide(sender: UIButton) {
        if currentSlide != sender && currentSlide != nil {
            currentSlide.removeFromSuperview()
            currentSlide = sender
        }
    }
    
    @objc func planePolarizedAction(sender: UIButton) {
        if currentSlide != sender {
            setCurrentSlide(sender: sender)
            view.addSubview(setImage(currentVC: self, image: #imageLiteral(resourceName: "KySch20")))
        }
    }
}
