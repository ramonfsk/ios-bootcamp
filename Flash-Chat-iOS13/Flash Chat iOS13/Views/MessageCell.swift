//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Ramon Ferreira on 06/08/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBuble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var lefImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.messageBuble.layer.cornerRadius = self.messageBuble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
