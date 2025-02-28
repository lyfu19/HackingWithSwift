//
//  AddBookView.swift
//  Bookworm
//
//  Created by 阿福 on 28/02/2025.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    @State private var showingAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save", action: saveBook)
                }
            }
            
            .navigationTitle("Add Book")
            .alert("Warning", isPresented: $showingAlert) {} message: {
                Text("Please fill Book's Detail")
            }

        }
    }
    
    func saveBook() {
        if title.isEmpty || author.isEmpty || review.isEmpty {
            showingAlert = true
            return
        }
        
        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
        modelContext.insert(newBook)
        dismiss()
    }
}

#Preview {
    NavigationView {
        AddBookView()
    }
}
