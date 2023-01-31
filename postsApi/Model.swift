//
//  Model.swift
//  postsApi
//
//  Created by MacOS on 22.10.2022.
//

import Foundation

struct Post: Hashable, Decodable{
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
}  // Создание структуры поста
