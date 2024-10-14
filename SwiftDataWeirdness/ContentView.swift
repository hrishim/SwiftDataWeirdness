//
//  ContentView.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.title) private var myBooks: [Book]
    @State private var showBookAdd = false
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let bookToDelete = myBooks[index]
            context.delete(bookToDelete)
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if myBooks.isEmpty {
                    ContentUnavailableView("Enter your first book", systemImage: "books.vertical.fill")
                        .scrollContentBackground(.hidden)
                    
                } else {
                    List {
                        ForEach(myBooks, id: \.id) { book in
                            NavigationLink(destination: BookView(book: book)) {
                                Text("\(book.title)")
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showBookAdd.toggle() }) {
                        Label("Add Account", systemImage: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showBookAdd) {
                AddBookView()
            }
            
        }
    }
}

#Preview {
    let bookPreview = BookPreview(Book.self)
    let books = Book.sampleBooks
    bookPreview.addExamples(books)
    return ContentView()
            .modelContainer(bookPreview.container)
    
}
