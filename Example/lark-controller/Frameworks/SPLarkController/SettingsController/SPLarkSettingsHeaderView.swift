//
//  SPLarkSettingsHeaderView.swift
//  lark-controller
//
//  Created by solo on 2021/5/8.
//  Copyright © 2021 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPLarkSettingsHeaderView: UICollectionReusableView {
    let lblTitle = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple

        // Customize here
        lblTitle.frame =  CGRect(x: 0, y: 0, width: 100, height: 30)
        lblTitle.textColor = UIColor.label
        
        self.addSubview(lblTitle)
     }

     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

     }
}
