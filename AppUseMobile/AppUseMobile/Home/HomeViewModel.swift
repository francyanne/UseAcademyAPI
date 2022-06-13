//
//  HomeViewModel.swift
//  AppUseAcademy
//
//  Created by Fran Martins on 12/06/22.
//

import Foundation

class HomeViewModel {
    // MARK: Properties
    var address: Address?
    var goToAddress: (() -> Void)?
    
    // MARK: Services
    func getAddress(with zipCode: String) {
        
        guard let url = URL(string: "https://viacep.com.br/ws/\(zipCode)/json/") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: ", response.statusCode)
            }
            guard let data = data else { return }
            guard let address = try? JSONDecoder().decode(Address.self, from: data) else { return }
            self.address = address
            
            DispatchQueue.main.sync {
                self.goToAddress?()
            }
        }.resume()
    }
}
