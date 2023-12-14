//
//  Verb.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/15/23.
//

import Foundation

struct Verb {
    let infinitive: String
    let pastSimple: String
    let participle: String
    
    var translate: String {
        infinitive.localized
    }
}
