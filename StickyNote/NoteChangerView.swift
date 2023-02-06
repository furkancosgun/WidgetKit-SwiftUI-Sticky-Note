//
//  NoteChangerView.swift
//  StickyNote
//
//  Created by Furkan on 5.02.2023.
//

import SwiftUI

struct NoteChangerView: View {
    @Binding var text : String
    var body: some View {
        ZStack{
            TextEditor(text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .scrollContentBackground(.hidden)
                .frame(height:  UIScreen.main.bounds.height / 3)
                .bold()
                .font(.title2)
                .padding()
        }
        .background{
            Image("note")
                .resizable()
                .scaledToFit()
        }
        .padding()
       
    }
}


struct NoteChangerView_Previews: PreviewProvider {
    static var previews: some View {
        NoteChangerView(text:.constant("texts"))
    }
}

