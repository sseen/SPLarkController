//
//  SPLarkSettingsImageLabelCell.swift
//  lark-controller
//
//  Created by solo on 5/12/21.
//  Copyright © 2021 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPLarkSettingsImageLabelCell: UICollectionViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override var isHighlighted: Bool{
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.27, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    self.transform = self.transform.scaledBy(x: 0.92, y: 0.92)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.27, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    self.transform = CGAffineTransform.identity
                }, completion: nil)
            }
        }
    }
    
    func setHighlighted(_ state: Bool, color: UIColor) {
        self.backgroundColor = color
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
