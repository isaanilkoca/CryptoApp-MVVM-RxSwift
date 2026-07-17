//
//  CryptoViewModel.swift
//  CryptoMVVMRx
//
//  Created by İsa Anıl Koca on 28.04.2026.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel{
    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject() // sadece kripto listesini tutmak istiyorsam ve viewcontrollerde gözlemek istiyorsam yeterli
    let error : PublishSubject<String> = PublishSubject() // opsiyonel
    let loading : PublishSubject<Bool> = PublishSubject() // opsiyonel bool degil publishsubject rx degerleri bunlar
    
    
    
    func requestData(){
        
        
        self.loading.onNext(true)
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { result in
            self.loading.onNext(false) // sadece iki satırda true olacak
            switch result {
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
            case .failure(let error):
                switch error {
                case.parsingError:
                    self.error.onNext("Parsing error")
                case.serverError:
                    self.error.onNext("Server Error")
                }
            }
        }
    }
    }

