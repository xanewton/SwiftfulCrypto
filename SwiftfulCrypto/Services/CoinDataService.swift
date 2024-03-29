//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-28.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable? // because we want to cancell it latter
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            // the response is in the background thread
            // To optimize, we will do the decoding in a background thread
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            // switch to the main thread before siking anything
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel() // Since nothing happens after the request returns, we cancel the subscription
            })
    }
}
