//
//  CustomLayout.swift
//  LalsaTask
//
//  Created by Raghu ram mahathi on 03/04/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()

        self.sectionHeadersPinToVisibleBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sectionHeadersPinToVisibleBounds = true
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //        if collectionView.contentOffset.y == -44.0 {
    //            return CGSize(width: collectionView.frame.width, height: 100)
    //        }
    //        else{
    //            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    //        }
    //
    //    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collView = collectionView else {return}
                
                
               // print(collView.contentOffset.y)
                
                // let height = attributes.frame.height - collView.contentOffset.y
                
                
                let width = collView.frame.width
                attributes.frame = CGRect(x: 0, y: 0, width: width, height: 402)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        
        
        return true
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
}
