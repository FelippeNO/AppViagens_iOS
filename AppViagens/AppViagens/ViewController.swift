//
//  ViewController.swift
//  AppViagens
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tripsTableView: UITableView!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59/255.0, blue: 119/255.0, alpha: 1)
    }
    
}

//MARK: - Extensions

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "viagem \(indexPath.row)"
        return cell
    }
}

