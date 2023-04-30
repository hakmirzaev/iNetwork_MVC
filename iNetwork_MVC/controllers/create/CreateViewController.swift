//
//  CreateViewController.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    
    var presenter: CreatePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func onCreatePost(created: Bool) {
        if created {
            self.navigationController?.popViewController(animated: true)
        } else {
            // Error
            print("Error")
        }
    }
    
    func initView() {
        title = "Create Post"
        
        presenter = CreatePresenter()
        presenter.createView = self
        presenter.controller = self
    }

    @IBAction func createButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            self.presenter.apiPostCreate(post: Post(title: titleLabel.text!, body: bodyLabel.text!))
        }
    }
    
    

}
