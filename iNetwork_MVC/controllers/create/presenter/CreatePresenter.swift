//
//  CreatePresenter.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import Foundation

protocol CreatePresenterProtocol {
    func apiPostCreate(post: Post)
}

class CreatePresenter: CreatePresenterProtocol {
    
    var createView: CreateView!
    var controller: BaseViewController!
    
    func apiPostCreate(post: Post) {
        controller?.showProgress()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                self.createView.onCreatePost(created: true)
            case let .failure(error):
                print(error)
                self.createView.onCreatePost(created: false)
            }
        })
    }
    
}
