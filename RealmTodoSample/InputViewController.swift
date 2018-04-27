//
//  InputViewController.swift
//  RealmTodoSample
//
//  Created by 佐山絢 on 2018/04/27.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {

    let field = UITextField()
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = self.view.bounds.width
        let viewHeight = self.view.bounds.height

        navigationItem.title = "Add your task"
        
        field.frame = CGRect(x: viewWidth / 4, y: viewHeight / 3 + 70, width: viewWidth / 2, height: 30)
        field.placeholder = "write your task"
        self.view.addSubview(field)
        
        btn.frame = CGRect(x: viewWidth / 4, y: viewHeight / 2, width: viewWidth / 2, height: 40)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 20.0
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(self.CreateTask(sender:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func CreateTask(sender: AnyObject){
        let newTodo = Todo()
        newTodo.title = field.text!
        
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTodo)
                print("Saved")
            })
        } catch {
            print("Failed")
        }
        field.text = ""
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
