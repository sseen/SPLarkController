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

open class SPLarkSettingsController: UIViewController {
    
    public let titleLabel = UILabel()
    let closeButton = SPLarkSettingsCloseButton()
    let collectionView = SPLarkSettingsCollectionView()
    var hlArray = [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3 )
        
    override open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .slide }
    
    open func settingsSecCount() -> Int {
        // fatalError("SPLarkSettingsController - Need implement function")
        return hlArray.count
    }
    
    open func settingsCount(sec:Int) -> Int {
        // fatalError("SPLarkSettingsController - Need implement function")
        return hlArray[sec].count
    }
    
    open func settingTitle(index: Int, highlighted: Bool) -> String {
        // fatalError("SPLarkSettingsController - Need implement function")
        return "one \(index)"
    }
    
    open func settingSubtitle(index: Int, highlighted: Bool) -> String? {
        // fatalError("SPLarkSettingsController - Need implement function")
        return "two"
    }
    
    open func settingHighlighted(index: IndexPath) -> Bool {
        // fatalError("SPLarkSettingsController - Need implement function")
        return hlArray[index.section][index.row]
    }
    
    open func settingColorHighlighted(index: Int) -> UIColor {
        // fatalError("SPLarkSettingsController - Need implement function")
        return UIColor.systemTeal
    }
    
    open func settingDidSelect(index: IndexPath, completion: @escaping () -> ()) {
        // fatalError("SPLarkSettingsController - Need implement function")
        for (ind,_) in hlArray[index.section].enumerated() {
            if ind == index.row {
                hlArray[index.section][ind] = true
            } else {
                hlArray[index.section][ind] = false
            }
        }
        
        self.collectionView.performBatchUpdates({
            let indexSet = IndexSet(integer: index.section)
            self.collectionView.reloadSections(indexSet)
        }, completion: nil)
    }
    
    open func reload(index: Int) {
        self.collectionView.reloadItems(at: [IndexPath.init(row: index, section: 0)])
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let hlArrayNew = hlArray.map{
            $0.enumerated().map { (index, element) -> Bool in
                if index == 0 {
                    return true
                } else {
                    return element
                }
            }
        }
        
        hlArray = hlArrayNew
        
        self.view.backgroundColor = .systemBackground
        self.titleLabel.text = "Settings"
        self.titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = .label
        self.titleLabel.numberOfLines = 0
        self.view.addSubview(self.titleLabel)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(self.collectionView)
        
        self.closeButton.sizeToFit()
        self.closeButton.addTarget(self, action: #selector(self.tapCloseButton), for: .touchUpInside)
        self.view.addSubview(self.closeButton)
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.titleLabel.sizeToFit()
        self.titleLabel.frame = CGRect.init(x: 27, y: 40, width: self.view.frame.width - 27 * 2, height: self.titleLabel.frame.height)
        self.collectionView.layout(y: self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 24)
        self.closeButton.layout(bottomX: self.view.frame.width - 19, y: 19)
    }
    
    @objc func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SPLarkSettingsController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch collectionView {
        case self.collectionView:
            switch kind {
            
            case UICollectionView.elementKindSectionHeader:
                let header = self.collectionView.dequeueHeader(indexPath: indexPath)
                header.lblTitle.text = "header"
                return header
                
            case UICollectionView.elementKindSectionFooter:
                return UICollectionReusableView()
                
            default:
                assert(false, "Unexpected element kind")
            }
            
            
        default:
            return UICollectionReusableView()
        }
    }
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
        case self.collectionView:
            return self.settingsSecCount()
        default:
            return 0
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return self.settingsCount(sec: section)
        default:
            return 0
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.collectionView:
//            let cell = self.collectionView.dequeueCell(indexPath: indexPath)
//            let highlighted = self.settingHighlighted(index: indexPath)
//            cell.titleLabel.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
//            cell.subtitleLabel.text = self.settingSubtitle(index: indexPath.row, highlighted: highlighted)
//            cell.setHighlighted(
//                highlighted,
//                color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
//            )
//            return cell
            let cell = self.collectionView.dequeueCell(indexPath: indexPath)
            let highlighted = self.settingHighlighted(index: indexPath)
            cell.lblTitle.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
            cell.setHighlighted(
                highlighted,
                color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
            )
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? SPLarkSettingsCollectionViewCell {
//            self.settingDidSelect(index: indexPath) {
//                let highlighted = self.settingHighlighted(index: indexPath)
//                cell.titleLabel.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
//                cell.subtitleLabel.text = self.settingSubtitle(index: indexPath.row, highlighted: highlighted)
//                cell.setHighlighted(
//                    highlighted,
//                    color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
//                )
//            }
//        }
        if let cell = collectionView.cellForItem(at: indexPath) as? SPLarkSettingsImageLabelCell {
            print(cell)
            self.settingDidSelect(index: indexPath) {
                let highlighted = self.settingHighlighted(index: indexPath)
                cell.lblTitle.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
                cell.setHighlighted(
                    highlighted,
                    color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
                )
            }
        }
    }
}
