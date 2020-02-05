//
//  HomeController.swift
//  Home
//
//  Created by Lama Alherbish on 1/29/20.
//  Copyright © 2020 Lama Alherbish. All rights reserved.
//

import UIKit

class HomeController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    let ArrayOfMenuImage = ["Play","Learn"]
    
    let ArrayOfColors = ["T","Y"]
    
    let ArrayOfMenuText = ["Play","Learn"]
    
    let identities = ["P","L"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayOfMenuImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        cell.TEXT.text = ArrayOfMenuText[indexPath.row]
        cell.rect.image = UIImage(named: ArrayOfColors[indexPath.row]+".png")
        cell.robot.image = UIImage(named: ArrayOfMenuImage[indexPath.row]+".png")

        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VCname = identities[indexPath.row]
        let VC = storyboard?.instantiateViewController(withIdentifier: VCname)
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
   
}
