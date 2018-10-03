//
//  RockSelectionController.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/27/18.
//  Copyright © 2018 Geology. All rights reserved.
//
/*
import UIKit

class SedimentaryVC: UIViewController {

    var dolomite: UIButton!
    var feldspathicArenite: UIButton!
    var graywacke: UIButton!
    var limestone1: UIButton!
    var limestone2: UIButton!
    var limestone3: UIButton!
    var ooliticLimestone: UIButton!
    var pisoliticLimestone: UIButton!
    var quartzArenite: UIButton!
    var shale: UIButton!
    var silicifiedLimestone: UIButton!
    
    
    // Adds all the specific rock buttons to the scroll view
    func addScrollViewButtons(sedimentaryScrollView: UIScrollView) {
        sedimentaryScrollView.addSubview(setupDolomite())
        sedimentaryScrollView.addSubview(setupFeldspathicArenite())
        sedimentaryScrollView.addSubview(setupGraywacke())
        sedimentaryScrollView.addSubview(setupLimestone1())
        sedimentaryScrollView.addSubview(setupLimestone2())
        sedimentaryScrollView.addSubview(setupLimestone3())
        sedimentaryScrollView.addSubview(setupOoliticLimestone())
        sedimentaryScrollView.addSubview(setupPisoliticLimestone())
        sedimentaryScrollView.addSubview(setupQuartzArenite())
        sedimentaryScrollView.addSubview(setupShale())
        sedimentaryScrollView.addSubview(setupSilicifiedLimestone())
    }
    
    
    // MARK: The following functions create all the specific rock type buttons
    // customizeRockButton can be found in the RockTypeFunctions.swift file
    
    func setupDolomite() -> UIButton {
        dolomite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: dolomite, yCoordinate: edgeGap, buttonName: "Dolomite")
        dolomite.addTarget(self, action: #selector(dolomiteAction), for: UIControlEvents.touchUpInside)
        return dolomite
    }
    
    func setupFeldspathicArenite() -> UIButton {
        feldspathicArenite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: feldspathicArenite, yCoordinate: edgeGap + buttonHeightFunction, buttonName: "Feldspathic Arenite")
        feldspathicArenite.addTarget(self, action: #selector(feldspathicAreniteAction), for: UIControlEvents.touchUpInside)
        return feldspathicArenite
    }
    
    func setupGraywacke() -> UIButton {
        graywacke = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: graywacke, yCoordinate: edgeGap + buttonHeightFunction * 2, buttonName: "Graywacke")
        graywacke.addTarget(self, action: #selector(graywackeAction), for: UIControlEvents.touchUpInside)
        return graywacke
    }
    
    func setupLimestone1() -> UIButton {
        limestone1 = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: limestone1, yCoordinate: edgeGap + buttonHeightFunction * 3, buttonName: "Limestone1")
        limestone1.addTarget(self, action: #selector(limestone1Action), for: UIControlEvents.touchUpInside)
        return limestone1
    }
    
    func setupLimestone2() -> UIButton {
        limestone2 = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: limestone2, yCoordinate: edgeGap + buttonHeightFunction * 4, buttonName: "Limestone2")
        limestone2.addTarget(self, action: #selector(limestone2Action), for: UIControlEvents.touchUpInside)
        return limestone2
    }
    
    func setupLimestone3() -> UIButton {
        limestone3 = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: limestone3, yCoordinate: edgeGap + buttonHeightFunction * 5, buttonName: "Limestone3")
        limestone3.addTarget(self, action: #selector(limestone3Action), for: UIControlEvents.touchUpInside)
        return limestone3
    }
    
    func setupOoliticLimestone() -> UIButton {
        ooliticLimestone = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: ooliticLimestone, yCoordinate: edgeGap + buttonHeightFunction * 6, buttonName: "Oolitic Limestone")
        ooliticLimestone.addTarget(self, action: #selector(ooliticLimestoneAction), for: UIControlEvents.touchUpInside)
        return ooliticLimestone
    }

    func setupPisoliticLimestone() -> UIButton {
        pisoliticLimestone = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: pisoliticLimestone, yCoordinate: edgeGap + buttonHeightFunction * 7, buttonName: "Pisolitic Limestone")
        pisoliticLimestone.addTarget(self, action: #selector(pisoliticLimestoneAction), for: UIControlEvents.touchUpInside)
        return pisoliticLimestone
    }
    
    func setupQuartzArenite() -> UIButton {
        quartzArenite = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: quartzArenite, yCoordinate: edgeGap + buttonHeightFunction * 8, buttonName: "Quartz Arenite")
        quartzArenite.addTarget(self, action: #selector(quartzAreniteAction), for: UIControlEvents.touchUpInside)
        return quartzArenite
    }
    
    func setupShale() -> UIButton {
        shale = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: shale, yCoordinate: edgeGap + buttonHeightFunction * 9, buttonName: "Shale")
        shale.addTarget(self, action: #selector(shaleAction), for: UIControlEvents.touchUpInside)
        return shale
    }
    
    func setupSilicifiedLimestone() -> UIButton {
        silicifiedLimestone = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: silicifiedLimestone, yCoordinate: edgeGap + buttonHeightFunction * 10, buttonName: "Silicified Limestone")
        silicifiedLimestone.addTarget(self, action: #selector(silicifiedLimestoneAction), for: UIControlEvents.touchUpInside)
        return silicifiedLimestone
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        RockTypeVC().navBarTitle = "Sedimentary"
        RockTypeVC().buttons = [dolomite, feldspathicArenite, graywacke, limestone1, limestone2, limestone3,
                            ooliticLimestone, pisoliticLimestone, quartzArenite, shale, silicifiedLimestone]
        RockTypeVC().sampleNames = ["Dolomite", "Feldspathic Arenite", "Graywacke", "Limestone1", "Limestone2", "Limestone3",
                                "Oolitic Limestone", "Pisolitic Limestone", "Quartz Arenite", "Shale", "Silicified Limestone"]
        RockTypeVC().rockVCs = [DolomiteVC(), FeldspathicAreniteVC(), GraywackeVC(), Limestone1VC(), Limestone2VC(), Limestone3VC(),
                            OoliticLimestoneVC(), PisoliticLimestoneVC(), QuartzAreniteVC(), ShaleVC(), SilicifiedLimestoneVC()]
        
        customNavBar.title = "Sedimentary"
        
        view.addSubview(customNavBar.createNavBar(addHomeButton: true))
        
        let sedimentaryScrollView = scrollView(length: screenHeight * 0.16 * 11 + screenHeight * 0.01)
        
        view.addSubview(sedimentaryScrollView)
        setupScrollView(scrollView: sedimentaryScrollView, currentVC: self)
        addScrollViewButtons(sedimentaryScrollView: sedimentaryScrollView)
    }
    
    
    // MARK: objc functions that determine actions this VC's buttons
    
    // TODO: Figure out if I'm actually dismissing the real VC and not a new instance of it in my switchVC function, figure out why I can't goBack from the SedimentaryVC(), and figure out how to transition VCs without it being so ugly.
    @objc func goBack() {
        transitionBackward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: NewSampleVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func goHome() {
        transitionBackward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: HomeVC(), deleteVC: SedimentaryVC())
    }
 
    @objc func dolomiteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: DolomiteVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func feldspathicAreniteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: FeldspathicAreniteVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func graywackeAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: GraywackeVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func limestone1Action() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: Limestone1VC(), deleteVC: SedimentaryVC())
    }
    
    @objc func limestone2Action() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: Limestone2VC(), deleteVC: SedimentaryVC())
    }
    
    @objc func limestone3Action() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: Limestone3VC(), deleteVC: SedimentaryVC())
    }
    
    @objc func ooliticLimestoneAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: OoliticLimestoneVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func pisoliticLimestoneAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: PisoliticLimestoneVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func quartzAreniteAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: QuartzAreniteVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func shaleAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: ShaleVC(), deleteVC: SedimentaryVC())
    }
    
    @objc func silicifiedLimestoneAction() {
        transitionForward(currentVC: self)
        switchVC(selfPointer: self, replacementVC: SilicifiedLimestoneVC(), deleteVC: SedimentaryVC())
    }
}
*/
