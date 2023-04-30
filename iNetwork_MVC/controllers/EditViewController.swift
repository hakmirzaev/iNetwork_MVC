//
//  EditViewController.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import UIKit

class EditViewController: BaseViewController {

    var post: Post = Post(title: "", body: "")
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func initView() {
        titleLabel.text = post.title!
        bodyLabel.text = post.body!
        
        title = "Edit Post"
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            showProgress()
            AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostCreate(post: Post(id: post.id!,title: titleLabel.text!, body: bodyLabel.text!)), handler: { response in
                self.hideProgress()
                switch response.result {
                case .success:
                    print(response.result)
                case let .failure(error):
                    print(error)
                }
            })
        }
        
        dismiss(animated: true, completion: nil)
    }
    

}
