//
//  SampleVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 9/14/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import UIKit

class SampleVC: UIViewController, UIScrollViewDelegate {
    public var navBarTitle: String! = "nil"
    public var slideImages: Array<UIImage> = []
    public var planePolarizedRotatePolarImage = UIImage()
    public var crossPolarizedRotatePolarImages: Array<UIImage> = []
    public var elementMapImages: Array<UIImage> = []
    
    private var currentSelector: UIButton!
    private var selectorLabel: UILabel!
    var currentSlide: UIButton!
    
    enum selectors: Int {
        case explore, query, measure, protractor, pointCounter, classification, interferenceColors, mineralList
    }
    
    var explore = UIButton()
    var query = UIButton()
    var measure = UIButton()
    var protractor = UIButton()
    var pointCounter = UIButton()
    var classification = UIButton()
    var interferenceColors = UIButton()
    var mineralList = UIButton()

    var planePolarized = UIButton()
    var crossPolarized = UIButton()
    var reflectedLight = UIButton()
    var bertrandLens = UIButton()
    var rotateRight = UIButton()
    var rotateLeft = UIButton()
    var cathodeLuminescence = UIButton()
    var elementMap = UIButton()
    var backscatterElectronMap = UIButton()
    var energyDispersive = UIButton()

    var Al = UIButton()
    var Ca = UIButton()
    var Fe = UIButton()
    var K = UIButton()
    var Mg = UIButton()
    var Si = UIButton()
    var Ti = UIButton()
    
