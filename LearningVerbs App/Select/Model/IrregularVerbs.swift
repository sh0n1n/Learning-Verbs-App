//
//  IrregularVerbs.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/15/23.
//

import Foundation

class IrregularVerbs {
    private(set) var verbs: [Verb] = []
    var selectedVerbs: [Verb] = []
    
    func configureVerbs() {
        verbs = [
                Verb(infinitive: "abide", pastSimple: "abode", participle: "abode"),
                Verb(infinitive: "arise", pastSimple: "arose", participle: "arisen"),
                Verb(infinitive: "awaken", pastSimple: "awoke", participle: "awoken"),
                Verb(infinitive: "be", pastSimple: "was/were", participle: "been"),
                Verb(infinitive: "bear", pastSimple: "bore", participle: "borne"),
                Verb(infinitive: "beat", pastSimple: "beat", participle: "beaten"),
                Verb(infinitive: "become", pastSimple: "became", participle: "become"),
                Verb(infinitive: "begin", pastSimple: "began", participle: "begun"),
                Verb(infinitive: "behold", pastSimple: "beheld", participle: "beheld"),
                Verb(infinitive: "bend", pastSimple: "bent", participle: "bent"),
                Verb(infinitive: "bet", pastSimple: "bet", participle: "bet"),
                Verb(infinitive: "bid", pastSimple: "bade", participle: "bidden"),
                Verb(infinitive: "bind", pastSimple: "bound", participle: "bound"),
                Verb(infinitive: "bite", pastSimple: "bit", participle: "bitten"),
                Verb(infinitive: "bleed", pastSimple: "bled", participle: "bled"),
                Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
                Verb(infinitive: "break", pastSimple: "broke", participle: "broken"),
                Verb(infinitive: "breed", pastSimple: "bred", participle: "bred"),
                Verb(infinitive: "bring", pastSimple: "brought", participle: "brought"),
                Verb(infinitive: "broadcast", pastSimple: "broadcast", participle: "broadcast"),
                Verb(infinitive: "build", pastSimple: "built", participle: "built"),
                Verb(infinitive: "burn", pastSimple: "burnt/burned", participle: "burnt/burned"),
                Verb(infinitive: "burst", pastSimple: "burst", participle: "burst"),
                Verb(infinitive: "buy", pastSimple: "bought", participle: "bought"),
                Verb(infinitive: "can", pastSimple: "could", participle: "could"),
                Verb(infinitive: "catch", pastSimple: "caught", participle: "caught"),
                Verb(infinitive: "choose", pastSimple: "chose", participle: "chosen"),
                Verb(infinitive: "come", pastSimple: "came", participle: "come"),
                Verb(infinitive: "cost", pastSimple: "cost", participle: "cost"),
                Verb(infinitive: "cut", pastSimple: "cut", participle: "cut"),
                Verb(infinitive: "deal", pastSimple: "dealt", participle: "dealt"),
                Verb(infinitive: "decide", pastSimple: "decided", participle: "decided"),
                Verb(infinitive: "do", pastSimple: "did", participle: "done"),
                Verb(infinitive: "draw", pastSimple: "drew", participle: "drawn"),
                Verb(infinitive: "dream", pastSimple: "dreamt/dreamed", participle: "dreamt/dreamed"),
                Verb(infinitive: "drink", pastSimple: "drank", participle: "drunk"),
                Verb(infinitive: "drive", pastSimple: "drove", participle: "driven"),
                Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
                Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
                Verb(infinitive: "feed", pastSimple: "fed", participle: "fed"),
                Verb(infinitive: "feel", pastSimple: "felt", participle: "felt"),
                Verb(infinitive: "fight", pastSimple: "fought", participle: "fought"),
                Verb(infinitive: "find", pastSimple: "found", participle: "found"),
                Verb(infinitive: "fit", pastSimple: "fit/fitted", participle: "fit/fitted"),
                Verb(infinitive: "fly", pastSimple: "flew", participle: "flown"),
                Verb(infinitive: "forget", pastSimple: "forgot", participle: "forgotten"),
                Verb(infinitive: "forgive", pastSimple: "forgave", participle: "forgiven"),
                Verb(infinitive: "freeze", pastSimple: "froze", participle: "frozen"),
                Verb(infinitive: "get", pastSimple: "got", participle: "got/gotten"),
                Verb(infinitive: "give", pastSimple: "gave", participle: "given")
        ]
    }
}
