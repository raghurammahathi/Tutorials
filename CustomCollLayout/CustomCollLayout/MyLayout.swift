//
//  MyLayout.swift
//  CustomCollLayout
//
//  Created by SunarcMac on 27/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

protocol MyLayoutDelegate: class {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

class MyLayout: UICollectionViewLayout {
    
    weak var delegate: MyLayoutDelegate!
    fileprivate var numberOfRows = 2
    fileprivate var cellPadding: CGFloat = 10
    fileprivate var cache = [UICollectionViewLayoutAttributes]()


    fileprivate var contentWidth: CGFloat = 0
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.top + insets.bottom)
    }
    
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        let rowHeight = contentHeight / CGFloat(numberOfRows)
        var yOffset = [CGFloat]()
        for row in 0 ..< numberOfRows {
            yOffset.append(CGFloat(row) * rowHeight)
        }
        var row = 0
        var xOffset = [CGFloat](repeating: 0, count: numberOfRows)
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
        
        let labelWidth = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
        let width = cellPadding * 2 + labelWidth
        let frame = CGRect(x: xOffset[row], y: yOffset[row], width: width, height: rowHeight)
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] = xOffset[row] + width
            
            row = row < (numberOfRows - 1) ? (row + 1) : 0
    }
    
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
