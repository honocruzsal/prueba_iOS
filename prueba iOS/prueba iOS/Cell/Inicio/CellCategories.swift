//
//  CellCategories.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import UIKit

class CellCategories: UITableViewCell {

    @IBOutlet weak var txtID: UILabel!
    @IBOutlet weak var txtCategory: UILabel!
    @IBOutlet weak var txtColor: UILabel!
    @IBOutlet weak var txtStatus: UILabel!
    var modelsMovies:[ModelMovies?]?
    
    @IBOutlet weak var tbMovies: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tbMovies.dataSource = self
        tbMovies.delegate = self
        tbMovies.register(UINib(nibName: "CellMovies", bundle: nil), forCellReuseIdentifier: "CellMovies")
        //tbMovies.reloadData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CellCategories:UITableViewDelegate{
    
}

extension CellCategories:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMovies", for: indexPath) as! CellMovies
        cell.txtTitleMovie.text = modelsMovies![indexPath.row]!.getTitle()
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsMovies!.count
    }
}
