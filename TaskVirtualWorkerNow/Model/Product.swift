//
//  Product.swift
//  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/19/22.
//

import Foundation
struct Product :Codable,Hashable{
    let productName : String
    let productInfo : String
    let meal        : String
    let itemType    : String
    let Price       : String
    let image       : [String]
}
