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
      "Creativity is intelligence having fun.",
      "Things work out best for those who make the best of how things work out.",
      "To live a creative life, we must lose our fear of being wrong.",
      "If you are not willing to risk the usual you will have to settle for the ordinary.",
      "All our dreams can come true if we have the courage to pursue them.",
      "Good things come to people who wait, but better things come to those who go out and get them.",
      "All progress takes place outside the comfort zone.",
      "Success is liking yourself, liking what you do, and liking how you do it.",
      "Motivation is what gets you started. Habit is what keeps you going.",
      "You may have to fight a battle more than once to win it.",
      "Don't let what you cannot do interfere with what you can do.",
      "As we look ahead into the next century, leaders will be those who empower others.",
      "Don't let the fear of losing be greater than the excitement of winning.",
      "You must expect great things of yourself before you can do them.",
      "To accomplish great things, we must not only act, but also dream, not only plan, but also believe.",
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


