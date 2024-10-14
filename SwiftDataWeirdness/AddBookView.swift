//
//  AddBookView.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    func saveBook() {
        let newBook = Book(title: title, contentPage: Page(pageType: .contentsPage, content: content, pageNumber: 0))
        context.insert(newBook)
    }
                           
    var body: some View {
        NavigationView {
            Form {
                TextField("Book Title", text: $title)
                TextField("Content Page Content Text", text: $content)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        saveBook()
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                    Spacer()
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Add Book")
            
           
        }
    }
}

#Preview {
    let bookPreview = BookPreview(Book.self)
    let books = Book.sampleBooks
    bookPreview.addExamples(books)
    return NavigationStack {
        AddBookView()
            .modelContainer(bookPreview.container)
    }
}
