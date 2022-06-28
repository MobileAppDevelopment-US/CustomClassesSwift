//
//  CornerMask.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

// cut the corners of the cells, round the top corners of the first cell and the bottom corners of the last cell

class MapVC {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ServerCell.self), for: indexPath as IndexPath) as! ServerCell
        var corner: CACornerMask? = nil
        if indexPath.section == 0 {
            corner = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            if indexPath.row == 0 {
                corner = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
            if indexPath.row == dataManager.serverCount() - 1 {
                if corner != nil {
                    corner = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                } else {
                    corner = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                }
            }
        }
        cell.setupCell(countryName: "usa", corners: corner)
        return cell
    }
}

class ServerCell: UICollectionViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    private var corners: CACornerMask?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let corners = corners {
            mainView.layer.cornerRadius = 16
            mainView.layer.maskedCorners = corners
        } else {
            mainView.layer.cornerRadius = 0
        }
    }
    func setupCell(countryName: String,
                   corners: CACornerMask?) {
        countryLabel.text = countryName
        self.corners = corners
        layoutIfNeeded()
    }
}
