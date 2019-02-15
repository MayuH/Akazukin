//
//  FlowerViewController.swift
//  Wikitude
//
//  Created by 細土真優 on 2018/07/24.
//  Copyright © 2018年 細土真優. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class FlowerViewController: UIViewController, ARSCNViewDelegate{
    let scene = SCNScene(named: "cartoon_flower.scn")!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    //var count:Int = 0
    var num:Int = 0

    @IBOutlet weak var sceneView: ARSCNView!
    @IBAction func returnbtn(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "mainPage") as! MainViewController
        self.present(nextView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.scene = scene

        // Do any additional setup after loading the view.
    }

    @IBAction func tapSceneView(_ sender: UITapGestureRecognizer) {
        num = self.delegate.num!
        if(num==1){self.delegate.f1=1}
        else if(num==2){self.delegate.f2=1}
        else if(num==3){self.delegate.f3=1}
        else if(num==4){self.delegate.f4=1}
        else if(num==5){self.delegate.f5=1}
        let fnode = scene.rootNode.childNode(withName: "flower", recursively: true)
        fnode?.position = SCNVector3(-100, -2, 5)
        fnode?.rotation = SCNVector4(0, 1, 0, 0.5 * Double.pi)
        fnode?.scale = SCNVector3(0.5, 0.5, 0.5)
        self.sceneView.scene.rootNode.addChildNode(fnode!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
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
