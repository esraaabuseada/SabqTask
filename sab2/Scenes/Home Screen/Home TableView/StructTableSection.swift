//
//  StructTableSection.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit
struct StructTableSection{
    var Header:String!   // for the section header
    var Cells: [Material]! // all the element in each section - Material obj
    var ShowHeader:Bool! // just added if we wan't to hide some section's heading
}
