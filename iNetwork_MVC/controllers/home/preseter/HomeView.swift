//
//  HomeView.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import Foundation

protocol HomeView {
    func onLoadPosts(posts: [Post])
    func onPostDelete(deleted: Bool)
}
