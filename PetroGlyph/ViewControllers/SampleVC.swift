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
    public var planePolarizedRotatePolarImages: Array<UIImage> = []
    public var crossPolarizedRotatePolarImages: Array<UIImage> = []
    public var elementMapImages: Array<UIImage> = []
    
    private var currentSelector: UIButton!
    private var selectorLabel: UILabel!
    var currentSlide: UIButton!
    
    var explore: UIButton!
    var query: UIButton!
    var measure: UIButton!
    var protractor: UIButton!
    var pointCounter: UIButton!
    var classification: UIButton!
    var interferenceColors: UIButton!
    var mineralList: UIButton!

    var planePolarized: UIButton!
    var crossPolarized: UIButton!
    var reflectedLight: UIButton!
    var bertrandLens: UIButton!
    var rotateRight: UIButton!
    var rotateLeft: UIButton!
    
    var cathodeLuminescence: UIButton!
    var elementMap: UIButton!
    var backscatterElectronMap: UIButton!
    var energyDispersive: UIButton!

    var planePolarizedAngle = CShort()
    var crossPolarizedAngle = CShort()

    
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
    
    func addButtonsAndLabels() {
        let buttonSize: CGFloat = screenHeight * 0.08
        let buttonGap: CGFloat = buttonSize + screenHeight * 0.0075
        let centerTopButton: CGFloat = screenHeight * 0.0075
        let iconBottomGap: CGFloat = bottomPadding! + screenHeight * 0.035 + buttonSize
        let centerElectronButtons: CGFloat = screenWidth * 0.7475 - buttonGap
        
        
        selectorLabel = UILabel()
        selectorLabel.frame = CGRect(x: buttonGap * 4 + screenWidth * 0.015, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: screenWidth - (buttonGap * 4 + screenWidth * 0.015), height: buttonSize + buttonGap)
        selectorLabel.backgroundColor = UIColor.darkGray
        selectorLabel.textColor = UIColor.white
        selectorLabel.text = "Nothing Selected\nPress any button to  get started"
        selectorLabel.font = UIFont.boldSystemFont(ofSize: screenWidth / 30)
        selectorLabel.textAlignment = .center
        selectorLabel.numberOfLines = 0
        view.addSubview(selectorLabel)
        
        
        // MARK: the following buttons allow for different types of selection of the given image.
        explore = UIButton(type: UIButtonType.custom)
        explore.frame = CGRect(x: centerTopButton, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
        explore.setImage(#imageLiteral(resourceName: "Explore"), for: UIControlState.normal)
        explore.setImage(#imageLiteral(resourceName: "Explore_On2"), for: UIControlState.selected)
        explore.addTarget(self, action: #selector(exploreAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(explore)
        
        query = UIButton(type: UIButtonType.custom)
        query.frame = CGRect(x: centerTopButton + buttonGap, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
        query.setImage(#imageLiteral(resourceName: "Query"), for: UIControlState.normal)
        query.setImage(#imageLiteral(resourceName: "Query_On2"), for: UIControlState.selected)
        query.addTarget(self, action: #selector(queryAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(query)
        
        measure = UIButton(type: UIButtonType.custom)
        measure.frame = CGRect(x: centerTopButton + buttonGap * 2, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
        measure.setImage(#imageLiteral(resourceName: "Measure"), for: UIControlState.normal)
        measure.setImage(#imageLiteral(resourceName: "Measure_On"), for: UIControlState.selected)
        measure.addTarget(self, action: #selector(measureAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(measure)
        
        protractor = UIButton(type: UIButtonType.custom)
        protractor.frame = CGRect(x: centerTopButton + buttonGap * 3, y: topPadding! + (self.navigationController?.navigationBar.frame.height)!, width: buttonSize, height: buttonSize)
        protractor.setImage(#imageLiteral(resourceName: "Protractor"), for: UIControlState.normal)
        protractor.setImage(#imageLiteral(resourceName: "Protractor_On"), for: UIControlState.selected)
        protractor.addTarget(self, action: #selector(protractorAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(protractor)
        
        pointCounter = UIButton(type: UIButtonType.custom)
        pointCounter.frame = CGRect(x: centerTopButton, y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
        pointCounter.setImage(#imageLiteral(resourceName: "Point Counter"), for: UIControlState.normal)
        pointCounter.setImage(#imageLiteral(resourceName: "Point Counter_On2"), for: UIControlState.selected)
        pointCounter.addTarget(self, action: #selector(pointCounterAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(pointCounter)
        
        classification = UIButton(type: UIButtonType.custom)
        classification.frame = CGRect(x: centerTopButton + buttonGap, y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
        classification.setImage(#imageLiteral(resourceName: "Classification"), for: UIControlState.normal)
        classification.setImage(#imageLiteral(resourceName: "Classification_On"), for: UIControlState.selected)
        classification.addTarget(self, action: #selector(classificationAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(classification)
        
        interferenceColors = UIButton(type: UIButtonType.custom)
        interferenceColors.frame = CGRect(x: centerTopButton + buttonGap * 2, y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
        interferenceColors.setImage(#imageLiteral(resourceName: "Interference Colors"), for: UIControlState.normal)
        interferenceColors.setImage(#imageLiteral(resourceName: "Interference Colors_On"), for: UIControlState.selected)
        interferenceColors.addTarget(self, action: #selector(interferenceColorsAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(interferenceColors)
        
        mineralList = UIButton(type: UIButtonType.custom)
        mineralList.frame = CGRect(x: centerTopButton + buttonGap * 3, y: topPadding! + (self.navigationController?.navigationBar.frame.height)! + buttonGap, width: buttonSize, height: buttonSize)
        mineralList.setImage(#imageLiteral(resourceName: "Mineral List"), for: UIControlState.normal)
        mineralList.setImage(#imageLiteral(resourceName: "Mineral List_On"), for: UIControlState.selected)
        mineralList.addTarget(self, action: #selector(mineralListAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(mineralList)
        
        
        // MARK: the following buttons change the background image
        // Optical Microscope slides
        planePolarized = UIButton(type: UIButtonType.custom)
        planePolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        planePolarized.setTitle("Plane", for: .normal)
        planePolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        planePolarized.setTitleColor(UIColor.blue, for: .normal)
        //planePolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //planePolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        planePolarized.addTarget(self, action: #selector(planePolarizedAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(planePolarized)
        
        currentSlide = planePolarized
        
        crossPolarized = UIButton(type: UIButtonType.custom)
        crossPolarized.frame = CGRect(x: screenWidth * 0.01, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        crossPolarized.setTitle("Cross", for: .normal)
        crossPolarized.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        crossPolarized.setTitleColor(UIColor.blue, for: .normal)
        //crossPolarized.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //crossPolarized.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        crossPolarized.addTarget(self, action: #selector(crossPolarizedAction(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(crossPolarized)
        
        reflectedLight = UIButton(type: UIButtonType.custom)
        reflectedLight.frame = CGRect(x: screenWidth * 0.01 + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        reflectedLight.setTitle("Reflected", for: .normal)
        reflectedLight.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        reflectedLight.setTitleColor(UIColor.blue, for: .normal)
        //reflectedLight.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //reflectedLight.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        reflectedLight.addTarget(self, action: #selector(reflectedLightAction(sender:)), for: UIControlEvents.touchUpInside)
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
        rotateRight.addTarget(self, action: #selector(rotatePolars(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(rotateRight)
        
        rotateLeft = UIButton(type: UIButtonType.system)
        rotateLeft.frame = CGRect(x: buttonGap + screenWidth * 0.16, y: screenHeight * 1.025 - (iconBottomGap), width: screenWidth * 0.15, height: screenHeight * 0.05)
        rotateLeft.setTitle("<==", for: .normal)
        rotateLeft.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        rotateLeft.setTitleColor(UIColor.blue, for: .normal)
        rotateLeft.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "DolomitePPL0"))
        rotateLeft.addTarget(self, action: #selector(rotatePolars(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(rotateLeft)
        
        
        // Electron Microscope slides
        cathodeLuminescence = UIButton(type: UIButtonType.custom)
        cathodeLuminescence.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        cathodeLuminescence.setTitle("Cathode", for: .normal)
        cathodeLuminescence.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        cathodeLuminescence.setTitleColor(UIColor.blue, for: .normal)
        //cathodeLuminescence.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //cathodeLuminescence.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(cathodeLuminescence)
        
        elementMap = UIButton(type: UIButtonType.custom)
        elementMap.frame = CGRect(x: centerElectronButtons, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        elementMap.setTitle("Element", for: .normal)
        elementMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        elementMap.setTitleColor(UIColor.blue, for: .normal)
        //elementMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //elementMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(elementMap)
        
        backscatterElectronMap = UIButton(type: UIButtonType.custom)
        backscatterElectronMap.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap), width: buttonSize, height: buttonSize)
        backscatterElectronMap.setTitle("Backscatter", for: .normal)
        backscatterElectronMap.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        backscatterElectronMap.setTitleColor(UIColor.blue, for: .normal)
        //backscatterElectronMap.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //backscatterElectronMap.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
        view.addSubview(backscatterElectronMap)
        
        energyDispersive = UIButton(type: UIButtonType.custom)
        energyDispersive.frame = CGRect(x: centerElectronButtons + buttonGap, y: screenHeight - (iconBottomGap + buttonGap), width: buttonSize, height: buttonSize)
        energyDispersive.setTitle("Energy", for: .normal)
        energyDispersive.titleLabel!.font = UIFont.boldSystemFont(ofSize: screenWidth / 25)
        energyDispersive.setTitleColor(UIColor.blue, for: .normal)
        //energyDispersive.setImage(#imageLiteral(resourceName: "KySch4"), for: UIControlState.normal)
        //energyDispersive.setImage(#imageLiteral(resourceName: "DolomiteK"), for: UIControlState.selected)
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
        addButtonsAndLabels()
        view.addSubview(electronMicroscopeLabel())
        view.addSubview(opticalMicroscopeLabel())
        view.addSubview(scrollableView)
        imageViewContainer.image = slideImages[0]
        scrollableView.addSubview(imageViewContainer)
        constraints()
        minMaxZoomValues()
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
        
        if currentSelector == sender {
            selectorLabel.text = label
        }
        else {
            selectorLabel.text = "Nothing Selected\nPress any button to get started"
        }
    }
    
    @objc func exploreAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Explore:\nTap the image at any location to identify the mineral")
    }
    
    @objc func queryAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Query:\nTap the image to be quizzed on the mineral at any location")
    }
    
    @objc func measureAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Measure:\nTap any two locations to see the distance between them")
    }
    
    @objc func protractorAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Protractor:\nTap any two locations to see the angle between them")
    }
    
    @objc func pointCounterAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Point Counter\n")
    }
    
    @objc func classificationAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Classification")
        let classificationImage = UIImageView()
        classificationImage.translatesAutoresizingMaskIntoConstraints = false
        
        classificationImage.frame = CGRect(x: 0, y: 0/*-(topPadding! + (self.navigationController?.navigationBar.frame.height)! + screenHeight * 0.1675)*/, width: screenWidth, height: screenHeight)
        
        classificationImage.image = #imageLiteral(resourceName: "Volcanic")
        classificationImage.contentMode = .scaleAspectFit
        
        if (currentSelector == sender) {
            view.addSubview(classificationImage)
        }
        else {
            classificationImage.removeFromSuperview()
        }
    }
    
    @objc func interferenceColorsAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Interference Colors")
    }
    
    @objc func mineralListAction(sender: UIButton) {
        setCurrentSelector(sender: sender, label: "Mineral List")
    }
    
    
    @objc func setCurrentSlide(sender: UIButton, image: UIImage) {
        if currentSlide != sender {
            currentSlide = sender
            imageViewContainer.image = image
            scrollableView.zoomScale = 1
        }
    }
    
    func planePolarizedImage() -> UIImage {
        switch planePolarizedAngle {
            
        case CShort(90):
            return planePolarizedRotatePolarImages[0]
            
        case CShort(180):
            return planePolarizedRotatePolarImages[1]
            
        case CShort(270):
            return planePolarizedRotatePolarImages[2]
            
        default:
            return slideImages[0]
        }
    }
    
    func crossPolarizedImage() -> UIImage {
        switch crossPolarizedAngle {
            
        case CShort(15):
            return crossPolarizedRotatePolarImages[0]
            
        case CShort(30):
            return crossPolarizedRotatePolarImages[1]
            
        case CShort(45):
            return crossPolarizedRotatePolarImages[2]
            
        case CShort(60):
            return crossPolarizedRotatePolarImages[3]
            
        case CShort(75):
            return crossPolarizedRotatePolarImages[4]
            
        case CShort(90):
            return crossPolarizedRotatePolarImages[5]
            
        case CShort(105):
            return crossPolarizedRotatePolarImages[6]
            
        case CShort(120):
            return crossPolarizedRotatePolarImages[7]
            
        case CShort(135):
            return crossPolarizedRotatePolarImages[8]
            
        case CShort(150):
            return crossPolarizedRotatePolarImages[9]
            
        case CShort(165):
            return crossPolarizedRotatePolarImages[10]
            
        case CShort(180):
            return crossPolarizedRotatePolarImages[11]
            
        case CShort(195):
            return crossPolarizedRotatePolarImages[12]
            
        case CShort(210):
            return crossPolarizedRotatePolarImages[13]
            
        case CShort(225):
            return crossPolarizedRotatePolarImages[14]
            
        case CShort(240):
            return crossPolarizedRotatePolarImages[15]
            
        case CShort(255):
            return crossPolarizedRotatePolarImages[16]
            
        case CShort(270):
            return crossPolarizedRotatePolarImages[17]
            
        case CShort(285):
            return crossPolarizedRotatePolarImages[18]
            
        case CShort(300):
            return crossPolarizedRotatePolarImages[19]
            
        case CShort(315):
            return crossPolarizedRotatePolarImages[20]
            
        case CShort(330):
            return crossPolarizedRotatePolarImages[21]
            
        case CShort(345):
            return crossPolarizedRotatePolarImages[22]
            
        default:
            return slideImages[1]
        }
    }
    
    @objc func planePolarizedAction(sender: UIButton) {
        setCurrentSlide(sender: sender, image: planePolarizedImage())
    }
 
    @objc func crossPolarizedAction(sender: UIButton) {
        setCurrentSlide(sender: sender, image: crossPolarizedImage())
    }
    
    @objc func rotatePolars(sender: UIButton) {
        if currentSlide == planePolarized {
            if sender == rotateRight {
                if planePolarizedAngle == CShort(270) {
                    planePolarizedAngle = 0
                }
                else {
                    planePolarizedAngle += 90
                }
            }
            else if sender == rotateLeft {
                if planePolarizedAngle == CShort(0) {
                    planePolarizedAngle = 270
                }
                else {
                    planePolarizedAngle -= 90
                }
            }
            
            imageViewContainer.image = planePolarizedImage()
        }
        else if currentSlide == crossPolarized {
            if sender == rotateRight {
                if crossPolarizedAngle == CShort(345) {
                    crossPolarizedAngle = 0
                }
                else {
                    crossPolarizedAngle += 15
                }
            }
            else if sender == rotateLeft {
                if crossPolarizedAngle == CShort(0) {
                    crossPolarizedAngle = 345
                }
                else {
                    crossPolarizedAngle -= 15
                }
            }
            imageViewContainer.image = crossPolarizedImage()
        }
    }
    
    @objc func reflectedLightAction(sender: UIButton) {
        setCurrentSlide(sender: sender, image: slideImages[2])
    }
    
    @objc func bertrandLensAction(sender: UIButton) {
        setCurrentSlide(sender: sender, image: #imageLiteral(resourceName: "Ande28"))
    }
    
    @objc func cathodeLuminescenceAction(sender: UIButton) {
        setCurrentSlide(sender: sender, image: slideImages[3])
    }
    
    @objc func elementMapAction(sender: UIButton) {
        
    }
    
    @objc func backscatterElectronMap(sender: UIButton) {
        setCurrentSlide(sender: sender, image: slideImages[4])
    }
}
