//
//  TestModel.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/26.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

protocol TestP {
    
}

protocol TestP2 {
    
}

typealias TestP3 = TestP & TestP2

class TestModel: NSObject, TestP3 {

}

class TestCell: NSObject {
    init(t:TestP3) {
        
    }
}