    var planePolarizedAngle = CShort()
    var crossPolarizedAngle = CShort()
    var angleLabel: UILabel!
    let classificationImage = UIImageView()
    
    
    var selectorButtons: Array<UIButton> = []
    var selectorButtonImagesNormal: Array<UIImage> = [#imageLiteral(resourceName: "Explore"), #imageLiteral(resourceName: "Query"), #imageLiteral(resourceName: "Measure"), #imageLiteral(resourceName: "Protractor"), #imageLiteral(resourceName: "Point Counter"), #imageLiteral(resourceName: "Classification"), #imageLiteral(resourceName: "Interference Colors"), #imageLiteral(resourceName: "Mineral List")]
    var selectorButtonImagesSelected: Array<UIImage> = [#imageLiteral(resourceName: "Explore_On2"), #imageLiteral(resourceName: "Query_On2"), #imageLiteral(resourceName: "Measure_On"), #imageLiteral(resourceName: "Protractor_On"), #imageLiteral(resourceName: "Point Counter_On2"), #imageLiteral(resourceName: "Classification_On"), #imageLiteral(resourceName: "Interference Colors_On"), #imageLiteral(resourceName: "Mineral List_On")]
    
    var slideButtons: Array<UIButton> = []
    var slideButtonImagesNormal: Array<UIImage> = []
    var slideButtonImagesSelected: Array<UIImage> = []
    
    var elementMapButtons: Array<UIButton> = []
    let elementMapButtonLabels: Array<String> = ["Al", "Ca", "Fe", "K", "Mg", "Si", "Ti"]
    
    enum buttonIndexes {
        case Explore, Query, Measure, Protractor, Pointcounter, Classification, Interferencecolors, Minerallist
    }
    
    func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
        let homeButton = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.done, target: self, action: #selector(goHome))
        self.navigationItem.rightBarButtonItem = homeButton
        self.navigationItem.title = navBarTitle
    }
    
    // Creates bottom "Electron" label
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
    
    func setAngleLabelText(angle: String) {
        angleLabel.text = angle
        angleLabel.sizeToFit()
    }
    
    func setupClassificationImage() {
        classificationImage.translatesAutoresizingMaskIntoConstraints = false
        
        classificationImage.frame = CGRect(x: 0, y: -(topPadding! + (self.navigationController?.navigationBar.frame.height)! + screenHeight * 0.1675), width: screenWidth, height: screenHeight)
        
        classificationImage.image = #imageLiteral(resourceName: "Volcanic")
        classificationImage.contentMode = .scaleAspectFit
    }
    
    // TODO: Make this function less ugly. Use a for loop to do all this
    
    func addButtonsAndLabels() {
        let buttonSize: CGFloat = screenHeight * 0.08
        let buttonGap: CGFloat = buttonSize + screenHeight * 0.0075
        let centerTopButton: CGFloat = screenHeight * 0.0075
        let iconBottomGap: CGFloat = bottomPadding! + screenHeight * 0.035 + buttonSize
        let centerElectronButtons: CGFloat = screenWidth * 0.7475 - buttonGap
        
        angleLabel = UILabel()
        angleLabel.frame = CGRect(x: 0, y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + screenHeight * 0.1675, width: 20, height: 20)
        angleLabel.textColor = UIColor.white
        angleLabel.textAlignment = .center
        angleLabel.font = UIFont.boldSystemFont(ofSize: screenHeight / 47)
        angleLabel.backgroundColor = UIColor.black
        setAngleLabelText(angle: "0˙")

        
        for index in 0...(selectorButtons.endIndex - 1) {
            selectorButtons[index] = UIButton(type: UIButtonType.custom)
            selectorButtons[index].setImage(selectorButtonImagesNormal[index], for: UIControlState.normal)
            selectorButtons[index].setImage(selectorButtonImagesSelected[index], for: UIControlState.selected)
            selectorButtons[index].addTarget(self, action: #selector(selectorAction(sender:)), for: UIControlEvents.touchUpInside)
            if index > 3 {
                selectorButtons[index].frame = CGRect(x: (buttonGap * CGFloat(index - 4)), y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
            }
            else {
                selectorButtons[index].frame = CGRect(x: (buttonGap * CGFloat(index)), y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
            }
            view.addSubview(selectorButtons[index])
        }
        /*
        for index in 0...(slideButtons.endIndex - 1) {
            slideButtons[index] = UIButton(type: UIButtonType.custom)
            //slideButtons[index].setImage(slideButtonImagesNormal[index], for: UIControlState.normal)
            //slideButtons[index].setImage(slideButtonImagesSelected[index], for: UIControlState.selected)
            slideButtons[index].addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
            if index > 3 {
                slideButtons[index].frame = CGRect(x: centerTopButton + (buttonGap * CGFloat(index - 4)), y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
            }
            else {
                slideButtons[index].frame = CGRect(x: centerTopButton + (buttonGap * CGFloat(index)), y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
            }
            view.addSubview(slideButtons[index])
        }
        
        for index in 0...(slideButtons.endIndex - 1) {
            slideButtons[index] = UIButton(type: UIButtonType.custom)
            //slideButtons[index].setImage(slideButtonImagesNormal[index], for: UIControlState.normal)
            //slideButtons[index].setImage(slideButtonImagesSelected[index], for: UIControlState.selected)
            slideButtons[index].addTarget(self, action: #selector(selectorAction(sender:)), for: UIControlEvents.touchUpInside)
            if index > 3 {
                slideButtons[index].frame = CGRect(x: screenWidth * 0.01 + (buttonGap * CGFloat(index)), y: iconBottomGap + (buttonGap * CGFloat(index)), width: buttonSize, height: buttonSize)
            }
            else {
                slideButtons[index].frame = CGRect(x: centerTopButton + (buttonGap * CGFloat(index)), y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
            }
            view.addSubview(slideButtons[index])
        }
        */
        
        //let elementMapButtonSize: CGFloat = (screenHeight - (elementMapYValue + (bottomPadding! + screenHeight * 0.2025))) / CGFloat(elementMapButtons.count)
        let elementMapYValue: CGFloat = topPadding! + (self.navigationController?.navigationBar.frame.height)! + screenHeight * 0.1675
        let elementMapButtonSize: CGFloat = screenHeight * 0.05
        let elementMapButtonGap: CGFloat = elementMapButtonSize / 6
        for index in 0...(elementMapButtons.endIndex - 1) {
            elementMapButtons[index] = UIButton(type: UIButtonType.custom)
            elementMapButtons[index].setTitle(elementMapButtonLabels[index], for: .normal)
            elementMapButtons[index].setTitleColor(UIColor.white, for: .normal)
            elementMapButtons[index].setTitleColor(UIColor.darkGray, for: .selected)
            elementMapButtons[index].frame = CGRect(x: CGFloat(index) * (elementMapButtonSize + elementMapButtonGap), y: elementMapYValue, width: elementMapButtonSize, height: elementMapButtonSize)
            elementMapButtons[index].backgroundColor = UIColor.lightGray
            //elementMapButtons[index].setBackgroundImage(UIColor.darkGray, for: .normal)
            //elementMapButtons[index].setBackgroundImage(UIColor.white, for: .selected)
            elementMapButtons[index].addTarget(self, action: #selector(elementMapButtonsAction(sender:)), for: UIControlEvents.touchUpInside)
        }
        
        selectorLabel = UILabel()
        selectorLabel.frame = CGRect(x: buttonGap * 4, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: screenWidth - (buttonGap * 4), height: buttonSize + buttonGap)
        selectorLabel.backgroundColor = UIColor.darkGray
        selectorLabel.textColor = UIColor.white
        selectorLabel.text = "Nothing Selected\nPress any button to get started"
        selectorLabel.font = UIFont.boldSystemFont(ofSize: screenWidth / 30)
        selectorLabel.textAlignment = .center
        selectorLabel.numberOfLines = 0
        view.addSubview(selectorLabel)
        
        
        // MARK: the following buttons change the background image
        // Optical Microscope slides
        planePolarized = UIButton(type: UIButtonType.custom)
        planePolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        planePolarized.setTitle("Plane", for: .normal)
        planePolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        planePolarized.setTitleColor(UIColor.blue, for: .normal)
        //planePolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //planePolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        planePolarized.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(planePolarized)
        
        currentSlide = planePolarized
        
        crossPolarized = UIButton(type: UIButtonType.custom)
        crossPolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        crossPolarized.setTitle("Cross", for: .normal)
        crossPolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        crossPolarized.setTitleColor(UIColor.blue, for: .normal)
        //crossPolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //crossPolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        crossPolarized.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(crossPolarized)
        
        reflectedLight = UIButton(type: UIButtonType.custom)
        reflectedLight.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        reflectedLight.setTitle("Reflected", for: .normal)
        reflectedLight.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        reflectedLight.setTitleColor(UIColor.blue, for: .normal)
        //reflectedLight.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //reflectedLight.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        reflectedLight.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(reflectedLight)
        
        bertrandLens = UIButton(type: UIButtonType.custom)
        bertrandLens.frame = CGRect(x: screenWidth * 0.01 + buttonGap * 2, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        bertrandLens.setTitle("Bertrand", for: .normal)
        bertrandLens.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        bertrandLens.setTitleColor(UIColor.blue, for: .normal)
        //bertrandLens.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //bertrandLens.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(bertrandLens)
        
        let rotatePolars: UILabel = UILabel()
        rotatePolars.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight - (iconBottomGap), width: screenWidth * 0.3, height: screenHeight * 0.02)
        rotatePolars.backgroundColor = UIColor.gray
        rotatePolars.text = "Rotate Polars"
        rotatePolars.textAlignment = .center
        rotatePolars.textColor = UIColor.black
        rotatePolars.layer.masksToBounds = true
        view.addSubview(rotatePolars)
        
        rotateRight = UIButton(type: UIButtonType.system)
        rotateRight.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight * 1.025 - (iconBottomGap), width: screenWidth * 0.15, height: screenHeight * 0.05)
        rotateRight.setTitle("==>", for: .normal)
        rotateRight.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        rotateRight.setTitleColor(UIColor.blue, for: .normal)
        rotateRight.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DolomitePPL0"))
        rotateRight.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(rotateRight)
        
        rotateLeft = UIButton(type: UIButtonType.system)
        rotateLeft.frame = CGRect(x: buttonGap + screenWidth * 0.16, y: screenHeight * 1.025 - (iconBottomGap), width: screenWidth * 0.15, height: screenHeight * 0.05)
        rotateLeft.setTitle("<==", for: .normal)
        rotateLeft.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        rotateLeft.setTitleColor(UIColor.blue, for: .normal)
        rotateLeft.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DolomitePPL0"))
        rotateLeft.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(rotateLeft)
        
        
        // Electron Microscope slides
        cathodeLuminescence = UIButton(type: UIButtonType.custom)
        cathodeLuminescence.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        cathodeLuminescence.setTitle("Cathode", for: .normal)
        cathodeLuminescence.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        cathodeLuminescence.setTitleColor(UIColor.blue, for: .normal)
        //cathodeLuminescence.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //cathodeLuminescence.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        cathodeLuminescence.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(cathodeLuminescence)
        
        elementMap = UIButton(type: UIButtonType.custom)
        elementMap.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        elementMap.setTitle("Element", for: .normal)
        elementMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        elementMap.setTitleColor(UIColor.blue, for: .normal)
        //elementMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //elementMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        elementMap.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(elementMap)
        
        backscatterElectronMap = UIButton(type: UIButtonType.custom)
        backscatterElectronMap.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        backscatterElectronMap.setTitle("Backscatter", for: .normal)
        backscatterElectronMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        backscatterElectronMap.setTitleColor(UIColor.blue, for: .normal)
        //backscatterElectronMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //backscatterElectronMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        backscatterElectronMap.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(backscatterElectronMap)
        
        energyDispersive = UIButton(type: UIButtonType.custom)
        energyDispersive.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        energyDispersive.setTitle("Energy", for: .normal)
        energyDispersive.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        energyDispersive.setTitleColor(UIColor.blue, for: .normal)
        //energyDispersive.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //energyDispersive.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        energyDispersive.addTarget(self, action: #selector(slideAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(energyDispersive)
    }

    
    let scrollableView: UIScrollView = {
        let attributes = UIScrollView()
        attributes.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        return attributes
    }()
    
    let imageViewContainer: UIImageView = {
        let attributes = UIImageView()
        attributes.contentMode = .scaleAspectFit
        return attributes
    }()
    
    func constraints() {
        scrollableView.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        scrollableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding! + (self.navigationController?.navigationBar.frame.height)! + screenHeight * 0.1675).isActive = true
        scrollableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(bottomPadding! + screenHeight * 0.2025)).isActive = true
        
        imageViewContainer.leftAnchor.constraint(equalTo: scrollableView.leftAnchor).isActive = true
        imageViewContainer.rightAnchor.constraint(equalTo: scrollableView.rightAnchor).isActive = true
        imageViewContainer.topAnchor.constraint(equalTo: scrollableView.topAnchor).isActive = true
        imageViewContainer.bottomAnchor.constraint(equalTo: scrollableView.bottomAnchor).isActive = true
 
        imageViewContainer.centerXAnchor.constraint(equalTo: scrollableView.centerXAnchor).isActive = true
        imageViewContainer.centerYAnchor.constraint(equalTo: scrollableView.centerYAnchor).isActive = true
    }
    
    func minMaxZoomValues() {
        scrollableView.minimumZoomScale = 1.0
        scrollableView.maximumZoomScale = 5.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewContainer
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollableView.delegate = self
        
        setupNavBar()
        
        view.backgroundColor = UIColor.black
        
        selectorButtons = [explore, query, measure, protractor, pointCounter, classification, interferenceColors, mineralList]
        
        slideButtons = [planePolarized, crossPolarized, rotateRight, rotateLeft, reflectedLight, bertrandLens, cathodeLuminescence, elementMap, backscatterElectronMap, energyDispersive]
        
        elementMapButtons = [Al, Ca, Fe, K, Mg, Si, Ti]
        
        view.addSubview(electronMicroscopeLabel())
        view.addSubview(opticalMicroscopeLabel())
        view.addSubview(scrollableView)
        imageViewContainer.image = slideImages[0]
        scrollableView.addSubview(imageViewContainer)
        constraints()
        minMaxZoomValues()
        setupClassificationImage()
        
        addButtonsAndLabels()

        
        view.addSubview(angleLabel)
    }
    
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        _ = navigationController?.popViewController(animated: false)
    }
    
    @objc func goHome() {
        transitionBackward(currentVC: self)
        _ = navigationController?.popToRootViewController(animated: false)
    }
    
    @objc func pinchAction(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
    }
    
    
    @objc func setCurrentSelector(sender: UIButton, label: String) {
        if currentSelector == selectorButtons[selectors.classification.rawValue] {
            slideAction(sender: currentSlide)
        }
        
        if currentSelector == sender {
            sender.isSelected = false
            currentSelector = nil
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
        else {
            if currentSelector != nil {
                currentSelector.isSelected = false
            }
            currentSelector = sender
            currentSelector.isSelected = true
            selectorLabel.text = label
        }
    }
    
    @objc func selectorAction(sender: UIButton) {
        switch sender {
        case selectorButtons[selectors.explore.rawValue]:    //explore
            setCurrentSelector(sender: sender, label: "Explore:\nTap the image at any location to identify the mineral")
            
        case selectorButtons[selectors.query.rawValue]:    //query
            setCurrentSelector(sender: sender, label: "Query:\nTap the image to be quizzed on the mineral at any location")
        
        case selectorButtons[selectors.measure.rawValue]:    //measure
            setCurrentSelector(sender: sender, label: "Measure:\nTap any two locations to see the distance between them")
        
        case selectorButtons[selectors.protractor.rawValue]:    //protractor
            setCurrentSelector(sender: sender, label: "Protractor:\nTap any two locations to see the angle between them")
            
        case selectorButtons[selectors.pointCounter.rawValue]:    //pointCounter
            setCurrentSelector(sender: sender, label: "Point Counter\n")
            
        case selectorButtons[selectors.classification.rawValue]:    //classification
            setCurrentSelector(sender: sender, label: "Classification")
            
            if (currentSelector == sender) {
                imageViewContainer.image = #imageLiteral(resourceName: "Volcanic")
                angleLabel.removeFromSuperview()
                scrollableView.zoomScale = 1
                currentSlide.isSelected = false
                if currentSlide == elementMap {
                    for index in 0...(elementMapButtons.endIndex - 1) {
                        elementMapButtons[index].removeFromSuperview()
                    }
                }
            }
            
        case selectorButtons[selectors.interferenceColors.rawValue]:    //interferenceColors
            setCurrentSelector(sender: sender, label: "Interference Colors")
        
        case selectorButtons[selectors.mineralList.rawValue]:    //mineralList
            setCurrentSelector(sender: sender, label: "Mineral List")
            
        default:
            break
        }
    }
    
    
    @objc func setCurrentSlide(sender: UIButton, image: UIImage) {
        if currentSlide == elementMap && sender != elementMap {
            for index in 0...elementMapButtons.endIndex - 1 {
                elementMapButtons[index].removeFromSuperview()
            }
        }
        if currentSlide != sender || currentSelector == selectorButtons[selectors.classification.rawValue] {
            currentSlide = sender
            imageViewContainer.image = image
            scrollableView.zoomScale = 1
        }
        if currentSlide != planePolarized && currentSlide != crossPolarized {
            angleLabel.removeFromSuperview()
        }
        
        if (currentSelector == selectorButtons[selectors.classification.rawValue]) {
            currentSelector.isSelected = false
            currentSelector = nil
        }
    }
    
    @objc func slideAction(sender: UIButton) {
        switch sender {
        case planePolarized:
            setCurrentSlide(sender: planePolarized, image: planePolarizedImage())
            if currentSlide == planePolarized {
                view.addSubview(angleLabel)
            }
            
        case crossPolarized:
            setCurrentSlide(sender: crossPolarized, image: crossPolarizedImage())
            if currentSlide == crossPolarized {
                view.addSubview(angleLabel)
            }
            
        case rotateRight:
            if currentSelector != selectorButtons[selectors.classification.rawValue] {
                if currentSlide == planePolarized {
                    if planePolarizedAngle == CShort(270) {
                        planePolarizedAngle = 0
                    }
                    else {
                        planePolarizedAngle += 90
                    }
                    imageViewContainer.image = planePolarizedImage()
                }
                else if currentSlide == crossPolarized {
                    if crossPolarizedAngle == CShort(345) {
                        crossPolarizedAngle = 0
                    }
                    else {
                        crossPolarizedAngle += 15
                    }
                    imageViewContainer.image = crossPolarizedImage()
                }
            }
            
        case rotateLeft:
            if currentSelector != selectorButtons[selectors.classification.rawValue] {
                if currentSlide == planePolarized {
                    if planePolarizedAngle == CShort(0) {
                        planePolarizedAngle = 270
                    }
                    else {
                        planePolarizedAngle -= 90
                    }
                    imageViewContainer.image = planePolarizedImage()
                }
                else if currentSlide == crossPolarized {
                    if crossPolarizedAngle == CShort(0) {
                        crossPolarizedAngle = 345
                    }
                    else {
                        crossPolarizedAngle -= 15
                    }
                    imageViewContainer.image = crossPolarizedImage()
                }
            }
            
        case reflectedLight:
            setCurrentSlide(sender: reflectedLight, image: slideImages[2])
            
        case bertrandLens:
            setCurrentSlide(sender: bertrandLens, image: #imageLiteral(resourceName: "Ande28"))
            
        case cathodeLuminescence:
            setCurrentSlide(sender: cathodeLuminescence, image: slideImages[3])
            
        case elementMap:
            setCurrentSlide(sender: elementMap, image: elementMapImages[0])
            if currentSlide == elementMap {
                for index in 0...(elementMapButtons.endIndex - 1) {
                    view.addSubview(elementMapButtons[index])
                }
            }
        
        case backscatterElectronMap:
            setCurrentSlide(sender: backscatterElectronMap, image: slideImages[4])
            
        case energyDispersive:
            break
            
        default:
            setCurrentSlide(sender: planePolarized, image: planePolarizedImage())
            if currentSlide == planePolarized {
                view.addSubview(angleLabel)
            }
        }
    }
    
    @objc func elementMapButtonsAction(sender: UIButton) {
        switch sender {
        case elementMapButtons[0]:
            imageViewContainer.image = elementMapImages[0]
            
        case elementMapButtons[1]:
            imageViewContainer.image = elementMapImages[1]
            
        case elementMapButtons[2]:
            imageViewContainer.image = elementMapImages[2]
            
        case elementMapButtons[3]:
            imageViewContainer.image = elementMapImages[3]

        case elementMapButtons[4]:
            imageViewContainer.image = elementMapImages[4]

        case elementMapButtons[5]:
            imageViewContainer.image = elementMapImages[5]

        case elementMapButtons[6]:
            imageViewContainer.image = elementMapImages[6]

        default:
            break
        }
    }
    
    func planePolarizedImage() -> UIImage {
        switch planePolarizedAngle {
            
        case CShort(90):
            setAngleLabelText(angle: "90˙")
            return planePolarizedRotatePolarImage
            
        case CShort(180):
            setAngleLabelText(angle: "180˙")
            return slideImages[0]
            
        case CShort(270):
            setAngleLabelText(angle: "270˙")
            return planePolarizedRotatePolarImage
            
        default:
            setAngleLabelText(angle: "0˙")
            return slideImages[0]
        }
    }
    
    func crossPolarizedImage() -> UIImage {
        switch crossPolarizedAngle {
            
        case CShort(15):
            setAngleLabelText(angle: "15˙")
            return crossPolarizedRotatePolarImages[0]
            
        case CShort(30):
            setAngleLabelText(angle: "30˙")
            return crossPolarizedRotatePolarImages[1]
            
        case CShort(45):
            setAngleLabelText(angle: "45˙")
            return crossPolarizedRotatePolarImages[2]
            
        case CShort(60):
            setAngleLabelText(angle: "60˙")
            return crossPolarizedRotatePolarImages[3]
            
        case CShort(75):
            setAngleLabelText(angle: "75˙")
            return crossPolarizedRotatePolarImages[4]
            
        case CShort(90):
            setAngleLabelText(angle: "90˙")
            return slideImages[1]
            
        case CShort(105):
            setAngleLabelText(angle: "105˙")
            return crossPolarizedRotatePolarImages[0]
            
        case CShort(120):
            setAngleLabelText(angle: "120˙")
            return crossPolarizedRotatePolarImages[1]
            
        case CShort(135):
            setAngleLabelText(angle: "135˙")
            return crossPolarizedRotatePolarImages[2]
            
        case CShort(150):
            setAngleLabelText(angle: "150˙")
            return crossPolarizedRotatePolarImages[3]
            
        case CShort(165):
            setAngleLabelText(angle: "165˙")
            return crossPolarizedRotatePolarImages[4]
            
        case CShort(180):
            setAngleLabelText(angle: "180˙")
            return slideImages[1]
            
        case CShort(195):
            setAngleLabelText(angle: "195˙")
            return crossPolarizedRotatePolarImages[0]
            
        case CShort(210):
            setAngleLabelText(angle: "210˙")
            return crossPolarizedRotatePolarImages[1]
            
        case CShort(225):
            setAngleLabelText(angle: "225˙")
            return crossPolarizedRotatePolarImages[2]
            
        case CShort(240):
            setAngleLabelText(angle: "240˙")
            return crossPolarizedRotatePolarImages[3]
            
        case CShort(255):
            setAngleLabelText(angle: "255˙")
            return crossPolarizedRotatePolarImages[4]
            
        case CShort(270):
            setAngleLabelText(angle: "270˙")
            return slideImages[1]
            
        case CShort(285):
            setAngleLabelText(angle: "285˙")
            return crossPolarizedRotatePolarImages[0]
            
        case CShort(300):
            setAngleLabelText(angle: "300˙")
            return crossPolarizedRotatePolarImages[1]
            
        case CShort(315):
            setAngleLabelText(angle: "315˙")
            return crossPolarizedRotatePolarImages[2]
            
        case CShort(330):
            setAngleLabelText(angle: "330˙")
            return crossPolarizedRotatePolarImages[3]
            
        case CShort(345):
            setAngleLabelText(angle: "345˙")
            return crossPolarizedRotatePolarImages[4]
            
        default:
            setAngleLabelText(angle: "0˙")
            return slideImages[1]
        }
    }
}
