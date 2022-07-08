//
//  HomeTableViewHeader.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//

import UIKit

class HomeTableViewHeader: UIView {

    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bottomWhiteMarkView: UIView!
    @IBOutlet weak var blueHeadContainer: UIView!
    
    func configuraView(){
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
        blueHeadContainer.layer.cornerRadius = 80
        blueHeadContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
   
}
