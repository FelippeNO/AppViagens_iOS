//
//  DetalheViewController.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 11/07/22.
//

import UIKit

class DetalheViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var viagemImageView: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    //MARK: - Atributos
    var viagem: Viagem?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController?{
        let detalhesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetalheViewController") as? DetalheViewController
        detalhesViewController?.viagem = viagem
        return detalhesViewController
    }
    
}
