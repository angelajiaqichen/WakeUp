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
      "I am worthy of love",
      "I create my own hapiness",
      "My life is filled with abundance of goodness",
      "I am enough",
      "I am beautiful",
      "I am loved",
      "I am talented",
      "I am smart",
      "I am driven",
      "I am successful",
      "I am valuable",
      "I am welcome",
      "I am strong",
      "I am resilient",
      "I am kind",
      "I am generous",
      "I am proud of myself",
      "I am a joy to be around",
      "I am happy",
      "I am safe",
      "I am important",
      "I am opinionated",
      "I am responsible",
      "I am brave",
      "I am capable",
      "I am resilient",
      "I am worthy of love",
      "I am amazing",
      "I am limitless",
      "I am energetic",
      "I am joyful",
      "I am unique",
      "I am special",
      "I am genuine",
      "I am reliable",
      "I am fun",
      "I am warm",
      "I am blessed",
      "I am honest",
      "I am amazing",
      "I am mature",
      "I am thankful",
      "I am forgiving",
      "I am determined",
      "I am optimistic",
      "I am strong-willed",
      "I am hardworking",
      "I am balanced",
      "I am a good friend",
      "I am thankful",
      "I am a gift",
      "I am ambitious",
      "I am in charge of my life",
      "I am gentle with myself",
      "I am kind to others",
      "I am a breath of fresh air",
      "I am making the world a better place",
      "I am living my truth",
      "I am fulfilled",
      "I am respectful",
      "I am open-minded",
      "I am able",
      "I am learning",
      "I am growing",
      "I am open to new opportunities",
      "I am happy for others’ success",
      "I am confident",
      "I am worthy"
      // 68 affirmations total above
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


