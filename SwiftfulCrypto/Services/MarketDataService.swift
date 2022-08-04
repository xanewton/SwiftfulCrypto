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
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            // the response is in the background thread
            // To optimize, we will do the decoding in a background thread
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            // switch to the main thread before siking anything
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel() // Since nothing happens after the request returns, we cancel the subscription
            })
    }
}
