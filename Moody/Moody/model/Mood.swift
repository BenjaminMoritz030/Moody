//
//  Mood.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import Foundation

struct Mood: Identifiable {
    let id = UUID()
    let date: Date
    let mood: String
    let note: String
}

