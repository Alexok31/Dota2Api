//
//  PlayerCellTableViewCell.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import UIKit

class PlayerCellTableViewCell: UITableViewCell {

    @IBOutlet var playerAvatar: CustomImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.playerAvatar.layer.cornerRadius = self.playerAvatar.frame.height / 2
        }
    }
    
    var playerViewModel : PlayerCellViewModelType? {
        willSet(playerViewModel) {
            playerName.text = playerViewModel?.userName
            playerID.text = playerViewModel?.accountID
            playerAvatar.downloadImeg(from: playerViewModel?.avatarImgUrl)
        }
    }
}
