//
//  BookSamples.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import Foundation

extension Book {
    
    static var sampleBooks: [Book] {
        let pages: [Page] = [
            Page(pageType: .blankPage, content:"", pageNumber: 1),
            Page(pageType: .picturePage, content:"", pageNumber: 2),
            Page(pageType: .textPage, content:"", pageNumber: 3),
            Page(pageType: .textPage, content:"", pageNumber: 4),
        ]
        
        var aBook = Book(title: "Do You Know SwiftData?", contentPage: Page(pageType: .contentsPage, content:"Something", pageNumber: 0))
        pages.forEach { page in
            page.book = aBook
        }
        aBook.pages = pages
        return [aBook]
    }
}
