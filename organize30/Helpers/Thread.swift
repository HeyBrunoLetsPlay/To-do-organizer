//
//  Thread.swift
//  GlobosatPlayTV
//
//  Created by Bárbara Carvalho Silveira on 19/04/18.
//  Copyright © 2018 Globosat Programadora. All rights reserved.
//

import Foundation

func executeInBackground(_ completion: @escaping () -> Void ) {
    DispatchQueue.global(qos: .background).async {
        completion()
    }
}

func executeOnMainQueue(_ completion: @escaping () -> Void ) {
    if Thread.isMainThread {
        completion()
    } else {
        DispatchQueue.main.async(execute: {
            completion()
        })
    }
}
