//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-07-15.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("Received coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
