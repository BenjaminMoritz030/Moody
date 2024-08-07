//
//  ViewModel.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var entries: [Mood] = []
    
    func addMood(mood: String, note: String) {
        let newEntry = Mood(date: Date(), mood: mood, note: note)
        entries.append(newEntry)
    }
}
