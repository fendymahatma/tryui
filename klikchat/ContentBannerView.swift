//
//  ContentBannerView.swift
//  klikchat
//
//  Created by ajiejoy on 8/9/17.
//  Copyright © 2017 ajiejoy. All rights reserved.
//

import UIKit

import SnapKit

class ContentBannerView: UIView {

    let imageSrcoll = UIScrollView()
    let pageController  = UIPageControl()
    
    var timer : Timer!
    
    var arrayimage = [String]() {
        didSet{
            pageController.numberOfPages = arrayimage.count;
            imageSrcoll.contentSize = CGSize(width: imageSrcoll.frame.width * CGFloat(arrayimage.count), height: imageSrcoll.frame.height)
            
            for i in 0..<arrayimage.count {
                let image = UIImageView()
                image.frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
                image.image = UIImage(named: "ic_print")
                imageSrcoll.addSubview(image)
                
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(scrollTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    init() {
        super.init(frame:CGRect.zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.backgroundColor = .red
        
        imageSrcoll.frame = self.bounds
        imageSrcoll.isPagingEnabled = true
        imageSrcoll.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self .addSubview(imageSrcoll)
//        imageSrcoll.snp.makeConstraints { (make) in
//            make.edges.equalTo(self)
//        }
        
    
        pageController.currentPage = 0
        self.addSubview(pageController)
        pageController.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(imageSrcoll)
            make.height.equalTo(20);
        }
        
    }
    
    func scrollTimer(){
        if pageController.currentPage == pageController.numberOfPages - 1 {
            pageController.currentPage = 0
        }
        
        imageSrcoll.setContentOffset(CGPoint(x: self.frame.width * CGFloat(pageController.currentPage), y: 0), animated: true)
        pageController.currentPage += 1
        print(pageController.currentPage)
        
    }
}
