//
//  WearCollectionViewModel.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 26.07.2021.
//

import Foundation

struct WearCollectionViewModel{
    let wearList : [WearModel]
    
    func numberOfRowsInSection() -> Int {
        return self.wearList.count
    }
    
    func atIndexPath(_ index: Int) -> WearViewModel{
        let wear = self.wearList[index]
        return WearViewModel(wear: wear)
    }
}
