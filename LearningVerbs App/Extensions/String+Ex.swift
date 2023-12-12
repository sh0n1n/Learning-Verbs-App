//
//  String+Ex.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/12/23.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
