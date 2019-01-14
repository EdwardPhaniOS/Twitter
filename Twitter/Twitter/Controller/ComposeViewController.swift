//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Tan Vinh Phan on 1/7/19.
//  Copyright © 2019 PTV. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var postBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = postBarButton
        
        title = "What is your story?"
        
        storyTextView.text = ""
        storyTextView.becomeFirstResponder()
    }
    
    
    @IBAction func postBarDidTouch(_ sender: UIBarButtonItem)
    {
        if storyTextView.text != "" {
            let newStory = Story(text: storyTextView.text)
            newStory.save()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
