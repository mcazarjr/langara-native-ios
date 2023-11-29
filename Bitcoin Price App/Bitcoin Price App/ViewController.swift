//
//  ViewController.swift
//  Bitcoin Price App
//
//  Created by Meraldo Cazar Jr. on 2023-11-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var euLabel: UILabel!
    
    @IBOutlet weak var yenLabel: UILabel!
    
    
    @IBOutlet weak var refreshTapped: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDefaultPrices()
        getPrice()
    }
    
    func getDefaultPrices(){
        let usdPrice = UserDefaults.standard.double(forKey: "USD")
        if usdPrice != 0.0{
            self.usdLabel.text = self.doubleToMoneyString(price: usdPrice, currencyCode:"USD") + "~"
        }
        let eurPrice = UserDefaults.standard.double(forKey: "EUR")
        if eurPrice != 0.0{
            self.euLabel.text = self.doubleToMoneyString(price: eurPrice, currencyCode:"EUR") + "~"
        }
        let jpyPrice = UserDefaults.standard.double(forKey: "JPY")
        if jpyPrice != 0.0{
            self.yenLabel.text = self.doubleToMoneyString(price: jpyPrice, currencyCode:"JPY") + "~"
        }
    }

    @IBAction func refreshTapped(_ sender: Any) {
        getPrice()
    }
    func getPrice(){
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR&api_key=5c37e49c81bae349fc1ca08b5b96345aba579fcf0e554a137d1c4cf0044aa0ab"){
            
            URLSession.shared.dataTask(with: url) {( data, response, error) in
                if let data = data{
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double]{
                        
                        DispatchQueue.main.async {
                            if let usdPrice = json["USD"]{
                                
                                self.usdLabel.text = self.doubleToMoneyString(price: usdPrice, currencyCode: "USD")
                                UserDefaults.standard.set(usdPrice, forKey: "USD")
                                
                            } 
                            if let eurPrice = json["EUR"]{
                                self.euLabel.text = self.doubleToMoneyString(price: eurPrice, currencyCode: "EUR")
                                UserDefaults.standard.set(eurPrice, forKey: "EUR")
                            }
                            if let jpyPrice = json["JPY"]{
                                self.yenLabel.text = self.doubleToMoneyString(price: jpyPrice, currencyCode: "JPY")
                                UserDefaults.standard.set(jpyPrice, forKey: "JPY")
                            }
                            UserDefaults.standard.synchronize()
                        }
                       
                    }
                }else{
                    print("Something went wrong.")
                }
            }.resume()
        }
    }
    
    func doubleToMoneyString(price: Double, currencyCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        let priceString = formatter.string(from: NSNumber(value: price))
        if priceString == nil{
            return "ERROR"
        }else{
            return priceString!
        }
        
    }

}

