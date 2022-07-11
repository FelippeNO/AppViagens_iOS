//
//  ViewController.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let viagemTableViewCell = "ViagemTableViewCell"
    let ofertaTableViewCell = "OfertaTableViewCell"
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tripsTableView: UITableView!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59/255.0, blue: 119/255.0, alpha: 1)
    }
    
    func configuraTableView(){
        
        tripsTableView.register(UINib(nibName: viagemTableViewCell, bundle: nil), forCellReuseIdentifier: viagemTableViewCell)
        tripsTableView.register(UINib(nibName: ofertaTableViewCell, bundle: nil), forCellReuseIdentifier: ofertaTableViewCell)
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
    }
}



//MARK: - Extensions

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 300
        }
        return 0
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            guard let cellViagem = tableView.dequeueReusableCell(withIdentifier: viagemTableViewCell) as? ViagemTableViewCell else {fatalError("problema na criacao da celula")}
            cellViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return cellViagem
        case .ofertas:
            guard let cellOferta = tableView.dequeueReusableCell(withIdentifier: ofertaTableViewCell) as? OfertaTableViewCell else {fatalError("problema na criacao da celula")}
            cellOferta.configuraCelula(viewModel?.viagens)
            return cellOferta
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detalheController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetalheViewController")
        
        navigationController?.pushViewController(detalheController, animated: true)
    }
}

