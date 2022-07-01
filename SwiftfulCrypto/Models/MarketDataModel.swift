//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-30.
//

import Foundation

// JSON data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13389,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 526,
     "total_market_cap": {
       "btc": 47042547.593117036,
       "eth": 871351342.8008538,
       "ltc": 17219189657.05765,
       "bch": 8999057364.503025,
       "bnb": 4194794553.7797785,
       "eos": 993702623791.4241,
       "xrp": 2759868944444.76,
       "xlm": 8198661613164.044,
       "link": 146362568266.53998,
       "dot": 131381088238.70407,
       "yfi": 172535489.48245135,
       "usd": 899937815509.5446,
       "aed": 3305561590148.0996,
       "ars": 112684844229097.48,
       "aud": 1304574155683.6538,
       "bdt": 84103529259451.19,
       "bhd": 339307154332.8251,
       "bmd": 899937815509.5446,
       "brl": 4727643326216.278,
       "cad": 1158890422233.3342,
       "chf": 859776290616.7963,
       "clp": 827235691128379,
       "cny": 6028863413661.552,
       "czk": 21250681606534.566,
       "dkk": 6388442567226.537,
       "eur": 859019442913.9537,
       "gbp": 740093560532.1854,
       "hkd": 7061983926426.122,
       "huf": 340626463170362.06,
       "idr": 13460819875483970,
       "ils": 3150614796762.748,
       "inr": 71062012010720.53,
       "jpy": 122223397366928.11,
       "krw": 1159152499424153.2,
       "kwd": 276109921176.4829,
       "lkr": 324357607826344.94,
       "mmk": 1665874362926155.8,
       "mxn": 18102721626327.605,
       "myr": 3966475921858.3105,
       "ngn": 373529049146004.8,
       "nok": 8865819283833.453,
       "nzd": 1442298839093.603,
       "php": 49478584696465.945,
       "pkr": 183592564601162.47,
       "pln": 4036190504674.57,
       "rub": 49384084026335.12,
       "sar": 3376763770173.4,
       "sek": 9211633888510.236,
       "sgd": 1251272638746.6538,
       "thb": 31789258505070.785,
       "try": 15024389834906.6,
       "twd": 26701154986168.14,
       "uah": 26563725482361.68,
       "vef": 90110773466.97054,
       "vnd": 20937053277829532,
       "zar": 14678299849258.236,
       "xdr": 659494229837.3335,
       "xag": 44434465638.29627,
       "xau": 498286569.0694806,
       "bits": 47042547593117.04,
       "sats": 4704254759311704
     },
     "total_volume": {
       "btc": 4688525.272782634,
       "eth": 86843782.94156481,
       "ltc": 1716161432.8847365,
       "bch": 896896746.5288045,
       "bnb": 418076853.52493644,
       "eos": 99038000781.19453,
       "xrp": 275064084698.7301,
       "xlm": 817124797508.558,
       "link": 14587317979.510324,
       "dot": 13094179292.768066,
       "yfi": 17195858.73382321,
       "usd": 89692871832.61835,
       "aed": 329450887528.3896,
       "ars": 11230806303207.082,
       "aud": 130021208716.10297,
       "bdt": 8382231461479.038,
       "bhd": 33817262238.539375,
       "bmd": 89692871832.61835,
       "brl": 471183563598.29285,
       "cad": 115501547238.09468,
       "chf": 85690148041.3437,
       "clp": 82446968602752.58,
       "cny": 600870486981.078,
       "czk": 2117962629019.527,
       "dkk": 636708170850.5181,
       "eur": 85614716336.13258,
       "gbp": 73761893016.32414,
       "hkd": 703837096609.0726,
       "huf": 33948751988645.99,
       "idr": 1341581130436384.8,
       "ils": 314008017320.609,
       "inr": 7082440392658.379,
       "jpy": 12181472237359.049,
       "krw": 115527667327151.16,
       "kwd": 27518670006.96559,
       "lkr": 32327306226409.477,
       "mmk": 166030422489336.72,
       "mxn": 1804219205670.8276,
       "myr": 395321332602.2647,
       "ngn": 37228009039539.12,
       "nok": 883617488910.3728,
       "nzd": 143747626435.62317,
       "php": 4931314452128.836,
       "pkr": 18297869122068.383,
       "pln": 402269480611.64996,
       "rub": 4921895983043.457,
       "sar": 336547297854.9146,
       "sek": 918083320305.1346,
       "sgd": 124708879303.20058,
       "thb": 3168296564063.0386,
       "try": 1497415319815.8162,
       "twd": 2661187507273.7817,
       "uah": 2647490508816.2227,
       "vef": 8980947256.60006,
       "vnd": 2086704663185863.8,
       "zar": 1462922042402.27,
       "xdr": 65728909722.12285,
       "xag": 4428589134.450394,
       "xau": 49662046.20500254,
       "bits": 4688525272782.634,
       "sats": 468852527278263.4
     },
     "market_cap_percentage": {
       "btc": 40.56277343872406,
       "eth": 13.908389011510453,
       "usdt": 7.377393327803847,
       "usdc": 6.210685661651592,
       "bnb": 3.881878061451025,
       "busd": 1.9558068775930102,
       "xrp": 1.7525680813879945,
       "ada": 1.6893456533108833,
       "sol": 1.2454494735062336,
       "doge": 0.9462461469173625
     },
     "market_cap_change_percentage_24h_usd": -4.552199434865477,
     "updated_at": 1656632921
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}
