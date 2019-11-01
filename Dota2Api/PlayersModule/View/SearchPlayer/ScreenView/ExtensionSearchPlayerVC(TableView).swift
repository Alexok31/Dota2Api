//
//  ExtensionCollectionView.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import UIKit

extension SearchPlayerVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchPlayerTableViewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PlayerCellTableViewCell
        let playerCellViewModel = searchPlayerTableViewModel?.profileCell(for: indexPath)
        cell.playerViewModel = playerCellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchPlayerTableViewModel?.selectRow(atIndexPath: indexPath)
        searchPlayerTableViewModel?.addToFavorite()
        dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
