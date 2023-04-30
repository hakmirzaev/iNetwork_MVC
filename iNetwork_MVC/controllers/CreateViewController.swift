//
//  CreateViewController.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import UIKit

class CreateViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func initView() {
        title = "Create Post"
    }

    @IBAction func createButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            showProgress()
            AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: Post(title: titleLabel.text!, body: bodyLabel.text!)), handler: { response in
                self.hideProgress()
                switch response.result {
                case .success:
                    print(response.result)
                    self.navigationController?.popViewController(animated: true)
                case let .failure(error):
                    print(error)
                }
            })
        }
    }
    
    

}
