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
        self.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        lblTitle.textColor = UIColor.label
        
     }

     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

     }
}
