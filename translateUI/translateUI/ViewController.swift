//
//  ViewController.swift
//  translateUI
//
//  Created by SunarcMac on 08/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

var rtl = RTL()

class ViewController: UIViewController {

    
    @IBOutlet weak var arrowImg: UIImageView! {
        didSet {
           // arrowImg.image = arrowImg.image?.flipIfNeeded()
        }
    }
    
    @IBAction func onBtnTap(_ sender: Any) {
    
//        if rtl.isEnglish(){
//            rtl.changeLanguageTo(lang: "ar")
//            let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//            let stry = UIStoryboard(name: "Main", bundle: nil)
//            rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "rootnav")
//            
//        } else{
//            rtl.changeLanguageTo(lang: "en")
//            let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//            let stry = UIStoryboard(name: "Main", bundle: nil)
//            rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "rootnav")
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

//extension UIImage {
//    public func flippedImage() -> UIImage?{
//        if let _cgImag = self.cgImage {
//            let flippedimg = UIImage(cgImage: _cgImag, scale:self.scale , orientation: UIImage.Orientation.upMirrored)
//            return flippedimg
//        }
//        return nil
//    }
//
//    public func flipIfNeeded() -> UIImage? {
//        if rtl.isArabic() {
//            return self.flippedImage()
//        }
//        return self
//    }
//}
