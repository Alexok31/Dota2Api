//
//  Extension.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import UIKit

extension SearchPlayerVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        searchPlayerViewModel?.getPlayersInfo(searchText: searchText)
        self.view.endEditing(true)
    }
}
