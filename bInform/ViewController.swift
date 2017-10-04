//
//  ViewController.swift
//  bInform
//
//  Created by Darin Williams on 9/27/17.
//  Copyright © 2017 dwilliams. All rights reserved.
//  import your Audio Video Foundation
//  add your AVCaptureMetaDataOutputObjectDelegate

import UIKit
import AVFoundation
import Firebase
import FirebaseAuth


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVCaptureMetadataOutputObjectsDelegate {
    
    //added a comment  this will come from database
    var recallItems: [String] = ["In123478","IN345677","IN678900"]
    
    var saftyItems: [String] = ["Rpt334568","Rpt878930","Rpt764893"]
    
    //Contains the Video, when the user utilize the camera
    //user will will see what camera is pointing at
    @IBOutlet var recallTblView: UITableView!
    
    @IBOutlet var safetyTblView: UITableView!
    
    @IBOutlet weak var emailAddr: UITextField!
  
    @IBOutlet var passWord: UITextField!
    
    
    @IBOutlet weak var unCheckBox: UIButton!
    
    var checkBox = UIImage(named: "checkBox")
    
    var uncheckBox = UIImage(named: "uncheckBox")
    
    var isBoxClicked:Bool!
    
    /** @var handle
     @brief The handler for the auth state listener, to allow cancelling later.
     */
    var handle: AuthStateDidChangeListenerHandle?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //code
        var count:Int?
        
        if tableView == self.recallTblView{
            count = self.recallItems.count
        }
        
        if tableView == self.safetyTblView{
            count = self.saftyItems.count
        }
        
        return count!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        var cellData:UITableViewCell?
        
        if tableView == self.recallTblView{
        
             cellData = self.recallTblView.dequeueReusableCell(withIdentifier: "RecallCell", for: indexPath) as UITableViewCell!
            
             cellData!.textLabel!.text = self.recallItems[indexPath.row]
        }
        
        if tableView == self.safetyTblView{
            
            
            cellData = self.safetyTblView.dequeueReusableCell(withIdentifier: "SafetyCell", for: indexPath) as UITableViewCell!
      
            cellData!.textLabel!.text = self.saftyItems[indexPath.row]
            
        }
        
        
        return cellData!;
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        NSLog("Cell #\(indexPath.row)!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isBoxClicked = false
        
        // Register tableview
        self.recallTblView.register(UITableViewCell.self, forCellReuseIdentifier: "RecallCell")
    
        
        self.safetyTblView.register(UITableViewCell.self, forCellReuseIdentifier: "SafetyCell")
   
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func Login(_ sender: Any) {
        NSLog("Login")
        
        let emailAddr = self.emailAddr.text
        let psswd = self.passWord.text
        
        if self.emailAddr.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailAddr!, password: psswd!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    

    @IBAction func ClickBox(_ sender: UIButton) {
        NSLog("clickBox")
        
        if isBoxClicked == true{
            isBoxClicked = false
        }else{
            isBoxClicked = true
        }
        
        
        if isBoxClicked == true{
            sender.setImage(#imageLiteral(resourceName: "checkBox"), for: UIControlState.normal )
        }else{
          
            sender.setImage(#imageLiteral(resourceName: "uncheckBox"), for: UIControlState.normal)
        }
    }
    

}

