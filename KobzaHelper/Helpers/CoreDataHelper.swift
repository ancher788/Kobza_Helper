//
//  CoreDataHelper.swift
//  KobzaHelper
//
//  Created by Anatolii Chernetskyi on 21.12.2023.
//

import Foundation
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()

    private let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "db")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    func getWords() -> [Word] {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Fetch failed")
            return []
        }
    }

    func addWord(_ word: String, withRating rating: Int) {
        let context = persistentContainer.viewContext
        let newWord = Word(context: context)
        newWord.letters = [Letter]()
        newWord.rating = Int64(rating)
        saveContext()
    }

    func removeWord(at index: Int) {
        let words = getWords()
        guard index >= 0, index < words.count else {
            return
        }

        let context = persistentContainer.viewContext
        context.delete(words[index])
        saveContext()
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

