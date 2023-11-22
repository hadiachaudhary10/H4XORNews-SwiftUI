//
//  PostData.swift
//  H4XORNews-SwiftUI
//
//  Created by Dev on 25/08/2022.
//

import Foundation

struct Results: Decodable {
    
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable{
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    var id: String{
        return objectID
    }
    
}
