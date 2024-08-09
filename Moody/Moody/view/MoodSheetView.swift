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
        ZStack {
            VStack {
                Text("Wähle deine Stimmung aus:")
                    .font(.headline)
                    .padding()
                
                Divider()
                
                ForEach(moods, id: \.self) { mood in
                    HStack {
                        Toggle(isOn: Binding(
                            get: { selectedMood == mood },
                            set: { isSelected in
                                selectedMood = isSelected ? mood : nil
                            }
                        )) {
                            Text(mood)
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                
                TextField("Notiz hinzufügen", text: $note)
                    .padding()
                
                Button(action: {
                    withAnimation(.bouncy(duration: 10)) {
                        if let selectedMood = selectedMood {
                            viewModel.addMood(mood: selectedMood, note: note)
                        }
                        selectedMood = nil
                        showingMoodSheet = false
                    }
                    
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
                    showingMoodSheet = false // Close the sheet when "Abbrechen" is clicked
                }) {
                    Text("Abbrechen")
                        .padding()
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

struct MoodSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MoodSheetView(selectedMood: .constant(nil), showingMoodSheet: .constant(false), note: .constant(""), viewModel: ViewModel())
    }
}
