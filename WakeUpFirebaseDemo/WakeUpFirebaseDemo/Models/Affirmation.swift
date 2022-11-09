//
//  Affirmation.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import Foundation

struct Affirmation {
  var text: String
  init(text: String) {
    self.text = "" } }



class AffirmationDeck {
  var affirmations = [Affirmation]()
  
  init() {
    let affirmationData = [
      "I am worthy",
      "I create my own hapiness",
      "My life is filled with abundance of goodness"
    ]
    

    for txt in affirmationData{
      var aff = Affirmation(text: txt)
      aff.text = txt
      affirmations.append(aff)
    }
    
  }
  
  func drawFiveRandomAffirmations() -> [Affirmation] {
    var fiveAffirmations = [Affirmation]()
    for _ in 1...5 {
      var affirm = affirmations[Int(arc4random_uniform(UInt32(affirmations.count)))]
      fiveAffirmations.append(affirm)
    }
    return fiveAffirmations
  }
  
}


