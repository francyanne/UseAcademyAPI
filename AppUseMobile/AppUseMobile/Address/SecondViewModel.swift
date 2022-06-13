//
//  SecondViewModel.swift
//  AppUseAcademy
//
//  Created by Fran Martins on 12/06/22.
//

import Foundation

class SecondViewModel {
    
    func createFullAddress(address: Address) -> String {
        let fullAddress = """
Destinatário: \(address.destinatario?.testIfIsEmpty() ?? "Sem destinatário").

Endereço: \(address.logradouro ?? ""), \(address.numero?.testIfIsEmpty() ?? "Sem número"), \(address.localidade ?? "") - \(address.uf ?? ""), \(address.bairro ?? ""), \(address.complemento?.testIfIsEmpty() ?? "Sem complemento").
"""
        return fullAddress
    }
}
