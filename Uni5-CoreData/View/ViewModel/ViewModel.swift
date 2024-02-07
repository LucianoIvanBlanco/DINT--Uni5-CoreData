//
//  ViewModel.swift
//  Uni5-CoreData
//
//  Created by user248205 on 15/2/24.
//

import SwiftUI
import CoreData


    class ViewModel: ObservableObject {
        @Published var note = ""
        @Published var date = Date()
        @Published var show = false
        @Published var updateItem: Notes!
        @Environment(\.managedObjectContext) var context
        
    
        func saveData(context: NSManagedObjectContext){
            let newNote = Notes(context: context)
            newNote.note = note
            newNote.date = date

            do {
                try context.save()
                print("Elemento guardado correctamente")
                show.toggle()
            } catch let error as NSError {
                print("Error al guardar: ", error.localizedDescription)
            }
        }
        
        func deleteData(item: Notes, context: NSManagedObjectContext){
            context.delete(item)
            do {
                try context.save()
                print("Elemento eliminado correctamente")
            } catch let error as NSError {
                print("Error al eliminar: ", error.localizedDescription)
            }
        }
        
        func sendData(item: Notes){
            updateItem = item
            note = item.note ?? ""
            date = item.date ?? Date()
            show.toggle()
        }
        
        func editData(context: NSManagedObjectContext){
            updateItem.note = note
            updateItem.date = date

            do {
                try context.save()
                print("Elemento editado correctamente")
                show.toggle()
            } catch let error as NSError {
                print("Error al editar: ", error.localizedDescription)
            }
        }



        
    }

