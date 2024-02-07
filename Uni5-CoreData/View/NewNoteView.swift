//
//  NewNoteView.swift
//  Uni5-CoreData
//
//  Created by user248205 on 7/2/24.
//

import SwiftUI

struct NewNoteView: View {
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context

    var body: some View {
        VStack {
            Text("Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Selecciona una fecha", selection: $model.date)
            Spacer()
            Button {
                if model.updateItem != nil {
                    model.editData(context: context)
                } else {
                    model.saveData(context: context)
                }
            } label: {
                Label(
                    title: { Text("Guardar nota").foregroundColor(.white) },
                    icon: { Image(systemName: "plus") }
                )
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }
}
