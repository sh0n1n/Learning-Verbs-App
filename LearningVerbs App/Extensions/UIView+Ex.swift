//
//  UIView+Ex.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/14/23.
//

import UIKit
extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
