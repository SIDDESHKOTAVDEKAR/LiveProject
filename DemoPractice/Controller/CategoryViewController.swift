//
//  CategoryViewController.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/7/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, ApiResource {
    
    //MARK:- Outlet Decleration
    @IBOutlet var lblNoResult: UILabel!
    @IBOutlet weak var myColl:UICollectionView!
    @IBOutlet weak var headerView: HeaderView!
    
    //MARK:- Var Decleration
    var categoryTitle:String = ""
    var objgetData : getData?
    var objSubCategoryModel : SubCategoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.headerView.lblTitle.text = categoryTitle
        //self.headerView.searchCategory.delegate = self
        //self.headerView.btnCategoryBack.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        lblNoResult.isHidden = true
        if let key = UserDefaults.standard.value(forKey: userDefaultsKeys.category.rawValue) as? String {
            let categoryParam = ["apiname":"GetMenuSubCategories","paramlist":[["key": "CategoryID","value": key]]] as [String : Any]
            self.objgetData = getData()
            self.objgetData?.dele = self
            self.objgetData?.getUserResponse(method: .POST, strParameterName: categoryParam, endpoint: .baselink, Object:SubCategoryModel.self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("hideSideMenu"), object: nil)
    }
    
    //MARK:- Custom Functions
    @objc func backPressed(){
        self.navigationController?.popViewController(animated: true)
    }

    
    func getRespons<T>(ent: T) {
        DispatchQueue.main.async {
            if let arrEnt = ent as? SubCategoryModel{
                self.objSubCategoryModel = arrEnt
                self.myColl.reloadData()
            }
        }
    }
    
    
}
//MARK:- CollectionView Methods
extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objSubCategoryModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC1", for: indexPath) as! CVC1
        if let ent = self.objSubCategoryModel?.data[indexPath.row] {
            cell.categoryName.text = ent.filterName
            cell.categoryImg.sd_setImage(with: URL(string: ent.imageLink ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.myColl.frame.width / 3), height: (self.myColl.frame.width / 3) + 30)//
    }
}
//MARK:- CollectionView Methods
//extension CategoryViewController : UISearchBarDelegate{
//
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//
//        if text == "" || searchBar.text != nil{
//            if let value = searchBar.text {
//                let filtered = arrProducts.filter { $0.contains(text == "" ? String(value.dropLast()) : value + text
//                )}
//                if filtered.count == 0 && text != ""{
//                    arrProductsTemp = filtered
//                } else {
//                    arrProductsTemp = filtered.count == 0 ? arrProducts : filtered
//                }
//                lblNoResult.isHidden = arrProductsTemp.count == 0 ? false : true
//                self.myColl.reloadData()
//            }
//        }
//        return true
//    }
//}
