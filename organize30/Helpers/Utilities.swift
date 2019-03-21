//
//  Utilities.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit


func storyboardWith(name:String) -> UIStoryboard {
    let storyboard = UIStoryboard(name:name, bundle: Bundle.main)
    return storyboard
}

func getJsonWith(_ name:String)->Data?{
    if let path = Bundle.main.url(forResource:name, withExtension: "json") {
        do {
            let data = try Data(contentsOf:path, options: .alwaysMapped)
            return data
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
    } else {
        print("Invalid filename/path.")
    }
    
    return nil
}
