//
//  AutoHeightCollectionView.swift
//  CollectionSemScroll
//
//  Created by Vitor Gomes on 18/05/21.
//

import UIKit

class AutoHeightCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        scrollUnable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollUnable()
    }
    
    private func scrollUnable() {
        isScrollEnabled = false
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: collectionViewLayout.collectionViewContentSize.height)
    }
    
}


