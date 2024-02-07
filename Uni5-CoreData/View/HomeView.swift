//
//  HomeView.swift
//  Uni5-CoreData
//
//  Created by user248205 on 7/2/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @ObservedObject var model = ViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)], animation: .smooth) var notes: FetchedResults<Notes>

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { item in
                    VStack(alignment: .leading) {
                        Text(item.note ?? "Nota vacía")
                            .font(.title2)
                            .lineLimit(2)
                        Text(item.date ?? Date(), style: .date)
                            .font(.subheadline)
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            model.deleteData(item: item, context: context)
                        }, label: {
                            Label(title: {
                                Text("Eliminar")
                            }, icon: {
                                Image(systemName: "trash")
                            })
                        })
                        Button(action: {
                            model.sendData(item: item)
                        }, label: {
                            Label(title: {
                                Text("Editar")
                            }, icon: {
                                Image(systemName: "pencil")
                            })
                        })
                    }))
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        model.show.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .sheet(isPresented: $model.show, content: {
                        NewNoteView(model: model)
                    })
                }
            }
            .navigationTitle("Notas")
        }
    }
}
    


