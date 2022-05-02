//
//  WritingView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/04/27.
//

import SwiftUI
import CoreData

struct WritingView: View {
    enum Field: Hashable {
        case who
        case what
        case place
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var who: String = ""
    @State private var what: String = ""
    @State private var when = Date()
    @State private var place: String = ""
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                VStack(alignment: .leading) {
                    WritingInputView(placeholder: "그 사람", binding: $who, placeholderFont: .title, following: "의", followingFont: .title2)
                        .focused($focusedField, equals: .who)
                    WritingInputView(placeholder: "이런 장점", binding: $what, placeholderFont: .title, following: "이", followingFont: .title2)
                        .focused($focusedField, equals: .what)
                    Text("인상 깊었습니다.")
                        .font(.title2)
                }
                .padding()
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                .background(Color("YellowSun10"))
                .cornerRadius(16)
                
                VStack(alignment: .trailing) {
                    DatePicker(
                            "언제",
                            selection: $when,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    WritingInputView(placeholder: "그 장소", binding: $place, placeholderFont: .title2, following: "에서", followingFont: .body)
                        .focused($focusedField, equals: .place)
                    Text("얻은 깨달음")
                }
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .trailing)
                
                Spacer()
            }
            .navigationTitle("Today I felt ...")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장") {
                        if who.isEmpty {
                            focusedField = .who
                        } else if what.isEmpty {
                            focusedField = .what
                        } else if place.isEmpty {
                            focusedField = .place
                        } else {
                            addGift()
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        }
        .navigationViewStyle(.stack)
    }
    
    private func addGift() {
        withAnimation {
            let newGift = Gift(context: viewContext)
            newGift.who = who
            newGift.what = what
            newGift.when = when
            newGift.place = place

            do {
                try viewContext.save()
                
                who = ""
                what = ""
                when = Date()
                place = ""
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
