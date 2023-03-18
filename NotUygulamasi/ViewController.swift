//
//  ViewController.swift
//  NotUygulamasi
//
//  Created by Abdüssamed Söğüt on 24.02.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var notTableView: UITableView!
    
    
    var notlarListe = [Notlar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let   n1 = Notlar(not_id: 1, ders_adi: "Tarih", not1: 38, not2: 24)
        let   n2 = Notlar(not_id: 2, ders_adi: "Matematik", not1: 56, not2: 14)
        let   n3 = Notlar(not_id: 3, ders_adi: "Fizik", not1: 48, not2: 30)
        
        notlarListe.append(n1)
        notlarListe.append(n2)
        notlarListe.append(n3)
        
        notTableView.delegate = self
        notTableView.dataSource = self
        
    }
    
    

        
        
        
        
    }
    
    extension ViewController: UITableViewDataSource,UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return notlarListe.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let not = notlarListe[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre", for: indexPath) as! NotHucreTableViewCell
            
            
            cell.labelDersAdi.text = not.ders_adi
            cell.labelNot1.text! = String(not.not1!)
            cell.labelNot2.text! = String(not.not2!)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "toNotDetay", sender: indexPath.row)
            
        }
        
    }
    

