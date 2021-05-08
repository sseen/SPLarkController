// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

open class SPLarkSettingsCollectionView: UICollectionView {
    
    let deviceWidth = UIScreen.main.bounds.width
    //let deviceHeight = UIScreen.main.bounds.height
    let numberOfLine:CGFloat = 3
    let itemSpacing:CGFloat = 8
    let paddingView:CGFloat = 0 //16
    
    let layout = UICollectionViewFlowLayout()
    let cellIdentificator: String = "SPLarkSettingsCollectionViewCell"
    var cellSize: CGSize = CGSize.init(width: 100, height: 60)
    var sideInset: CGFloat = 0
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        self.commonInit()
    }
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        self.commonInit()
    }
    
    internal func commonInit() {
        //
        var cellWidth = ( deviceWidth - (CGFloat)(paddingView * 2)
                            - (CGFloat)( (numberOfLine - 1) * itemSpacing ) ) / (CGFloat)(numberOfLine)
        cellWidth = cellWidth.rounded(.down)
        cellSize.width = cellWidth
        
        self.backgroundColor = UIColor.clear
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.delaysContentTouches = false
        self.isPagingEnabled = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.layout.scrollDirection = .horizontal
        self.layout.minimumLineSpacing = itemSpacing
        self.layout.minimumInteritemSpacing = itemSpacing
        self.contentInset = UIEdgeInsets.init(top: 0, left: self.sideInset, bottom: 0, right: self.sideInset)
        
        self.register(SPLarkSettingsCollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentificator)
    }
    
    func dequeueCell(indexPath: IndexPath) -> SPLarkSettingsCollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: self.cellIdentificator, for: indexPath) as! SPLarkSettingsCollectionViewCell
    }
    
    func layout(y: CGFloat) {
        print(y,self.superview?.frame.width,self.superview)
        self.frame = CGRect.init(x: 0, y: y, width: (self.superview?.frame.width ?? 0), height: self.cellSize.height + self.layout.minimumInteritemSpacing)
        self.layout.itemSize = self.cellSize
    }
}
