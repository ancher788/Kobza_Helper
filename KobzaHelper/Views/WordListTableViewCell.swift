//
//  WordListTableViewCell.swift
//  KobzaHelper
//
//  Created by Anatolii Chernetskyi on 25.11.2023.
//

import UIKit

import UIKit

class WordListTableViewCell: UITableViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    func configure(with word: Word, at index: Int) {
        let formattedIndex = String(format: "%04d", index + 1)
        indexLabel.text = formattedIndex
        wordLabel.text = word.string
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
