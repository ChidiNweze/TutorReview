//
//  AddView.swift
//  TutoringReview
//
//  Created by Chidinma Umenwofor-Nweze on 2020-05-10.
//  Copyright © 2020 Chidinma Umenwofor-Nweze. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var student = ""
    @State var comment = ""
    @State var rating = "Silence"
    let ratings = ["Thumbs Up", "Neutral", "Thumbs Down", "Silence"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Student Name", text: $student)
                    TextField("Feedback", text: $comment)
                    
                    Picker("Rating", selection: $rating) {
                        ForEach(ratings, id: \.self) { rating in
                            Text(rating)
                        }
                    }
                }
                
                Button("Add Review") {
                    //adding new review to database
                    let newReview = Review(context: self.moc)
                    newReview.student = self.student
                    newReview.comment = self.comment
                    newReview.rating = self.rating
                    
                    do {
                        try self.moc.save()
                    } catch {
                        print("Could not save new review to database. \(error.localizedDescription)")
                    }
                }
            }.navigationBarTitle("Review Tutor")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
