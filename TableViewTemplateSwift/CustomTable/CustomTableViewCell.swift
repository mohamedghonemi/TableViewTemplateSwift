//
//  CustomTableViewCell.swift
//  TableViewTemplateSwift
//
//  Created by Developer on 11/14/16.
//  Copyright © 2016 Tatbiqy. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func buttonDidTapped(_ cell:CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var customLabel: UILabel!
    //
    @IBOutlet weak var customButton: UIButton!
    
    //MARK: - Memeber variables
    var index:IndexPath? = nil
    weak var delegate:CustomTableViewCellDelegate? = nil
    var dataModel:CustomDataType? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    ///Configure cell with data model
    func configureCell(_ dataModel: CustomDataType) {
        self.dataModel = dataModel
        //Configure cell UI with the data model
        //Example
        customLabel.text = dataModel.customString
    }
    
    //MARK: - Actions
    
    @IBAction func customButtonTapped(_ sender: UIButton) {
        delegate?.buttonDidTapped(self)
    }
}
