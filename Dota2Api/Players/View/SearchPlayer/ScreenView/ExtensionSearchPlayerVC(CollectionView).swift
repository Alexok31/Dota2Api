//
//  ExtensionCollectionView.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import UIKit

extension SearchPlayerVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchPlayerCollectionViewModel?.numberOfRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlayerCellCollectionViewCell
        let playerCellViewModel = searchPlayerCollectionViewModel?.profileCell(for: indexPath)
        cell.playerViewModel = playerCellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchPlayerCollectionViewModel?.selectRow(atIndexPath: indexPath)
        searchPlayerCollectionViewModel?.addToFavorite()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = collectionView.frame.width - 48
        let heightCell = widthCell * 0.23
        return CGSize(width: widthCell, height: heightCell)
    }
}
