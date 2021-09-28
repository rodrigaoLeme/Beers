//
//  BeerDetalheTableViewController.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

class BeerDetalheTableViewController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .automatic
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        //tableView.register(BeerDescriptionTableViewCell.self, forCellReuseIdentifier: cellId)
        
       
        
        self.adicionarHeader()
    }
    
    func  adicionarHeader() {
        
        let headerView = UIView(frame: .init(x: 0, y: 0, width: UIWindow().screen.bounds.width, height: UIWindow().screen.bounds.width))
        //headerView.backgroundColor = .red
        let beerCell = BeerCollectionViewCell()
        beerCell.layer.cornerRadius = 0
        
        headerView.addSubview(beerCell)
        beerCell.preencherSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
}

extension BeerDetalheTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //cell.backgroundColor = .blue
        cell.textLabel?.text = "Teste"
        return cell
    }
}
