//
//  AddressModel.swift
//  AppUseAcademy
//
//  Created by Fran Martins on 12/06/22.
//

import Foundation

struct Address: Decodable {
    let cep: String?
    let logradouro: String?
    var complemento: String?
    let bairro: String?
    let localidade: String?
    let uf: String?
    var destinatario: String?
    var numero: String?
    
}
