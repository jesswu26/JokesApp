//
//  ViewController.swift
//  blagues
//
//  Created by formation on 10/05/2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var selectBlague: UIPickerView!
    
    
    var themeData: [String] = [String]()
    var selectedTheme: String = "Global"
    let domaineUrl = "https://www.blagues-api.fr/api/random/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.selectBlague.delegate = self
        self.selectBlague.dataSource = self
        
        themeData = ["Global", "Dev", "Dark", "Limit", "Beauf", "Blondes"]
        
        // themeData = ["Tous", "Animaux", "Attrape nigaux", "Belges", "Blondes", "Carambar", "Citations", "Combles", "Confinement", "Contrepètries", "Devinettes", "Femmes", "Fonctionnaires", "Français", "Histoires drôles", "Hommes", "Jeu de mots", "Lada", "Melon et Melèche", "Monsieur et Madame", "On ne dit pas", "Politique", "Religion", "Star wars", "Ta mère", "Ton père", "Toto"]
        

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themeData[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTheme = themeData[row].lowercased()
    }
    
    @IBAction func generateBtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "BlagueView") as! BlagueViewController
        
        controller.theme = selectedTheme
        self.present(controller, animated: true, completion: nil)
    }
}





