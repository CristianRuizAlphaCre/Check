//
//  DatosViewController.swift
//  check
//
//  Created by Cristian David Ruiz Rodriguez on 11/21/19.
//  Copyright © 2019 Alphacredit. All rights reserved.
//

import UIKit

var DataSource = ["1023846734    Carlos Mora","1025763465    Jorge Perez","1234567890    Usu Prueba","1034754935    Victor Muñoz"]

class DatosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        if (DataMostar != ""){
            DataSource.append(DataMostar)
            DataMostar = ""
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (DataMostar != ""){
            DataSource.append(DataMostar)
            DataMostar = ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel!.text = DataSource[indexPath.row]
        
        return cell
    }
    
}
