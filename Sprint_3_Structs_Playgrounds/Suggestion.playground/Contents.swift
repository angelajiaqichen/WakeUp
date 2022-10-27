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
      "Call a friend"
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

