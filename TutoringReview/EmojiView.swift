//
//  EmojiView.swift
//  TutoringReview
//
//  Created by Chidinma Umenwofor-Nweze on 2020-05-09.
//  Copyright © 2020 Chidinma Umenwofor-Nweze. All rights reserved.
//

import SwiftUI

struct EmojiView: View {
    var rating: String
    
    var body: some View {
        switch rating {
            case "Thumbs Up":
                return Text("👍")
            case "Thumbs Down":
                return Text("👎")
            case "Neutral":
                return Text("😐")
            default:
                return Text("😴")
        }
    }
    //making a better looking initializer
    init(for rating: String) {
        self.rating = rating
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(for: "Thumbs Up")
    }
}
