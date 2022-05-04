//
//  ReadingView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/04/27.
//

import SwiftUI
import CoreData

struct ReadingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Gift.when, ascending: true)],
        animation: .default)
    private var gifts: FetchedResults<Gift>
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
                List {
                    ForEach(gifts.filter { $0.who!.hasPrefix(searchText) || searchText == "" }) { gift in
                        NavigationLink {
                            GiftDetailView(gift: gift)
                        } label: {
                            GiftRow(gift: gift)
                        }
                    }
                    .onDelete(perform: deleteGifts)
                }
            }
            .navigationTitle("Gifts")
        }
        .navigationViewStyle(.stack)
        .onTapGesture { hideKeyboard() }
    }
    
    private func deleteGifts(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                gifts[$0]
            }
            .forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
