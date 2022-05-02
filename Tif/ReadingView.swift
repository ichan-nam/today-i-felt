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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gifts) { gift in
                    NavigationLink {
                        Text(gift.what!)
                    } label: {
                        GiftRow(gift: gift)
                    }
                }
                .onDelete(perform: deleteGifts)
            }
            .navigationTitle("Gifts")
        }
        .navigationViewStyle(.stack)
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
