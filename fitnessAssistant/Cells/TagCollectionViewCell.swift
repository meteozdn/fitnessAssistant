//
//  TagCollectionViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 19.09.2024.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"
    
    let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCell(){
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(label)
        
        // Layout with SnapKit
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    func configure(with text: String) {
        label.text = text
    }
}
