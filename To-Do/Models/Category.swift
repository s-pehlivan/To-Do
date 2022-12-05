//
//  Category.swift
//  To-Do
//
//  Created by Sora on 5.12.2022.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    @Persisted var items = List<Item>()
}
