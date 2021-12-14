//
//  RootViewController.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/6/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    @IBOutlet weak var myTable:UITableView!
    var arrMenu = ["Collection","Antique","Kundan","American Diamond","Western","Indo Western","Designer Jewellery"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTable.separatorStyle = .none
        NotificationCenter.default.addObserver(self, selector: #selector(hideSideMenu), name: NSNotification.Name("hideSideMenu"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func hideSideMenu() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension RootViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrMenu[indexPath.row]
        return cell
    }
}
extension RootViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set("\(indexPath.row)", forKey: userDefaultsKeys.category.rawValue)
            let vc = self.storyboard?.instantiateViewController(identifier: "CategoryViewController") as! CategoryViewController
            vc.categoryTitle = arrMenu[indexPath.row]
            self.present(vc, animated: true, completion: nil)
      }
}
