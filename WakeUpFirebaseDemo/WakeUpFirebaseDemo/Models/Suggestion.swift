//
//  Suggestion.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import Foundation

struct Suggestion {
  var text: String
  init(text: String) {
    self.text = "" } }



class SuggestionDeck {
  var suggestions = [Suggestion]()
  
  init() {
    let suggestionData = [
      "Go for a 15-minute walk",
      "Buy yourself flowers",
      "Call a friend",
      "Stargaze",
      "5-minute meditation",
      "Watch the sunrise",
      "Remind yourself you're loved",
      "Compliment yourself",
      "Ask for help",
      "Drink 8 glasses of water a day",
      "Write in a journal",
      "Take a walk",
      "Read a chapter in your book",
      "Watch the sunset",
      "Watch a feel-good movie",
      "Free space",
      "Treat yourself to a coffee or tea",
      "Buy yourself flowers",
      "Exercise",
      "Cook your favorite meal",
      "Organize your space",
      "Go to bed early",
      "Call a loved one",
      "Take 10 deep breaths",
      "Make your bed",
      "Spend time in nature",
      "Set a small goal",
      "Dance to your favorite playlist",
      "Meditate for 5-10 minutes",
      "Cook healthy recipes at home",
      "Clean areas around the house",
      "Walk around the neighborhood",
      "Participating in virtual bodyweight fitness classes",
      "Go to bed 30 minutes earlier than usual",
      "Listen to a podcast",
      "Drinking a glass of warm lemon water in the morning",
      "Standing and stretching throughout the day",
      "Read a nutrition/fitness/mindfulness article",
      "Participate in a 5K run",
      "Turn meetings into walking meetings",
      "Put some scooters in the office",
      "Create an in-office gym",
      "Offer support for alcohol and substance abuse",
      "Build a nap room",
      "Laugh together at a comedy show"
    ]
    

    for txt in suggestionData{
      var sugg = Suggestion(text: txt)
      sugg.text = txt
      suggestions.append(sugg)
    }
    
  }
  
  func drawRandomSuggestion() -> Suggestion {
    return suggestions[Int(arc4random_uniform(UInt32(suggestions.count)))]
  }
  
}



