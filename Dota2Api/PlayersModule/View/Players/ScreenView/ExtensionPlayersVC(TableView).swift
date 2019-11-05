//
//  Extension(CollectionView).swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//


import UIKit

extension PlayersVC : UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerTableViewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PlayerCellTableViewCell
        let playerCellViewModel = playerTableViewModel?.profileCell(for: indexPath)
        cell.playerViewModel = playerCellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        playerTableViewModel?.selectRow(atIndexPath: indexPath)
        switch editingStyle {
        case .delete:
            playerTableViewModel?.removeFromFavorite()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
