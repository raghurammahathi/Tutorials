//
//  LanguageDetails.swift
//  Sahel
//
//  Created by Octal on 05/02/18.
//  Copyright © 2018 Octal. All rights reserved.
//

import UIKit
//import IQKeyboardManager

class LanguageDetails: NSObject {
    
    var language: String!
    var bundle: Bundle!
    let LANGUAGE_KEY: String = "LANGUAGE_KEY"
    
    override init() {
        super.init()
        
        // user preferred languages. this is the default app language(device language - first launch app language)!
        language = Bundle.main.preferredLocalizations[0]
        
        // init the bundle object that contains the localization files based on language
        bundle = Bundle(path: Bundle.main.path(forResource: language == "ar" ? language : "Base", ofType: "lproj")!)
        
        // bars direction
        if isArabic() {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
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
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }

        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = languageHelper.LocalString(key: "Done_Title")
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
