//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-28.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            //print("Load image from File Manager!")
        } else {
            downloadCoinImage()
            //print("Donwloading image!")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            // the response is in the background thread
            // To optimize, we will do the mapping in a background thread
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            // switch to the main thread before siking anything
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let downloadedImage = returnedImage
                    else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel() // Since nothing happens after the request returns, we cancel the subscription
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName) // save image
            })
    }
}
