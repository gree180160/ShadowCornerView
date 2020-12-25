//
//  AnyCell.swift
//  CornerShadowView
//
//  Created by WillowRivers on 2020/12/25.
//

import UIKit

class AnyCell: UITableViewCell {

    var labsContainer: UIView!
    var nameLab: UILabel!
    var phoneLab: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
    }
    
    class func cellHeight() -> CGFloat {
        return 100.0
    }
    
    class func cellReuseIdentifier() -> String {
        return AnyCell.classForCoder().description()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        self.backgroundColor = .white
        labsContainer = UIView(frame: CGRect(x: 12, y: 10, width: self.frame.width - 12*CGFloat(2), height: 100 - CGFloat(2)*10))
        labsContainer.backgroundColor = .white
        self.addSubview(labsContainer)
        
        nameLab = UILabel(frame: CGRect(x: 12, y: 10, width: labsContainer.frame.width - 24, height: 20))
        nameLab.textColor = UIColor.black
        labsContainer.addSubview(nameLab)
        
        phoneLab = UILabel(frame: CGRect(x: 12, y: 40, width: labsContainer.frame.width - 24, height: 20))
        phoneLab.textColor = UIColor.black
        labsContainer.addSubview(phoneLab)
        
    }
    
    func updateContent(model: Any?) {
        //经过计算需要 labsContainer 的高度产生了变化
        labsContainer.frame = CGRect(x: 12, y: 20, width: self.frame.width - 12*CGFloat(2), height: 100 - CGFloat(2)*20)
        labsContainer.layoutIfNeeded()
        labsContainer.setCornerAndShadow(cornerRadius: 6.0, shadowOpacity: 0.1, shadowRadius: 9.0, shadowColor: UIColor.black.cgColor, offset: CGSize(width: 0, height: 0))
        nameLab.text = "姓名： 鲁迅"
        phoneLab.text = "电话：12345678019"
    }
    
}
