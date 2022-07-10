//
//  ViagemDestaqueViewModel.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 09/07/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    var viagens: Array<Viagem>
    
    var titleSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var numeroDeLinhas: Int {
        viagens.count
    }
    
    init(_ viagens: Array<Viagem>) {
        self.viagens = viagens
    }
    
}
