//
//  ViewController.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let viagemTableViewCell = "ViagemTableViewCell"
    
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
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
    }
}



//MARK: - Extensions

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViagem = tableView.dequeueReusableCell(withIdentifier: viagemTableViewCell) as? ViagemTableViewCell else {fatalError("problema na criacao da celula")}
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            cellViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return cellViagem
        default:
            return UITableViewCell()
        }
        
 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400;
    }
}

