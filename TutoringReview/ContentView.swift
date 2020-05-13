//
//  ContentView.swift
//  TutoringReview
//
//  Created by Chidinma Umenwofor-Nweze on 2020-05-08.
//  Copyright © 2020 Chidinma Umenwofor-Nweze. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Review.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Review.student, ascending: true)
    ])  var reviews: FetchedResults<Review>
    @State private var showingAddReview = false
    
//    let reviews = [
//        Review(student: "John Doe", comment: "Moved through content a little too fast, but then was very helpful and clear when it came to my specific questions.", rating: "Neutral"), Review(student: "Jane Doe", comment: "Loved all the study tips! Jumbling up the order of math exercises was daunting a first but paid off when the test came around.", rating: "Thumbs Up"), Review(student: "George Washington", comment: "Explanation style was a bit unprofessional in my opinion.", rating: "Thumbs Down")
//    ]
    
    var body: some View {
        NavigationView {
            List {
                /*each review needs a unique identifier. Instead of making the Review struct conform to the identifiable protocol, I decided that each student can only review me once. Therefore, each student is a unique identifier*/
                ForEach(reviews, id: \.student) { review in
                    NavigationLink(destination: Text(review.comment)) {
                        //implicit HStack
                        EmojiView(for: review.rating)
                        Text(review.student)
                    }
                }
            }.navigationBarTitle("Student Reviews")
             .navigationBarItems(trailing: Button("Add") {
                self.showingAddReview.toggle()
            })
            //A sheet is a screen appearing over the current screen. Similar to modal view controller.
            .sheet(isPresented: $showingAddReview) {
                    //as soon as showingAddReview is true, this will be shown.
                AddView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
