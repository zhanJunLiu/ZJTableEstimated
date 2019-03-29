//
//  TestTableViewCell.swift
//  TestDispatch
//
//  Created by 劉戰軍 on 2019/3/28.
//  Copyright © 2019年 liuzhanjun. All rights reserved.
//
import UIKit

class TestTableViewCell: UITableViewCell {
    
    public var content: String? {
        didSet {
            dynamicHeight = 100
            self.textLabel?.text = content
        }
    }
    
    private (set) public var dynamicHeight: CGFloat = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
