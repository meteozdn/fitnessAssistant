//
//  ReadyCategoryCollectionViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 12.09.2024.
//

import UIKit

class ReadyCategoryCollectionViewCell: UICollectionViewCell, SuperCell {
    
    static let identifier = "ReadyCategoryCollectionViewCell"
    
    private var label = UILabel()
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCell(){
        contentView.backgroundColor = K.ColorConst.gray
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "fitnessBanner1")
        imageView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(label)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = "OMUZ"
        label.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(10)

        }
        
    }
    
    public func setupCell(title :String, image: String, hasDetail: Bool = false){
        DispatchQueue.main.async {
            self.label.text = title
            self.imageView.image = UIImage(named: image)
            if hasDetail{
                self.setDetails(time: "20dk", difficult: "ZOR")
            }
        }
    }
    
    private func setDetails(time: String, difficult: String){
    
        let timeLabel = UILabel()
        let difficultLabel = UILabel()
        
        timeLabel.text = time
        contentView.addSubview(timeLabel)
        timeLabel.font = .systemFont(ofSize: 10, weight: .bold)
        timeLabel.textColor = .white

        timeLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        /*
        difficultLabel.text = difficult
        contentView.addSubview(difficultLabel)
        difficultLabel.font = .systemFont(ofSize: 10, weight: .bold)
        difficultLabel.textColor = .white
        difficultLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(difficultLabel.snp.bottom).offset(10)
        }*/
        
    }
    
}
