//
//  ViagemViewModel.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 09/07/22.
//

import Foundation

enum ViagemViewModelType: String {
    case destaques
    case ofertas
    case internacionais
}

protocol ViagemViewModel {
    var titleSessao: String {get}
    var tipo: ViagemViewModelType {get}
    var viagens: Array<Viagem> {get set}
    var numeroDeLinhas: Int {get}
}
