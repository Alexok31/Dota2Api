//
//  PlayerCellCollectionViewCell.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit

class PlayerCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var playerAvatar: CustomImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        playerAvatar.layer.cornerRadius = playerAvatar.frame.height / 2
    }
    
    var playerViewModel : PlayerCellViewModelType? {
        willSet(playerViewModel) {
            playerName.text = playerViewModel?.userName
            playerID.text = playerViewModel?.accountID
            playerAvatar.downloadImeg(from: playerViewModel?.avatarImgUrl)
        }
    }

}
