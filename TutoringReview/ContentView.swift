//
//  ContentView.swift
//  TutoringReview
//
//  Created by Chidinma Umenwofor-Nweze on 2020-05-08.
//  Copyright © 2020 Chidinma Umenwofor-Nweze. All rights reserved.
//

import SwiftUI

struct Review {
    var student: String
    var comment: String
    var rating: String
}

struct ContentView: View {
    
    let reviews = [
        Review(student: "John Doe", comment: "Moved through content a little too fast, but then was very helpful and clear when it came to my specific questions.", rating: "Neutral"), Review(student: "Jane Doe", comment: "Loved all the study tips! Jumbling up the order of math exercises was daunting a first but paid off when the test came around.", rating: "Thumbs Up"), Review(student: "George Washington", comment: "Explanation style was a bit unprofessional in my opinion.", rating: "Thumbs Down")
    ]
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
