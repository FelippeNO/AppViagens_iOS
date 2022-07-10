//
//  ViagemOfertaViewModel.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 10/07/22.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    
    var viagens: Array<Viagem>
    
    var titleSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType{
        return .ofertas
    }
    
    var numeroDeLinhas: Int{
        return 1
    }
    
    init(_ viagens: Array<Viagem>) {
        self.viagens = viagens
    }
}
