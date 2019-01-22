//
//  ViewController.swift
//  AmazonScreenDesign
//
//  Created by Raghu ram mahathi on 22/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

var scrollingTimer = Timer()
var dataArray = ["image.jpg","image.jpg","image.jpg","image.jpg","image.jpg"]

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let bannersSliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersSliderCell", for: indexPath) as! BannersSliderCell
        
        bannersSliderCell.sliderImage.image = UIImage(named: dataArray[indexPath.row])
        var row = indexPath.row
        let numberOfRecords = dataArray.count - 1
        if row < numberOfRecords{
            row = row + 1
        }else{
            row = 0
        }
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(ViewController.startTimer(theTimer:)), userInfo: row, repeats: true)
        
        return bannersSliderCell
    }
    

    @IBOutlet weak var sliderCollection: UICollectionView!
    

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }

        @objc func startTimer(theTimer: Timer) {
    
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.sliderCollection.scrollToItem(at: IndexPath(row: theTimer.userInfo as! Int, section: 0), at: .centeredHorizontally, animated: false)
            }, completion: nil)
    
        }

}
/*
var scrollingTimer = Timer()
var dataArray = ["camera-icon.png","camera-icon.png","camera-icon.png","camera-icon.png","camera-icon.png"]
class CarouselCollection: UICollectionView,UICollectionViewDelegate, UICollectionViewDataSource {
    
    //  let coll = CarouselCollection()
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let bannersSliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersSliderCell", for: indexPath) as! BannersSliderCell
        
        bannersSliderCell.sliderImage.image = UIImage(named: dataArray[indexPath.row])
        var row = indexPath.row
        let numberOfRecords = dataArray.count - 1
        if row < numberOfRecords{
            row = row + 1
        }else{
            row = 0
        }
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector:#selector(ViewController.startTimer(theTimer:)), userInfo: row, repeats: true)
        
        return bannersSliderCell
}

//    @objc func startTimer(theTimer: Timer) {
//
//        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
//            self.coll.scrollToItem(at: IndexPath(row: theTimer.userInfo as! Int, section: 0), at: .centeredHorizontally, animated: false)
//        }, completion: nil)
//
//    }
*/
