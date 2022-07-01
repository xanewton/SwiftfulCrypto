//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-30.
//

import Foundation
import Combine

class MarketDataService  {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable? // because we want to cancell it latter
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel() // Since nothing happens after the request returns, we cancel the subscription
            })
    }
}
