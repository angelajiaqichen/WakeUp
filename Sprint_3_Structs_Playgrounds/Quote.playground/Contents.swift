import Foundation

struct Quote {
  var text: String
  init(text: String) {
    self.text = "" } }



class QuoteDeck {
  var quotes = [Quote]()
  
  init() {
    let quoteData = [
      "quote 1 blabla",
      "quote 2 blabla",
      "quote 3 blabla"
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

