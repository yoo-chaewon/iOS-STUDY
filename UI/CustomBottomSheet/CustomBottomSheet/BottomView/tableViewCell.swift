//
//  tableViewCellTableViewCell.swift
//  CustomBottomSheet
//
//  Created by yoo chae won on 2020/03/06.
//  Copyright © 2020 yoo chae won. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
