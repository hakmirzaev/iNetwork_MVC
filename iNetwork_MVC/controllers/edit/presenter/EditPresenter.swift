//
//  EditPresenter.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import Foundation

protocol EditPresenterProtocol {
    func apiPostEdit(post: Post)
}

class EditPresenter: EditPresenterProtocol {
    
    var editView: EditView!
    var controller: BaseViewController!
    
    func apiPostEdit(post: Post) {
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                self.editView.onEditPost(edited: true)
            case let .failure(error):
                print(error)
                self.editView.onEditPost(edited: false)
            }
        })
    }
    
}
