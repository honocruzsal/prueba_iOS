//
//  ViewController.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import UIKit

class VCTabla: UIViewController {

    var webserviceUltCincoMovs :GetCategories?
    private var sourceListViewModel :ViewModelsCategories!
    var onDataFiltroAvailable: ((_ dataFiltro: String) -> ())?
    @IBOutlet weak var tvCategories: UITableView!
     var dataSource :TableViewDataSource<CellCategories,ModelData>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tvCategories.dataSource = self
        tvCategories.delegate = self
        tvCategories.allowsSelection = true
        tvCategories.register(UINib(nibName: "CellCategories", bundle: nil), forCellReuseIdentifier: "CellCategories")
        update()
    }
    
    func update(){
        self.webserviceUltCincoMovs = GetCategories()
        self.sourceListViewModel = ViewModelsCategories(webService: self.webserviceUltCincoMovs!)
        self.sourceListViewModel.bindToSourceGetCategories = {
            if self.sourceListViewModel!.sourceError != nil{
                 print(self.sourceListViewModel!.sourceError.getTypeError()!)
            }else{
                self.updateDataSource()
                
            }
        }
    }
    
    private func updateDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.source, items: self.sourceListViewModel!.sourceViewModelsCategories.getData() )
        {
            cell, vm in
            cell.txtCategory.text = vm.getCategory()
            cell.txtColor.text = vm.getColor()
            cell.txtID.text = String(vm.getId())
            cell.txtStatus.text = String(vm.getStatus())
            cell.modelsMovies = vm.getModelsMovies()
            
            
        }
        self.tvCategories.dataSource = self.dataSource
        self.tvCategories.reloadData()
    }


}
extension VCTabla:UITableViewDelegate{
    
}

extension VCTabla:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCategories", for: indexPath) as! CellCategories
        return cell
    }
}

