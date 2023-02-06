//
//  StickyNoteWidget.swift
//  StickyNoteWidget
//
//  Created by Furkan on 5.02.2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("note",store: UserDefaults(suiteName: "group.furkancosgun.StickyNote"))  var noteData : String = ""
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),note: "EXAMPLE NOTE")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),note: noteData)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), note: noteData)
        let timeLine = Timeline(entries: [entry], policy: .never)
        completion(timeLine)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let note : String
}

struct StickyNoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        NoteRendererView(text: entry.note,isWidget: true)
    }
}

struct StickyNoteWidget: Widget {
    let kind: String = "StickyNoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StickyNoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Fucking Widgets")
        .description("And Like Shit Examples!")
    }
}

struct StickyNoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        StickyNoteWidgetEntryView(entry: SimpleEntry(date: Date(),note: "My Fucking Note!"))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
