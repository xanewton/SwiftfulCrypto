//
//  CoinDetailDataService.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-07-15.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil

    var coinDetailSubscription: AnyCancellable? // because we want to cancell it latter
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            // the response is in the background thread
            // To optimize, we will do the decoding in a background thread
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            // switch to the main thread before siking anything
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel() // Since nothing happens after the request returns, we cancel the subscription
            })
    }
}
