//
//  SwiftDataWeirdnessApp.swift
//  SwiftDataWeirdness
//
//  Created by Hrishikesh on 13/10/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataWeirdnessApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Book.self])
        let config = ModelConfiguration(schema: schema, url: URL.documentsDirectory.appending(path: "MyBooks.store"))
        do {
            container = try ModelContainer(for: schema,
                                           configurations: config)
        } catch {
            fatalError("Unable to create container")
        }
        print(URL.documentsDirectory.path())
    }
}
