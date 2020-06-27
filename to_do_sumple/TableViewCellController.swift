//
//  TableViewCellController.swift
//  to_do_sumple
//
//  Created by itsuki kaji on 2020/06/15.
//  Copyright © 2020 itsuki kaji. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
@IBOutlet private weak var personLabel: UILabel!
@IBOutlet private weak var doLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
