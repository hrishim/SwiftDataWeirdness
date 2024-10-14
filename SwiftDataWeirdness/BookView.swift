//
//  BookView.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import SwiftUI

struct BookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var showingPageAdd = false
    
    let book: Book
    
    var body: some View {
        List {
            if let pages = book.pages {
                ForEach(pages, id: \.id) { page in
                    Text("\(page.pageType.rawValue) Page \(page.pageNumber)")
                }
            }
        }
    }
}

#Preview {
    let bookPreview = BookPreview(Book.self)
    let books = Book.sampleBooks
    bookPreview.addExamples(books)
    return BookView(book: books[0])
        .modelContainer(bookPreview.container)
}
