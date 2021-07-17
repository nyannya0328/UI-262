//
//  Post.swift
//  UI-262
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL : String
}
