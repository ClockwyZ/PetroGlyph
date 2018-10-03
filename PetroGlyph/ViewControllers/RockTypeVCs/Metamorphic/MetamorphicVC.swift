//
//  MetamorphicViewController.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/30/18.
//  Copyright © 2018 Geology. All rights reserved.
//
/*
import UIKit

class MetamorphicVC: UIViewController {
    
    // Adds all the specific rock buttons to the scroll view
    func addScrollViewButtons(metamorphicScrollView: UIScrollView) {
        metamorphicScrollView.addSubview(setupAmphibolite())
        metamorphicScrollView.addSubview(setupCordieriteSchist())
        metamorphicScrollView.addSubview(setupGarnetMicaSchist())
        metamorphicScrollView.addSubview(setupGlaucophaneSchist())
        metamorphicScrollView.addSubview(setupGneiss())
        metamorphicScrollView.addSubview(setupKyaniteSchist())
        metamorphicScrollView.addSubview(setupMarble())
        metamorphicScrollView.addSubview(setupMylonite())
        metamorphicScrollView.addSubview(setupQuartzite())
        metamorphicScrollView.addSubview(setupSerpentinite())
        metamorphicScrollView.addSubview(setupSlate())
        metamorphicScrollView.addSubview(setupStauroliteSchist())
        metamorphicScrollView.addSubview(setupTalcSchist())
    }
    
    // MARK: The following functions create all the specific rock type buttons
    // customizeRockButton can be found in the RockTypeFunctions.swift file
    
    func setupAmphibolite() -> UIButton {
        var amphibolite: UIButton!
        amphibolite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: amphibolite, yCoordinate: edgeGap, buttonName: "Amphibolite")
        amphibolite.addTarget(self, action: #selector(amphiboliteAction), for: UIControlEvents.touchUpInside)
        return amphibolite
    }
    
    func setupCordieriteSchist() -> UIButton {
        var cordieriteSchist: UIButton!
        cordieriteSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: cordieriteSchist, yCoordinate: buttonHeightFunction + edgeGap, buttonName: "Cordierite Schist")
        cordieriteSchist.addTarget(self, action: #selector(cordieriteSchistAction), for: UIControlEvents.touchUpInside)
        return cordieriteSchist
    }
    
    func setupGarnetMicaSchist() -> UIButton {
        var garnetMicaSchist: UIButton!
        garnetMicaSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: garnetMicaSchist, yCoordinate: edgeGap + buttonHeightFunction * 2, buttonName: "Garnet-Mica Schist")
        garnetMicaSchist.addTarget(self, action: #selector(garnetMicaSchistAction), for: UIControlEvents.touchUpInside)
        return garnetMicaSchist
    }
    
    func setupGlaucophaneSchist() -> UIButton {
        var glaucophaneSchist: UIButton!
        glaucophaneSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: glaucophaneSchist, yCoordinate: edgeGap + buttonHeightFunction * 3, buttonName: "Glaucophane Schist")
        glaucophaneSchist.addTarget(self, action: #selector(glaucophaneSchistAction), for: UIControlEvents.touchUpInside)
        return glaucophaneSchist
    }
    
    func setupGneiss() -> UIButton {
        var gneiss: UIButton!
        gneiss = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: gneiss, yCoordinate: edgeGap + buttonHeightFunction * 4, buttonName: "Gneiss")
        gneiss.addTarget(self, action: #selector(gneissAction), for: UIControlEvents.touchUpInside)
        return gneiss
    }
    
    func setupKyaniteSchist() -> UIButton {
        var kyaniteSchist: UIButton!
        kyaniteSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: kyaniteSchist, yCoordinate: edgeGap + buttonHeightFunction * 5, buttonName: "Kyanite Schist")
        kyaniteSchist.addTarget(self, action: #selector(kyaniteSchistAction), for: UIControlEvents.touchUpInside)
        return kyaniteSchist
    }
    
    func setupMarble() -> UIButton {
        var marble: UIButton!
        marble = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: marble, yCoordinate: edgeGap + buttonHeightFunction * 6, buttonName: "Marble")
        marble.addTarget(self, action: #selector(marbleAction), for: UIControlEvents.touchUpInside)
        return marble
    }
    
    func setupMylonite() -> UIButton {
        var mylonite: UIButton!
        mylonite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: mylonite, yCoordinate: edgeGap + buttonHeightFunction * 7, buttonName: "Mylonite")
        mylonite.addTarget(self, action: #selector(myloniteAction), for: UIControlEvents.touchUpInside)
        return mylonite
    }
    
    func setupQuartzite() -> UIButton {
        var quartzite: UIButton!
        quartzite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: quartzite, yCoordinate: edgeGap + buttonHeightFunction * 8, buttonName: "Quartzite")
        quartzite.addTarget(self, action: #selector(quartziteAction), for: UIControlEvents.touchUpInside)
        return quartzite
    }
    
    func setupSerpentinite() -> UIButton {
        var serpentinite: UIButton!
        serpentinite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: serpentinite, yCoordinate: edgeGap + buttonHeightFunction * 9, buttonName: "Serpentinite")
        serpentinite.addTarget(self, action: #selector(serpentiniteAction), for: UIControlEvents.touchUpInside)
        return serpentinite
    }
    
    func setupSlate() -> UIButton {
        var slate: UIButton!
        slate = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: slate, yCoordinate: edgeGap + buttonHeightFunction * 10, buttonName: "Slate")
        slate.addTarget(self, action: #selector(slateAction), for: UIControlEvents.touchUpInside)
        return slate
    }
    
    func setupStauroliteSchist() -> UIButton {
        var stauroliteSchist: UIButton!
        stauroliteSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: stauroliteSchist, yCoordinate: edgeGap + buttonHeightFunction * 11, buttonName: "Staurolite Schist")
        stauroliteSchist.addTarget(self, action: #selector(stauroliteSchistAction), for: UIControlEvents.touchUpInside)
        return stauroliteSchist
    }
    
    func setupTalcSchist() -> UIButton {
        var talcSchist: UIButton!
        talcSchist = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: talcSchist, yCoordinate: edgeGap + buttonHeightFunction * 12, buttonName: "Talc Schist")
        talcSchist.addTarget(self, action: #selector(talcSchistAction), for: UIControlEvents.touchUpInside)
        return talcSchist
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        customNavBar.title = "Metamorphic"
        customNavBar.currentVC = self
        
        view.addSubview(customNavBar.createNavBar(addHomeButton: true))
        
        
        let metamorphicScrollView = scrollView(length: screenHeight * 0.16 * 13 + screenHeight * 0.01)
        
        view.addSubview(metamorphicScrollView)
        setupScrollView(scrollView: metamorphicScrollView, currentVC: self)
        addScrollViewButtons(metamorphicScrollView: metamorphicScrollView)
    }
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: NewSampleVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func amphiboliteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: AmphiboliteVC(), deleteVC: MetamorphicVC())
    }

    @objc func cordieriteSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: CordieriteSchistVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func garnetMicaSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GarnetMicaSchistVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func glaucophaneSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GlaucophaneSchistVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func gneissAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GneissVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func kyaniteSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: KyaniteSchistVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func marbleAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: MarbleVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func myloniteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: MyloniteVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func quartziteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: QuartziteVC(), deleteVC: MetamorphicVC())

    }
    
    @objc func serpentiniteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: SerpentiniteVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func slateAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: SlateVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func stauroliteSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: StauroliteSchistVC(), deleteVC: MetamorphicVC())
    }
    
    @objc func talcSchistAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: TalcSchistVC(), deleteVC: MetamorphicVC())
    }
}
*/
