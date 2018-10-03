//
//  IgneousVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/30/18.
//  Copyright © 2018 Geology. All rights reserved.
//
/*
import UIKit

class IgneousVC: UIViewController {

    // Adds all the specific rock buttons to the scroll view
    func addScrollViewButtons(igneousScrollView: UIScrollView) {
        igneousScrollView.addSubview(setupAndesite())
        igneousScrollView.addSubview(setupAnorthosite())
        igneousScrollView.addSubview(setupAplite())
        igneousScrollView.addSubview(setupBasalt())
        igneousScrollView.addSubview(setupDacite())
        igneousScrollView.addSubview(setupGabbro())
        igneousScrollView.addSubview(setupGranite())
        igneousScrollView.addSubview(setupPeridotite())
        igneousScrollView.addSubview(setupQuartzDiorite())
    }
    
    
    // MARK: The following functions create all the specific rock type buttons
    // customizeRockButton can be found in the RockTypeFunctions.swift file
    
    func setupAndesite() -> UIButton {
        var andesite: UIButton!
        andesite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: andesite, yCoordinate: edgeGap, buttonName: "Andesite")
        andesite.addTarget(self, action: #selector(andesiteAction), for: UIControlEvents.touchUpInside)
        return andesite
    }
    
    func setupAnorthosite() -> UIButton {
        var anorthosite: UIButton!
        anorthosite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: anorthosite, yCoordinate: buttonHeightFunction + edgeGap, buttonName: "Anorthosite")
        anorthosite.addTarget(self, action: #selector(anorthositeAction), for: UIControlEvents.touchUpInside)
        return anorthosite
    }
    
    func setupAplite() -> UIButton {
        var aplite: UIButton!
        aplite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: aplite, yCoordinate: edgeGap + buttonHeightFunction * 2, buttonName: "Aplite")
        aplite.addTarget(self, action: #selector(apliteAction), for: UIControlEvents.touchUpInside)
        return aplite
    }
    
    func setupBasalt() -> UIButton {
        var basalt: UIButton!
        basalt = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: basalt, yCoordinate: edgeGap + buttonHeightFunction * 3, buttonName: "Basalt")
        basalt.addTarget(self, action: #selector(basaltAction), for: UIControlEvents.touchUpInside)
        return basalt
    }
    
    func setupDacite() -> UIButton {
        var dacite: UIButton!
        dacite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: dacite, yCoordinate: edgeGap + buttonHeightFunction * 4, buttonName: "Dacite")
        dacite.addTarget(self, action: #selector(daciteAction), for: UIControlEvents.touchUpInside)
        return dacite
    }
    
    func setupGabbro() -> UIButton {
        var gabbro: UIButton!
        gabbro = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: gabbro, yCoordinate: edgeGap + buttonHeightFunction * 5, buttonName: "Gabbro")
        gabbro.addTarget(self, action: #selector(gabbroAction), for: UIControlEvents.touchUpInside)
        return gabbro
    }
    
    func setupGranite() -> UIButton {
        var granite: UIButton!
        granite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: granite, yCoordinate: edgeGap + buttonHeightFunction * 6, buttonName: "Granite")
        granite.addTarget(self, action: #selector(graniteAction), for: UIControlEvents.touchUpInside)
        return granite
    }
    
    func setupPeridotite() -> UIButton {
        var peridotite: UIButton!
        peridotite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: peridotite, yCoordinate: edgeGap + buttonHeightFunction * 7, buttonName: "Peridotite")
        peridotite.addTarget(self, action: #selector(peridotiteAction), for: UIControlEvents.touchUpInside)
        return peridotite
    }
    
    func setupQuartzDiorite() -> UIButton {
        var quartzDiorite: UIButton!
        quartzDiorite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: quartzDiorite, yCoordinate: edgeGap + buttonHeightFunction * 8, buttonName: "Quartz Diorite")
        quartzDiorite.addTarget(self, action: #selector(quartzDioriteAction), for: UIControlEvents.touchUpInside)
        return quartzDiorite
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        customNavBar.title = "Igneous"
        customNavBar.currentVC = self
        
        view.addSubview(customNavBar.createNavBar(addHomeButton: true))
    
        
        let igneousScrollView = scrollView(length: screenHeight * 0.16 * 9 + screenHeight * 0.01)
        
        view.addSubview(igneousScrollView)
        setupScrollView(scrollView: igneousScrollView, currentVC: self)
        addScrollViewButtons(igneousScrollView: igneousScrollView)
    }
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: NewSampleVC(), deleteVC: IgneousVC())
    }
    
    @objc func andesiteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: AndesiteVC(), deleteVC: IgneousVC())
    }
    
    @objc func anorthositeAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: AnorthositeVC(), deleteVC: IgneousVC())
    }
    
    @objc func apliteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: ApliteVC(), deleteVC: IgneousVC())
    }
    
    @objc func basaltAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: BasaltVC(), deleteVC: IgneousVC())
    }
    
    @objc func daciteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: DaciteVC(), deleteVC: IgneousVC())
    }
    
    @objc func gabbroAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GabbroVC(), deleteVC: IgneousVC())
    }
    
    @objc func graniteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GraniteVC(), deleteVC: IgneousVC())
    }
    
    @objc func peridotiteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: PeridotiteVC(), deleteVC: IgneousVC())
    }
    
    @objc func quartzDioriteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: QuartzDioriteVC(), deleteVC: IgneousVC())
    }
}
*/
