//
//  EditViewController.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import UIKit

class EditViewController: BaseViewController, EditView {

    var post: Post = Post(title: "", body: "")
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    
    var presenter: EditPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func initView() {
        titleLabel.text = post.title!
        bodyLabel.text = post.body!
        
        title = "Edit Post"
        
        presenter = EditPresenter()
        presenter.editView = self
        presenter.controller = self
    }
    
    func onEditPost(edited: Bool) {
        if edited {
            dismiss(animated: true, completion: nil)
        } else {
            // Error
            print("Error")
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            self.presenter.apiPostEdit(post: Post(id: post.id!, title: titleLabel.text!, body: bodyLabel.text!))
        }
    }
}
