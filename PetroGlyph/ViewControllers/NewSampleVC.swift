//
//  NewSampleVC.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 8/15/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import Foundation
import UIKit

class NewSampleVC: UIViewController {
    
    // The following three functions initialize, customize, and add a purpose for their button.
    
    func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.title = "New Sample"
    }
    
    func sedimentarySetup() -> UIButton {
        var sedimentaryButton: UIButton!
        sedimentaryButton = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: sedimentaryButton, yCoordinate: screenHeight * 0.25, buttonName: "Sedimentary")
        sedimentaryButton.addTarget(self, action: #selector(sedimentaryButtonPressed), for: UIControlEvents.touchUpInside)
        return sedimentaryButton
    }
    
    func metamorphicSetup() -> UIButton {
        var metamorphicButton: UIButton!
        metamorphicButton = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: metamorphicButton, yCoordinate: screenHeight * 0.45, buttonName: "Metamorphic")
        metamorphicButton.addTarget(self, action: #selector(metamorphicButtonPressed), for: UIControlEvents.touchUpInside)
        return metamorphicButton
    }
    
    func igneousSetup() -> UIButton {
        var igneousButton: UIButton!
        igneousButton = UIButton(type: UIButtonType.system)
        rockTypeButtons.customizeRockTypeButtons(button: igneousButton, yCoordinate: screenHeight * 0.65, buttonName: "Igneous")
        igneousButton.addTarget(self, action: #selector(igneousButtonPressed), for: UIControlEvents.touchUpInside)
        return igneousButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        setupNavBar()
        
        // The following three functions initialize and customize the three rock type buttons respectively
        view.addSubview(sedimentarySetup())
        view.addSubview(metamorphicSetup())
        view.addSubview(igneousSetup())
    }
    
    
    // MARK: objc functions that determine actions this VC's buttons
    
    @objc func goBack() {
        transitionBackward(currentVC: self)
        _ = navigationController?.popViewController(animated: true)
    }
    
    // The three following objc functions transition to their respective VCs
    @objc func sedimentaryButtonPressed() {
        transitionForward(currentVC: self)
        
        let dolomite = UIButton()
        let feldspathicArenite = UIButton()
        let graywacke = UIButton()
        let limestone1 = UIButton()
        let limestone2 = UIButton()
        let limestone3 = UIButton()
        let ooliticLimestone = UIButton()
        let pisoliticLimestone = UIButton()
        let quartzArenite = UIButton()
        let shale = UIButton()
        let silicifiedLimestone = UIButton()
        
        let sedimentaryViewController = RockTypeVC()
        
        sedimentaryViewController.navBarTitle = "Sedimentary"
        sedimentaryViewController.buttons = [dolomite, feldspathicArenite, graywacke, limestone1, limestone2, limestone3,
                              ooliticLimestone, pisoliticLimestone, quartzArenite, shale, silicifiedLimestone]
        sedimentaryViewController.sampleNames = ["Dolomite", "Feldspathic Arenite", "Graywacke", "Limestone1", "Limestone2", "Limestone3",
                                  "Oolitic Limestone", "Pisolitic Limestone", "Quartz Arenite", "Shale", "Silicified Limestone"]
        /*sedimentaryViewController.rockVCs = [DolomiteVC(), FeldspathicAreniteVC(), GraywackeVC(), Limestone1VC(), Limestone2VC(), Limestone3VC(),
                              OoliticLimestoneVC(), PisoliticLimestoneVC(), QuartzAreniteVC(), ShaleVC(), SilicifiedLimestoneVC()]*/
        
        self.navigationController?.pushViewController(sedimentaryViewController, animated: false)
    }
    
    @objc func metamorphicButtonPressed() {
        transitionForward(currentVC: self)
        
        let amphibolite = UIButton()
        let cordieriteSchist = UIButton()
        let garnetMicaSchist = UIButton()
        let glaucophaneSchist = UIButton()
        let gneiss = UIButton()
        let kyaniteSchist = UIButton()
        let marble = UIButton()
        let mylonite = UIButton()
        let quartzite = UIButton()
        let serpentinite = UIButton()
        let slate = UIButton()
        let stauroliteSchist = UIButton()
        let talcSchist = UIButton()

        
        let metamorphicViewController = RockTypeVC()
        
        metamorphicViewController.navBarTitle = "Metamorphic"
        metamorphicViewController.buttons = [amphibolite, cordieriteSchist, garnetMicaSchist, glaucophaneSchist, gneiss, kyaniteSchist,
                                             marble, mylonite, quartzite, serpentinite, slate, stauroliteSchist, talcSchist]
        metamorphicViewController.sampleNames = ["Amphibolite", "Cordierite Schist", "Garnet-Mica Schist", "Glaucophane Schist", "Gneiss", "Kyanite Schist",
                                                 "Marble", "Mylonite", "Quartzite", "Serpentinite", "Slate", "Staurolite Schist", "Talc Schist"]
        /*metamorphicViewController.rockVCs = [AmphiboliteVC(), CordieriteSchistVC(), GarnetMicaSchistVC(), GlaucophaneSchistVC(), GneissVC(), KyaniteSchistVC(),
                                             MarbleVC(), MyloniteVC(), QuartziteVC(), SerpentiniteVC(), SlateVC(), StauroliteSchistVC(), TalcSchistVC()]*/

        self.navigationController?.pushViewController(metamorphicViewController, animated: false)
    }
    
    @objc func igneousButtonPressed() {
        transitionForward(currentVC: self)
        
        let andesite = UIButton()
        let anorthosite = UIButton()
        let aplite = UIButton()
        let basalt = UIButton()
        let dacite = UIButton()
        let gabbro = UIButton()
        let granite = UIButton()
        let peridotite = UIButton()
        let quartzDiorite = UIButton()
        
        let igneousViewController = RockTypeVC()
        
        igneousViewController.navBarTitle = "Igneous"
        igneousViewController.buttons = [andesite, anorthosite, aplite, basalt, dacite, gabbro, granite, peridotite, quartzDiorite]
        igneousViewController.sampleNames = ["Andesite", "Anorthosite", "Aplite", "Basalt", "Dacite", "Gabbro", "Granite", "Peridotite", "Quartz Diorite"]
        /*igneousViewController.rockVCs = [AndesiteVC(), AnorthositeVC(), ApliteVC(), BasaltVC(), DaciteVC(), GabbroVC(), GraniteVC(), PeridotiteVC(), QuartzDioriteVC()]*/
        
        self.navigationController?.pushViewController(igneousViewController, animated: false)
    }
}
