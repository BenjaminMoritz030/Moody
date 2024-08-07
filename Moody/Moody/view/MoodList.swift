//
//  MoodList.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import SwiftUI

struct MoodList: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showingMoodSheet = false
    @State private var selectedMood: String? = nil
    @State private var note: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.entries) { entry in
                    VStack(alignment: .leading) {
                        Text("\(formattedDate(from: entry.date))")
                            .font(.headline)
                        Text("Stimmung: \(entry.mood)")
                        Text("Notiz: \(entry.note)")
                    }
                }
                .listStyle(PlainListStyle())
                
                Button(action: {
                    showingMoodSheet = true
                }) {
                    Text("Neuer Eintrag")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showingMoodSheet) {
                    MoodSheetView(selectedMood: $selectedMood, showingMoodSheet: $showingMoodSheet, note: $note, viewModel: viewModel)
                }
                .padding()
            }
            .navigationTitle("Mood Tracker")
        }
    }
    
    private func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    MoodList()
}
