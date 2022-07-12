//
//  ViewController.swift
//  ContactDesing
//
//  Created by macbook on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var contactList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        contactList = ["Ahmet","Mehmet", "Ayşe","Ali"]
        searchBar.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiCell", for: indexPath) as! ContactCell
        cell.contactNameLabel.text = contactList[indexPath.row]
        return cell
    }
    
    //TableView'e tıklandığında detayla sayfasına geçmek için gerekli method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    // Veri transferi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            
        }
        
        if segue.identifier == "toUpdate" {
            
        }
    }
    
    //Edit butonları
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton = UITableViewRowAction(style: .default, title: "Sil", handler:  { (action:UITableViewRowAction,indexPath:IndexPath) -> Void  in
            print("Sil Tıklandı. \(self.contactList[indexPath.row])")
            
        })
        
        let updateButton = UITableViewRowAction(style: .normal, title: "Güncelle", handler:  { (action:UITableViewRowAction,indexPath:IndexPath) -> Void  in
            print("Güncelle Tıklandı. \(self.contactList[indexPath.row])")
            self.performSegue(withIdentifier: "toUpdate", sender: indexPath.row	)
            
        })
        return [deleteButton, updateButton]
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonuçları: \(searchText)")
    }
}

