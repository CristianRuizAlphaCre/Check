//
//  Datos.swift
//  check
//
//  Created by Cristian David Ruiz Rodriguez on 11/21/19.
//  Copyright © 2019 Alphacredit. All rights reserved.
//

import UIKit

let DataSource = ["Carlos Mora","Jorge Perez","Usu Prueba","Victor Muñoz"]

class Datos: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
