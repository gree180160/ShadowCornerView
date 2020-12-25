//
//  UIView+Extension.swift
//  CornerShadowView
//
//  Created by WillowRivers on 2020/12/25.
//

import UIKit

extension UIView {
    /// 圆角加阴影shadow, 在当前view 和他的superView 之间插入一个带有阴影边框效果的view,
    /// - Parameters:
    ///   - cornerRadius: 圆角弧度
    ///   - shadowOpacity: 阴影颜色透明度
    ///   - shadowRadius: 阴影effect
    ///   - shadowColor: 阴影颜色
    ///   - offset:阴影偏移量
    func setCornerAndShadow(cornerRadius: CGFloat, shadowOpacity: Float, shadowRadius: CGFloat, shadowColor: CGColor, offset:CGSize) {
        guard let superV: UIView = self.superview else { return }
        if superV.tag == 2012241807 { //shadow view has added
            superV.layer.frame = superV.frame
            superV.layer.cornerRadius = cornerRadius
            superV.layer.masksToBounds = false
            superV.layer.shadowOffset = offset
            superV.layer.shadowRadius = shadowRadius
            superV.layer.shadowColor = shadowColor
            superV.layer.shadowOpacity = shadowOpacity
            self.frame = superV.bounds
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }else {  //add a shadow view
            let shadowView = UIView(frame: self.frame)
            shadowView.tag = 2012241807
            superV.addSubview(shadowView)
            shadowView.layer.frame = shadowView.frame
            shadowView.layer.cornerRadius = cornerRadius
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowOffset = offset
            shadowView.layer.shadowRadius = shadowRadius
            shadowView.layer.shadowColor = shadowColor
            shadowView.layer.shadowOpacity = shadowOpacity
            self.frame = shadowView.bounds
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
            shadowView.addSubview(self)
        }
    }
}
