//
//  NoteRendererView.swift
//  StickyNote
//
//  Created by Furkan on 5.02.2023.
//

import SwiftUI

struct NoteRendererView: View {
    var text : String
    var isWidget : Bool
    var body: some View {
            Image("note")
                .resizable()
                .scaledToFit()
                .padding()
                .overlay{
                    VStack(alignment: .leading){
                        if isWidget{
                            Text(text)
                                .bold()
                                .font(.subheadline)
                                .lineLimit(6)
                                .multilineTextAlignment(.leading)
                        }else{
                            Text(text)
                                .bold()
                                .font(.title)
                                .lineLimit(6)
                                .multilineTextAlignment(.leading)
                        }
                       
                        HStack{Spacer()}
                        Spacer()
                    }.padding(32)
                }
    }
}


struct NoteRendererView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRendererView(text: """
Example Text
deneme
asd
fsafsd
dfas
fads
fdsa

""",isWidget: false)
    }
}

