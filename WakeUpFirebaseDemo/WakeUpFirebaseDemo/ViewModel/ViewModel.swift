//
//  ViewModel.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/7/22.
//

import Foundation

class ViewModel: ObservableObject {
  
  // QUOTES
  let deck = QuoteDeck()        // create an instance of `Deck`
  @Published var quote: Quote    // holds a single flashcard object from the deck
  
  // WEATHER
  @Published var weatherType: String = ""
  @Published var weatherTemp: Double = 0.0 

  //AFFIRMATIONS
  let affDeck = AffirmationDeck()
  @Published var affirmations: [Affirmation]
  
  //SUGGESTION
  let sugDeck = SuggestionDeck()
  @Published var suggestion: Suggestion
 
  //REMINDERS
  @Published var reminders: [Reminder]
  
  init(){
    self.quote = deck.drawRandomQuote()
    self.affirmations = affDeck.drawFiveRandomAffirmations()
    self.suggestion = sugDeck.drawRandomSuggestion()
    self.reminders = []
  }
  
  
  func drawDifferentQuote(){ //A method to update the self.flashcard variable to a different random card.
    self.quote = deck.drawRandomQuote()
  }
  
  
  func drawDifferentAffirmations(){
    self.affirmations = affDeck.drawFiveRandomAffirmations()
  }
  



}
