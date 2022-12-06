//
//  ViewModel.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/7/22.
//

import Foundation

class ViewModel: ObservableObject {
  

  // INTENTIONS
    var mytime = Date()
    var format = DateFormatter()
    
  @Published var date: String    // holds a single flashcard object from the deck
    
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
//    
//  var userProfiles = UserRepository()
//  @Published var userRepository: UserRepository
//
//  let userProfiles = userRepository.updateIntentionData(intentions: ["hihihaifdhiashf: testing on december 4th","hihihihih"] )
  
  init(){
    self.quote = deck.drawRandomQuote()
    self.affirmations = affDeck.drawFiveRandomAffirmations()
    self.suggestion = sugDeck.drawRandomSuggestion()
      DateFormatter().dateFormat = "dd-MM-yyyy"
      self.date = format.string(from: mytime)
      print("this is self date")
      print(self.date)
      
    
//    self.userRepository = userProfiles.updateIntentionData(intentions: ["test the function","asdfa"] )
  }
    
  func drawDifferentQuote(){ //A method to update the self.flashcard variable to a different random card.
    self.quote = deck.drawRandomQuote()
  }
  
  
  func drawDifferentAffirmations(){
    self.affirmations = affDeck.drawFiveRandomAffirmations()
  }
    
//    func updateFirebaseIntentionData(intentions:[String]){
//    self.userRepository = userProfiles.updateIntentionData(intentions)
//  }





}
