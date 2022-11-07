//
//  ViewModel.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/7/22.
//

import Foundation

class ViewModel: ObservableObject {
  
  // instance of parser
  let parser = Parser()
  
  // MARK: Fields
  // var repos
  // var searchText
  // var filteredRepos
  @Published var repos: [Repository] = []
  @Published var searchText: String = ""
  @Published var filteredRepos: [Repository] = []
  
  // MARK: Methods
  
  func search(searchText: String) {
      self.filteredRepos = self.repos.filter { repo in
        return repo.name.lowercased().contains(searchText.lowercased())
      }
  }
}
