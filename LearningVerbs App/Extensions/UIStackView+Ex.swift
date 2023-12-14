//
//  UIStackView+Ex.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/14/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
