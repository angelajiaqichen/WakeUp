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
    

  //  let userToday: User
    

//    
//  var userProfiles = UserRepository()
//  @Published var userRepository: UserRepository
//
//  let userProfiles = userRepository.updateIntentionData(intentions: ["hihihaifdhiashf: testing on december 4th","hihihihih"] )

    
  var scale : CGFloat = 1.0

  //let music = MusicPlayer()
  //@Published var music:
 

  //REMINDERS (TASKS)
  @Published var reminders: [Reminder]
  
  //EVENTS
  @Published var events: [Event]

  
  init(){
    self.quote = deck.drawRandomQuote()
    self.affirmations = affDeck.drawFiveRandomAffirmations()
    self.suggestion = sugDeck.drawRandomSuggestion()
    self.reminders = []
    self.events = []


      DateFormatter().dateFormat = "dd-MM-yyyy"
      self.date = format.string(from: mytime)
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
