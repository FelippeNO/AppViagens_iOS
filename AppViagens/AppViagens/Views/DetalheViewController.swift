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
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
}
