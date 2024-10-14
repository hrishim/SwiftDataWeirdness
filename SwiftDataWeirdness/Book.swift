//
//  Book.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var id = UUID()
    var title: String
    var contentPage: Page
    var pages: [Page]?
    
    init(id: UUID = UUID(), title:String, contentPage: Page) {
        self.id = id
        self.title = title
        self.contentPage = contentPage
        contentPage.book = self
    }
    
    func addPage(page: Page) {
        if pages == nil {
            pages = []
        }
        page.book = self
        pages?.append(page)
    }
}
