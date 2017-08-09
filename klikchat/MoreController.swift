//
//  MoreController.swift
//  klikchat
//
//  Created by ajiejoy on 8/9/17.
//  Copyright © 2017 ajiejoy. All rights reserved.
//

import UIKit

class MoreController: UIViewController {

    let banner = ContentBannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        banner.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        banner.arrayimage = ["as","12","asdasd","asd"]
        self.view.addSubview(banner)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
