//
//  ViewController.swift
//  CryptoMVVMRx
//
//  Created by İsa Anıl Koca on 28.04.2026.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
   

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    
    let cryptoVM = CryptoViewModel()
    let disposeBag = DisposeBag() // rxswiftten gelen
    var cryptoList = [Crypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBindings()
        
        cryptoVM.requestData()
        
    }
    
    
    
    private func setupBindings(){
        
//        indicatorView.startAnimating()// kendimiz manuel olarakta kontrol edebiliriz
        
        cryptoVM.loading.bind(to: self.indicatorView.rx.isAnimating).disposed(by: disposeBag) // binding manuel olarak islemleri yapmayalım diye datayı direk olarak görünüme baglama özelligi var tableview indicatorview gibi bunlar icin var reloaddata felan yapmıyoruz
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance).subscribe { errorString in // error stringimiz
                print(errorString)
            }// hangi threadde yapılacagını sorar MainScheduler onnextte bize hangi veri tipin saklıyora onu closure olarak verecek ve bu işlemler hafızada yer tutar disposebag ile dispose ediyoruz çöp öantası gibi
            .disposed(by: disposeBag) // sadece hata mesajı olan kısım burası
        
        // tableviewa bind etmemiz gerekiyor

                cryptoVM.cryptos.observe(on: MainScheduler.asyncInstance).subscribe { cryptos in
            self.cryptoList = cryptos
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
        
        
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
    


}

