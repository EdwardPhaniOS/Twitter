//
//  WelcomeViewController.swift
//  Twitter
//
//  Created by Tan Vinh Phan on 1/7/19.
//  Copyright © 2019 PTV. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // Do any additional setup after loading the view.
    //    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func loginDidTap(_ sender: Any)
    {
        (sender as! UIButton).alpha = 1.0
        
        // TODO: Login Anonymously here
        Auth.auth().signInAnonymously { (firUser, error) in
            if error == nil {
                //OK to go
                self.performSegue(withIdentifier: "Show Stories", sender: nil)
                
            } else
            {
                let alert = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    
    @IBAction func loginDidTouchDown(_ sender: Any)
    {
        (sender as! UIButton).alpha = 0.8
    }
    
}
