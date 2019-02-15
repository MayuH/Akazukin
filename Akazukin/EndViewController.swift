//
//  EndViewController.swift
//  Wikitude
//
//  Created by 細土真優 on 2018/07/24.
//  Copyright © 2018年 細土真優. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        self.delegate.f1=0
        self.delegate.f2=0
        self.delegate.f3=0
        self.delegate.f4=0
        self.delegate.f5=0
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
