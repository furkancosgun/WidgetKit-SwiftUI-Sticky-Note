//
//  ContentView.swift
//  StickyNote
//
//  Created by Furkan on 5.02.2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage("note",store: UserDefaults(suiteName: "group.furkancosgun.StickyNote")) private var note : String = ""
    @State private var isChanging = false
    @State private var text = ""
    @State private var isShowingAlert = false
    
    var body: some View {
        VStack {
            Text("My Stick Note")
                .bold()
                .font(.largeTitle)
            Spacer()
            if isChanging{
                NoteChangerView(text: $text)
            }else{
                NoteRendererView(text: note,isWidget:false)
            }
            
            Spacer()
            HStack{
                Button{
                    isChanging.toggle()
                }label: {
                    Text("NEW NOTE")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Button{
                    saveMyNote2DB(nt: text)
                    isShowingAlert.toggle()
                }label: {
                    Text("SAVE")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                }
                .alert(isPresented: $isShowingAlert) {
                            Alert(title: Text("Succesfull"),message: Text("Your Note Was Saved!"))
                        }
                
            }.padding()
        }.padding()
    }

    func saveMyNote2DB(nt:String){
        note = nt
        WidgetCenter.shared.reloadAllTimelines()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
