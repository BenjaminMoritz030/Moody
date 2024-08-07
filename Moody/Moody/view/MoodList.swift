//
//  MoodList.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import SwiftUI

struct MoodList: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.entries) { entry in
                    VStack(alignment: .leading) {
                        Text("\(entry.date)")
                        Text("Stimmung: \(entry.mood)")
                        Text("Notiz: \(entry.note)")
                    }
                }
                Button(action: {
                    viewModel.addMood(mood: "Happy", note: "Ein neuer Eintrag")
                }) {
                    Text("Neuer Eintrag")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Mood Tracker")
        }
    }
}

#Preview {
    MoodList()
}
