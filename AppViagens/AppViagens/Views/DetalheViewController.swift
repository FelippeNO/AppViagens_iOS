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
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    //MARK: - Atributos
    var viagem: Viagem?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView(){
        viagemImageView.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString : NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSMutableAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
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
