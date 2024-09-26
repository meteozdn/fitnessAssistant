//
//  ExercisesTableViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 23.09.2024.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {
    static let identifier = "ExercisesTableViewCell"
    
    var exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    var iconImage: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = K.ColorConst.red
        iv.image = UIImage(systemName: "dumbbell")
        return iv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        contentView.addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        contentView.addSubview(exerciseNameLabel)
        exerciseNameLabel.text = "exercise123"
        exerciseNameLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    public func configure(_ title : String){
        exerciseNameLabel.text = title
    }
    
}
