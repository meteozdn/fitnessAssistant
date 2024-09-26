//
//  TrainCollectionViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 16.09.2024.
//

import UIKit

class TrainCollectionViewCell: UICollectionViewCell, SuperCell {
    
    
    static let identifier = "TrainCollectionViewCell"
    
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
       // imageView.image = UIImage(named: "fitnessBanner1")
        imageView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(label)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = ""
        label.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(10)

        }
        
    }
    
    public func setupCell(title :String, image: String){
        DispatchQueue.main.async {
            self.label.text = title
            self.imageView.image = UIImage(named: image)
        }
        
    }
}
    

