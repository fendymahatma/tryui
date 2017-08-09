//
//  ViewController.swift
//  klikchat
//
//  Created by ajiejoy on 8/9/17.
//  Copyright © 2017 ajiejoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollContent = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        let widhButton = view.frame.width / 4
        for i in 0..<4 {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: widhButton * CGFloat(i), y: 0, width: widhButton, height: 50)
            button.setTitle("\(i)", for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(selectContentFromButton(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        
        scrollContent.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height - 50)
        scrollContent.contentSize = CGSize(width: view.frame.width, height: view.frame.height - 50)
        scrollContent.isPagingEnabled = true
        view.addSubview(scrollContent)
        
        
        let friend = FriendController()
        friend.view.frame = CGRect(x: 0, y: 0, width: scrollContent.frame.width, height: scrollContent.frame.height)
        scrollContent.addSubview(friend.view)
        addChildViewController(friend)
        
        let chat = ChatController()
        chat.view.frame = CGRect(x: view.frame.width, y: 0, width: scrollContent.frame.width, height: scrollContent.frame.height)
        scrollContent.addSubview(chat.view)
        addChildViewController(chat)
        
        let timeline = TimelineController()
        timeline.view.frame = CGRect(x: view.frame.width * 2, y: 0, width: scrollContent.frame.width, height: scrollContent.frame.height)
        scrollContent.addSubview(timeline.view)
        addChildViewController(timeline)
        
        let more = MoreController()
        more.view.frame = CGRect(x: view.frame.width * 3, y: 0, width: scrollContent.frame.width, height: scrollContent.frame.height)
        scrollContent.addSubview(more.view)
        addChildViewController(more)
    }

    func selectContentFromButton(sender: UIButton) {
        scrollContent.contentOffset = CGPoint(x: scrollContent.frame.width * CGFloat(sender.tag), y: 0)
    }

}

