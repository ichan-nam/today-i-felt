//
//  EditingSheetView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/05/04.
//

import SwiftUI

struct EditingSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    var gift: Gift
    
    @State private var who: String = ""
    @State private var what: String = ""
    @State private var when = Date()
    @State private var place: String = ""
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 64) {
            HStack(spacing: 24) {
                Spacer()
                Button("취소") {
                    dismiss()
                }
                .foregroundColor(.secondary)
                Button("저장") {
                    dismiss()
                    updateGift(gift: gift)
                }
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Who")
                            .frame(width: 96, alignment: .leading)
                            .foregroundColor(.secondary)
                        TextField("", text: $who)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("What")
                            .frame(width: 96, alignment: .leading)
                            .foregroundColor(.secondary)
                        VStack {
                            TextEditor(text: $what)
                                .frame(height: 200)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("When")
                            .frame(width: 96, alignment: .leading)
                            .foregroundColor(.secondary)
                        DatePicker(
                                "언제",
                                selection: $when,
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Where")
                            .frame(width: 96, alignment: .leading)
                            .foregroundColor(.secondary)
                        TextField("", text: $place)
                    }
                    
                    Spacer()
                }
            }
            .onTapGesture { hideKeyboard() }
        }
        .padding()
        .onAppear() {
            who = gift.who!
            what = gift.what!
            when = gift.when!
            place = gift.place!
        }
    }
    
    private func updateGift(gift: Gift) {
        gift.who = who
        gift.what = what
        gift.when = when
        gift.place = place
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

/*
struct EditSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EditingSheetView()
    }
}
 */
