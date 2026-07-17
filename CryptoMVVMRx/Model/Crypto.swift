//
//  Crypto.swift
//  CryptoMVVMRx
//
//  Created by İsa Anıl Koca on 28.04.2026.
//

import Foundation


struct Crypto : Decodable {
    
    // biz sadece sunucudan bir veri alıp onu kullanacaımı icin decodable yeterli
    // codable olsada olur
    
    
    let currency : String
    let price: String
    
}

