//
//  FriendController.swift
//  klikchat
//
//  Created by ajiejoy on 8/9/17.
//  Copyright © 2017 ajiejoy. All rights reserved.
//

import UIKit

import JNExpandableTableView

class FriendController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let scrollMain = UIScrollView()
    let myPofile = UIButton()
    
    let tableContent = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollMain.backgroundColor = .white
        scrollMain.frame = view.bounds
        scrollMain.contentSize = CGSize(width: view.frame.width, height: 500)
        view.addSubview(scrollMain)
        
        myPofile.setTitle("MyProfile", for: .normal)
        myPofile.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 20)
        myPofile.setTitleColor(.red, for: .normal)
        myPofile.addTarget(self, action: #selector(collapse), for: .touchUpInside)
        scrollMain.addSubview(myPofile)
        
        
        
        tableContent.isScrollEnabled = false
        tableContent.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: 0)
        tableContent.register(UINib(nibName: "HeaderViewCell", bundle: nil), forCellReuseIdentifier: HeaderViewCell.identifier())
        tableContent.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: UITableViewCell.identifier())
        tableContent.rowHeight = CGFloat(60)
        tableContent.dataSource = self
        tableContent.delegate = self
        
        scrollMain.addSubview(tableContent)
    }
    
    func collapse() {
        myPofile.isSelected = !myPofile.isSelected
        if myPofile .isSelected {
            tableContent.reloadData()
            tableContent.layoutIfNeeded()
            
            tableContent.frame.size.height = tableContent.contentSize.height
            
            scrollMain.contentSize = CGSize(width: view.frame.width, height: tableContent.contentSize.height + 20)
        }
        else{
            tableContent.frame.size.height = 0
        }
    }
    
    /*
    func tableView(_ tableView: JNExpandableTableView, canExpand indexPath: IndexPath) -> Bool {
        return true
    }
    
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier())
        cell?.textLabel?.text = "halooo"
        
        return cell!
        
    }
}
