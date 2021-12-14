//
//  ViewController.swift
//  DemoPractice
//
//  Created by Siddhesh Kotavdekar on 12/6/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import UIKit
import SDWebImage
class MainViewController: UIViewController,ApiResource {
    //MARK:-Outlet Decleration
    @IBOutlet weak var mTV:UITableView!
    
    //MARK:-Array Decleration
    var arrcommentImg = ["Jalpa","Raghavi","Rajni Negi","Ankur","Sru"]
    
    //MARK:-Varibles Decleration 
    var objgetData : getData?
    var objCategoryModel : CategoryModel?
    var objSectionHeading : SectionHeadModel?
    var objTopChartsModel : TopChartsModel?
    var objANSModel : ANSModel?
    var objDCModel :DSModel?
    
    func getRespons<T>(ent: T) {
        DispatchQueue.main.async {
          if let arrEnt = ent as? CategoryModel{
            self.objCategoryModel = arrEnt
            self.mTV.reloadSections(IndexSet([0]), with: .automatic)
           }
           else if let arrEnt = ent as? SectionHeadModel{
            self.objSectionHeading = arrEnt
            self.mTV.reloadData()
           }
           else if let arrEnt = ent as? TopChartsModel{
            self.objTopChartsModel = arrEnt
            self.mTV.reloadData()
           }
           else if let arrEnt = ent as? ANSModel{
             self.objANSModel = arrEnt
             self.mTV.reloadData()
            }
          else if let arrEnt = ent as? DSModel{
             self.objDCModel = arrEnt
             self.mTV.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.objgetData = getData()
        self.objgetData?.dele = self
        
        self.objgetData?.getUserResponse(method: .POST, strParameterName: [ "apiname":"GetMenuCategories","paramlist":""], endpoint: .baselink, Object:CategoryModel.self)
       
        self.objgetData?.getUserResponse(method: .POST, strParameterName: [ "apiname":"GetCTASectionHeads","paramlist":""], endpoint: .baselink, Object:SectionHeadModel.self)
        
        let topChartParam = ["apiname":"GetCTASectionItems","paramlist":[["key": "CTASectionID","value": 1]]] as [String : Any]
        self.objgetData?.getUserResponse(method: .POST, strParameterName: topChartParam, endpoint: .baselink, Object:TopChartsModel.self)
        
        let ANSParam = ["apiname":"GetBucketItems","paramlist":[["key": "BucketID","value": "3"],["key":"OrderType","value":"1"],["key":"CurrencyID","value":"1"],["key":"UserID","value":""]]] as [String : Any]
        self.objgetData?.getUserResponse(method: .POST, strParameterName: ANSParam, endpoint: .baselink, Object:ANSModel.self)
        
        let DCParam = ["apiname":"GetCTASectionItems","paramlist":[["key": "CTASectionID","value": 2 ]]] as [String : Any]
        self.objgetData?.getUserResponse(method: .POST, strParameterName: DCParam, endpoint: .baselink, Object:DSModel.self)
        
        self.mTV.register(UINib(nibName:"sectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "sectionHeader")
        self.mTV.register(UINib(nibName:"sectionFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "sectionFooter")
    }
}
//MARK:-Table View Method
extension MainViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return objSectionHeading?.data.count ?? 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mTV.dequeueReusableCell(withIdentifier: "TVC1", for: indexPath) as! TVC1
        cell.CV.delegate = self
        cell.CV.dataSource = self
        cell.CV.tag = indexPath.section
        cell.CV.reloadItems(at: [IndexPath(item: 0, section: 0)])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0     { return 150}
        else if indexPath.section == 1{ return 290}
        else if indexPath.section == 2{ return 150}
        else if indexPath.section == 3{ return 300}
        else if indexPath.section == 4{ return 300}
        else if indexPath.section == 5{ return 300}
        else if indexPath.section == 6{ return 300}
        else if indexPath.section == 7{ return 150}
        else{return 150}
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = mTV.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! sectionHeader
        if  objSectionHeading?.data.count ?? 0 > 1
        {
            cell.lblHeading.text = objSectionHeading?.data[section].heading1
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = mTV.dequeueReusableHeaderFooterView(withIdentifier: "sectionFooter") as! sectionFooter
        if section == 6 {
            cell.pageControl.numberOfPages = arrcommentImg.count
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 6{
             return 100
        }
       return 0
    }
}
//MARK:-Collection View Method
extension MainViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{return objCategoryModel?.data.count ?? 1}
        else if collectionView.tag == 1{return objTopChartsModel?.data.count ?? 1}
        else if collectionView.tag == 2{return 1}
        else if collectionView.tag == 3{return objANSModel?.data.count ?? 1}
        else if collectionView.tag == 4{return 5}
        else if collectionView.tag == 5{return 10}
        else if collectionView.tag == 6{return arrcommentImg.count}
        else if collectionView.tag == 7{return 1}
        else {return 100}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC1", for: indexPath) as! CVC1
            let ent = objCategoryModel?.data[indexPath.item]
            cell.categoryName.text = ent?.categoryName
            cell.categoryImg.sd_setImage(with: URL(string: ent?.imageLink ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC2", for: indexPath) as! CVC2
        let ent = objTopChartsModel?.data[indexPath.item]
            cell.categoryImg.sd_setImage(with: URL(string: ent?.imageLink ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            cell.categoryName.text = ent?.ctaItemHead1
            cell.categoryDesc.text  = ent?.ctaItemHead2
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC3", for: indexPath) as! CVC3
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC4", for: indexPath) as! CVC4
            let ent =  objANSModel?.data[indexPath.item]
            cell.ANSImg.sd_setImage(with: URL(string: ent?.imageLink ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            return  cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC5", for: indexPath) as! CVC5
            let ent = objDCModel?.data[indexPath.item]
            cell.DCImg.sd_setImage(with: URL(string: ent?.imageLink ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            return  cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC6", for: indexPath) as! CVC6
            return  cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC7", for: indexPath) as! CVC7
            cell.commentImg.image = UIImage(named: "\(arrcommentImg[indexPath.row])")
            return  cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC8", for: indexPath) as! CVC8
            return  cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.tag == 6 {
            guard let footer = self.mTV.footerView(forSection: collectionView.tag) as? sectionFooter
                else {return }
            footer.pageControl?.currentPage = indexPath.item
            print(indexPath.item)
            collectionView.isPagingEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1
        {
            if indexPath.item == 0 {
                return CGSize(width: 200, height: 280)
            } else {
                return CGSize(width: 140, height: 140)
            }
        }else if collectionView.tag == 2
        {
            if indexPath.item == 0 {
                return CGSize(width: view.frame.width, height: 150)
            }
        }else if collectionView.tag == 3
        {
            return CGSize(width: 170, height: 250)
        }
        else if collectionView.tag == 4
        {
            return CGSize(width: 160, height: 300)
        }
        else if collectionView.tag == 5
        {
            return CGSize(width: 130, height: 300)
        }
        else if collectionView.tag == 6
        {
            return CGSize(width: view.frame.width, height: 250)
        }
        else if collectionView.tag == 7
        {
            return CGSize(width: 420, height: 150)
        }
        return CGSize(width: 100 , height: 150)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CategoryViewController") as! CategoryViewController
        self.present(vc,animated: true,completion: nil)
    }
}

