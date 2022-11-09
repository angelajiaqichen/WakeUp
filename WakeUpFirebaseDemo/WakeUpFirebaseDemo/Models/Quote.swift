//
//  Quote.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import Foundation


struct Quote {
  var text: String
  init(text: String) {
    self.text = "" } }



class QuoteDeck {
  var quotes = [Quote]()
  
  init() {
    let quoteData = [
      "Whatever you are, be a good one.",
      "Be yourself - everyone else is already taken.",
      "Act as if what you do makes a difference. It does.",
      "The only real mistake is the one from which we learn nothing.",
      "Positive anything is better than negative nothing.",
      "Creativity is intelligence having fun."
    ]
    

    for txt in quoteData{
      var q = Quote(text: txt)
      q.text = txt
      quotes.append(q)
    }
    
  }
  
  func drawRandomQuote() -> Quote {
    return quotes[Int(arc4random_uniform(UInt32(quotes.count)))]
  }
  
}


