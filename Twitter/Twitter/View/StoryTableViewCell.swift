//
//  StoryTableViewCell.swift
//  Twitter
//
//  Created by Tan Vinh Phan on 1/7/19.
//  Copyright © 2019 PTV. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    fileprivate let likeColor = UIColor(red: 243.0/255.0, green: 62.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    fileprivate let angryColor = UIColor(red: 155.0/255.0, green: 53.0/255.0, blue: 181.0/255.0, alpha: 1.0)
    
    var story: Story! {
        didSet {
            self.storyLabel.text = story.text
            self.likeLabel.setTitle("😍 \(story.numberOfLikes)", for: UIControl.State.normal)
            self.angryLabel.setTitle("😈 \(story.numberOfAngry)", for: UIControl.State.normal)
        }
    }
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var likeLabel: UIButton!
    @IBOutlet weak var angryLabel: UIButton!
    
    
    @IBAction func likeButtonDidTap(_ sender: Any)
    {
        story.like()
        likeLabel.setTitle("😍 \(story.numberOfLikes)", for: UIControl.State.normal)
        likeLabel.setTitleColor(likeColor, for: UIControl.State.normal)
    }
    
    @IBAction func angryButtonDidTap(_ sender: Any)
    {
        story.dislike()
        angryLabel.setTitle("😈\(story.numberOfAngry)", for: UIControl.State.normal)
        angryLabel.setTitleColor(angryColor, for: UIControl.State.normal)
    }
    
}
