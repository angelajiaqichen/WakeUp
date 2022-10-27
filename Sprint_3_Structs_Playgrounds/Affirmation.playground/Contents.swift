import Foundation

struct Affirmation {
  var text: String
  init(text: String) {
    self.text = "" } }



class AffirmationDeck {
  var affirmations = [Affirmation]()
  
  init() {
    let affirmationData = [
      "Go for a 15-minute walk",
      "Buy yourself flowers",
      "Call a friend"
    ]
    

    for txt in affirmationData{
      var aff = Affirmation(text: txt)
      aff.text = txt
      affirmations.append(aff)
    }
    
  }
  
  func drawFiveRandomAffirmations() -> Affirmation {
    var fiveAffirmations = [Affirmation]()
    for i in 1...5 {
      affirm = affirmations[Int(arc4random_uniform(UInt32(affirmations.count)))]
      fiveAffirmations.append(affirm)
    }
    return fiveAffirmations
  }
  
}

