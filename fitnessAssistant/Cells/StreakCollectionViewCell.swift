//
//  StreakTableViewViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 11.09.2024.
//

import UIKit

class StreakCollectionViewViewCell: UICollectionViewCell {
    
    static let identifier = "StreakCollectionViewCell"
    
    private var label = UILabel()
    private let dot = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createCell(){
        contentView.addSubview(label)
        dot.text = "."
        dot.textAlignment = .center
        contentView.addSubview(dot)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        dot.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.left.right.equalTo(label)
        }
    }
    
    func setDone(_ title: String, done: Bool){
        DispatchQueue.main.async {
            self.label.text = "\(title)"
            self.label.font = .systemFont(ofSize: 15, weight: .bold)
            self.label.textColor = done ? K.ColorConst.red : .gray
            self.label.textAlignment = .center
            self.dot.font = .systemFont(ofSize: 25, weight: .bold)
            self.dot.textColor = done ? K.ColorConst.red : .gray
        }
    }
    

}
