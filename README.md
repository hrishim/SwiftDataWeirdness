# SwiftData Issue Overview

This code illustrates an issue I encountered while using SwiftData. Although I am not an expert, I believe my usage of SwiftData is correct. 

## Summary of the Issue

When a SwiftData `@Model` has a one-to-many relationship with another `@Model`, and there are multiple class variables involved, SwiftData seems to struggle with associating each variable with its corresponding data.

### Example Code

The following code defines two SwiftData models: `Book` and `Page`. In the `Book` class, there is a property `contentPage` of type `Page`, and an optional array `pages` that holds multiple `Page` instances.

```swift
@Model
class Book {
    var id = UUID()
    var title: String
    var contentPage: Page
    var pages: [Page]?
    
    init(id: UUID = UUID(), title: String, contentPage: Page) {
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
```


## Observed Behavior
With the code above, I created a Book instance and populated all fields except for the pages, which was left as nil. However, when I attempt to iterate over the pages, I receive the contentPage instead. This indicates that there may be an issue with how SwiftData handles these associations.
