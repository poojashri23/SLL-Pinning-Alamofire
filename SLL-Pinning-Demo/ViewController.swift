//
//  ViewController.swift
//  SLL-Pinning-Demo
//
//  Created by Admin on 09/03/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var sessionManager = SessionManager()
    let customSessionDelegate = CustomSessionDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        demoApi()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func demoApi() {
        sessionManager = SessionManager(
            delegate: customSessionDelegate, // Feeding our own session delegate
            serverTrustPolicyManager: CustomServerTrustPolicyManager(
                policies: [:]
            )
        )
        
        sessionManager.request("https://103.69.169.10:10814/auth/guest", method: .post, parameters: ["source":"mobile"], encoding: JSONEncoding.default, headers: ["Content-Type":"application/json","Accept":"application/json"]).responseJSON { (response) in
            print(response.value)
        }
    }


}

