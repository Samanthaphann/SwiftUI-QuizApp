//
//  Question Struct.swift
//  quiz
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

//create a struct to store data
struct Question{
    let question: String
    let options: [String]
    let answer: String
    var isRight: Bool? = nil
}
