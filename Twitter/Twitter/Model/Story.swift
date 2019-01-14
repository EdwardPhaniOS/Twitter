//
//  Story.swift
//  Twitter
//
//  Created by Tan Vinh Phan on 1/8/19.
//  Copyright © 2019 PTV. All rights reserved.
//

import Foundation
import Firebase

class Story
{
    var text: String = ""
    var numberOfLikes: Int = 0
    var numberOfAngry: Int = 0
    
    var ref: DatabaseReference!
    private var storiesRef = Database.database().reference().child("stories")
    
    init(text: String)
    {
        self.text = text
        ref = storiesRef.childByAutoId()
    }
    
    init(snapShot: DataSnapshot)
    {
        self.ref = snapShot.ref
        if let snapshotValue = snapShot.value as? [String : Any] {
            self.text = snapshotValue["text"] as! String
            self.numberOfLikes = snapshotValue["numberOfLikes"] as! Int
            self.numberOfAngry = snapshotValue["numberOfAngry"] as! Int
        }
    }
    
    func save() {
        ref.setValue(toAny())
    }
    
    func toAny() -> Any {
        return
            [
                "text" : text,
                "numberOfLikes" : numberOfLikes,
                "numberOfAngry" : numberOfAngry
        ]
    }
}

extension Story {
    
    func like()
    {
        self.numberOfLikes += 1
        ref.child("numberOfLikes").setValue(numberOfLikes)
    }
    
    func dislike()
    {
        self.numberOfAngry += 1
        ref.child("numberOfAngry").setValue(numberOfAngry)
    }
    
    
}
