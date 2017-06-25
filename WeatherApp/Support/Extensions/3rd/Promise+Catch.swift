//
//  Promise+Catch.swift
//  iGuru
//
//  Created by Yaroslav Bondar on 18.01.17.
//  Copyright © 2017 Yaroslav Bondar. All rights reserved.
//

import PromiseKit

extension Promise {
    func catchAndLog() {
        self.catch { error in
            print(error)
        }
    }
}
