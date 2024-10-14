//
//  Pages.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import Foundation
import SwiftData

enum PageType: String, Codable {
    case contentsPage = "Contents"
    case picturePage = "Picture"
    case textPage = "Text"
    case blankPage = "Blank"
}

@Model
class Page {
    var id = UUID()
    var pageType: PageType
    var pageNumber: Int
    var content: String
    var book: Book?
    
    init(id: UUID = UUID(), pageType: PageType, content: String, pageNumber: Int) {
        self.id = id
        self.pageType = pageType
        self.pageNumber = pageNumber
        self.content = content
    }
}
