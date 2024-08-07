//
//  MoodSheetView.swift
//  Moody
//
//  Created by Benjamin Moritz on 07.08.24.
//

import SwiftUI

struct MoodSheetView: View {
    @Binding var selectedMood: String?
    @Binding var showingMoodSheet: Bool
    @Binding var note: String
    @ObservedObject var viewModel: ViewModel
    
    let moods = ["😄 Sehr gut", "😊 Gut", "😐 Neutral", "😕 Schlecht", "😢 Sehr schlecht"]
    
    var body: some View {
        VStack {
            Text("Wähle deine Stimmung aus:")
                .font(.headline)
                .padding()
            
            Divider()
            
            ForEach(moods, id: \.self) { mood in
                Button(action: {
                    selectedMood = mood
                }) {
                    Text(mood)
                        .padding()
                        .background(selectedMood == mood ? .green : .gray)
                }
                .foregroundColor(.black)
            }
            
            Divider()
            
            TextField("Notiz hinzufügen", text: $note)
                .padding()
            
            Button(action: {
                if let selectedMood = selectedMood {
                    viewModel.addMood(mood: selectedMood, note: note)
                }
                selectedMood = nil
                showingMoodSheet = false
            }) {
                Text("Speichern")
                    .padding()
                    .foregroundColor(.white)
                    .background(selectedMood != nil ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .disabled(selectedMood == nil)
            
            Button(action: {
                selectedMood = nil
            }) {
                Text("Abbrechen")
                    .padding()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct MoodSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MoodSheetView(selectedMood: .constant(nil), showingMoodSheet: .constant(false), note: .constant(""), viewModel: ViewModel())
    }
}
