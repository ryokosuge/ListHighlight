//
//  Item.swift
//  ListHighlight
//
//  Created by nagisa-kosuge on 2017/09/05.
//  Copyright © 2017年 RyoKosuge. All rights reserved.
//

import UIKit

struct Item {

    let name: String
    let color: UIColor

    static func generates() -> [Item] {
        let blue = Item(name: "Blue", color: .blue)
        let yellow = Item(name: "Yellow", color: .yellow)
        let red = Item(name: "red", color: .red)
        let black = Item(name: "Black", color: .black)
        let green = Item(name: "Green", color: .green)
        return [blue, yellow, red, black, green]
    }
}
