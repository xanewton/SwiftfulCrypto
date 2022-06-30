//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-27.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Simulate downloading from the Internet
        /*
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        } */
        
        addSubscribers()
    }

    func addSubscribers() {
        /*
         // Since, we also update allCoins in the search, we don't need to subscribe here!
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables) */
        
        // Updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins) // combine with the allCoins publisher
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // wait for 0.5 seconds after typing a key
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        // if no search term, return allCoins
        guard !text.isEmpty else {
            return coins
        }
        
        // filter
        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText)
            || coin.symbol.lowercased().contains(lowercasedText)
            || coin.id.lowercased().contains(lowercasedText)
        }
    }
}
