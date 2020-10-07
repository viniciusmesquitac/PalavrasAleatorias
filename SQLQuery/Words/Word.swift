//
//  WordsMigration.swift
//  TestSQLQuery
//
//  Created by Vinicius Mesquita on 06/10/20.
//

import Foundation
import SQLite

struct Word {
    
    static let scheme = Table("words")
    
    let id = Expression<Int>("id")
    let count = Expression<Int>("count")
    let word = Expression<String>("word")
    let character = Expression<String>("character")
}

