//
//  Post.swift
//  iNetwork_MVC
//
//  Created by Bekhruz Hakmirzaev on 30/04/23.
//

import Foundation

struct Post: Decodable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init() {
        
    }
    
    init(title: String, body: String) {
        self.userId = 1
        self.id = 1
        self.body = body
        self.title = title
    }
    
    init(id: Int, title: String, body: String) {
        self.userId = 1
        self.id = id
        self.body = body
        self.title = title
    }
}
