//
//  PublicFunctions.swift
//  PetroGlyph
//
//  Created by Connor Zufelt on 7/25/18.
//  Copyright © 2018 Geology. All rights reserved.
//

import Foundation
import UIKit


// MARK: Screen size functions
// Gives the width of the device screen
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Gives the height of the device screen
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

// MARK: Gives the safe spaces on the bottom and top of the screen
let window = UIApplication.shared.keyWindow
let topPadding = window?.safeAreaInsets.top
let bottomPadding = window?.safeAreaInsets.bottom


// MARK: Creates the animations for moving forward and backward through VCs
public func transitionBackward(currentVC: UIViewController) {
    let transition = CATransition()
    transition.duration = 0.25
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromLeft
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    currentVC.view.window!.layer.add(transition, forKey: kCATransition)
}

public func transitionForward(currentVC: UIViewController) {
    let transition = CATransition()
    transition.duration = 0.25
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromRight
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    currentVC.view.window!.layer.add(transition, forKey: kCATransition)
}


// Presents the next VC and deletes the current VC from memory (allegedly)
public func switchVC(selfPointer: UIViewController, replacementVC: UIViewController, deleteVC: UIViewController) {
    if (selfPointer.isViewLoaded && selfPointer.view.window != nil) {
        selfPointer.present(replacementVC, animated: false, completion: {
            deleteVC.dismiss(animated: false, completion: nil)
        })
    }
}


class customNavBar: UINavigationBar {
    
    static public var currentVC: UIViewController!
    static public var title: String! = "nil"
    
    
    func setCurrentVC(newCurrentVC: UIViewController) {
        customNavBar.currentVC = newCurrentVC
    }
    
    // Creates navbar with title and back button
    static public func createNavBar(addHomeButton: Bool) -> UINavigationBar {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding!, width: screenWidth, height: screenHeight * 0.15))
        let navTitle = UINavigationItem(title: self.title)
        let navBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: currentVC, action: #selector(goBack))
        if addHomeButton {
            let navHomeButton = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.plain, target: currentVC, action: #selector(goHome))
            navTitle.rightBarButtonItem = navHomeButton
        }
        currentVC.navigationItem.leftBarButtonItem = navBackButton
        navTitle.leftBarButtonItem = navBackButton
        navBar.setItems([navTitle], animated: false)
        return navBar
    }
    
    // To my understanding, this function defers to its matching function within the VC
    @objc func goBack() {
        switchVC(selfPointer: UIViewController(), replacementVC: HomeVC(), deleteVC: UIViewController())
    }
    
    // To my understanding, this function defers to its matching function within the VC
    @objc func goHome() {
        switchVC(selfPointer: UIViewController(), replacementVC: HomeVC(), deleteVC: UIViewController())
    }
}
