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
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("logo-8keit")
                    
                    List(viewModel.entries) { entry in
                        HStack {
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("\(formattedDate(from: entry.date))")
                                        .font(.headline)
                                    Text("Stimmung: \(entry.mood)")
                                    Text("Notiz: \(entry.note)")
                                }
                                .padding()
                                .background(Color.cyan)
                                .cornerRadius(8)
                            }
                            
                            Spacer()
                        }
                        .listRowBackground(Color.clear) // delete bg
                    }
                    .listStyle(PlainListStyle())
                    
                    Button(action: {
                        showingMoodSheet = true
                    }) {
                        Text("Neuer Eintrag")
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $showingMoodSheet) {
                        MoodSheetView(selectedMood: $selectedMood, showingMoodSheet: $showingMoodSheet, note: $note, viewModel: viewModel)
                    }
                    .padding()
                }
            }
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
