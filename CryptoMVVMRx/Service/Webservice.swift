//
//  Webservice.swift
//  CryptoMVVMRx
//
//  Created by İsa Anıl Koca on 28.04.2026.
//

import Foundation

enum CryptoError : Error { // kendi loglarımda takip etmek icin bile kullanabilirim
    case serverError // sunucudan gelen hata
    case parsingError // veri geldi ama ben işleyemedim
}

class Webservice {
    
    func downloadCurrencies(url : URL, completion : @escaping (Result<[Crypto], CryptoError>) -> () ) { // escaping iş bittikten sonra calısan
        
        
        
        
        // url session aslında bir veri istegi yaponca url ye istek atıyor cevap geldikten sonra yapıalcak işleri yapıyoruz
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(CryptoError.serverError))
            }else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completion(.success(cryptoList))
                }else {
                    completion(.failure(.parsingError))
                }
            }
            
        }.resume()
    }
}
