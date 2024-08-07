//
//  Mood.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import Foundation

struct Mood: Identifiable {
    let id = UUID()
    var date: Date
    var mood: String
    var note: String
}
