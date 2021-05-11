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
        let container = UIStackView()
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        lblTitle.textColor = UIColor.label
        
        container.addArrangedSubview(lblTitle)
        
     }

     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

     }
}
