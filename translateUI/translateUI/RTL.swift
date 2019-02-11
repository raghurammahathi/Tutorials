//
//  RTL.swift
//  translateUI
//
//  Created by SunarcMac on 08/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import UIKit


class RTL: NSObject {
    
    var language: String!
    var bundle: Bundle!
    let LANGUAGE_KEY: String = "LANGUAGE_KEY"
    
    override init() {
        super.init()
        
        // user preferred languages. this is the default app language(device language - first launch app language)!
        language = Bundle.main.preferredLocalizations[0]
        
        // init the bundle object that contains the localization files based on language
        bundle = Bundle(path: Bundle.main.path(forResource: language == "ar" ? language : "Base", ofType: "lproj")!)
        
        if isArabic() {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//            let stry = UIStoryboard(name: "Main", bundle: nil)
//            rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "rootnav")
           // UIImageView.appearance().semanticContentAttribute = .forceRightToLeft
//            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
//            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
//            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
//            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
//            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    func isEnglish () -> Bool {
        return language == "en"
    }
   
    // check if current language is arabic
    func isArabic () -> Bool {
        return language == "ar"
    }
    
    // returns app language direction.
    func rtl () -> Bool {
        return Locale.characterDirection(forLanguage: language) == Locale.LanguageDirection.rightToLeft
    }
    
    // switches language. if its ar change it to en and vise-versa
    func changeLanguage(langString : String)
    {
        var changeTo: String
        // check current language to switch to the other.
        if language == "ar" {
            changeTo = "en"
        } else {
            changeTo = "ar"
        }
        // change language
        changeLanguageTo(lang: changeTo)
    }
    
    // change language to a specfic one.
    func changeLanguageTo(lang: String) {
        language = lang
        
        // set prefered languages for the app.
        UserDefaults.standard.set([lang], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // re-set the bundle object based on the new langauge
        bundle = Bundle(path: Bundle.main.path(forResource: language == "ar" ? language : "Base", ofType: "lproj")!)
        
        // app direction
        if isArabic() {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
           // UIImageView.appearance().semanticContentAttribute = .forceRightToLeft

//            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
//            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
//            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
//            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
//            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
    }
    
    // get local string
    func getLocale() -> Locale {
        if rtl() {
            return Locale.init(identifier: "ar_OM")
        } else {
            return Locale.init(identifier: "en_US")
        }
    }
    
    // get localized string based on app langauge.
    func LocalString(key: String) -> String {
        let localizedString: String? = NSLocalizedString(key, bundle: bundle, value: key, comment: "")
        return localizedString ?? key
    }
    
    // get localized string for specific language
    func LocalString(key: String, lan: String) -> String {
        let bundl:Bundle! = Bundle(path: Bundle.main.path(forResource: lan == "ar" ? lan : "Base", ofType: "lproj")!)
        return NSLocalizedString(key, bundle: bundl, value: key, comment: "")
    }
    
    
    
}


