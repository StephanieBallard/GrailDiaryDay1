//
//  ViewController.swift
//  Grail-Diary
//
//  Created by Stephanie Ballard on 1/20/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiModels: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       //tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = poiModels[indexPath.row]
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        
    
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiModels.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
