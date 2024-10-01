//
//  PlaceCollectionViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell, SuperCell {
    
    
    static let identifier = "PlaceCollectionViewCell"
    
    private var label = UILabel()
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell(){
        
            contentView.backgroundColor = K.ColorConst.darkGray
            contentView.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            //imageView.layer.cornerRadius = 10
           // imageView.clipsToBounds = true
            imageView.image = UIImage(systemName: "tree")
            imageView.tintColor = .white
            imageView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(10)
               // make.top.equalToSuperview().inset(30)
                make.height.width.equalTo(60)
            }
            
            contentView.addSubview(label)
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 15, weight: .bold)
            label.textColor = .white
            label.text = "EV"
            label.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            }

    }
    func configure(place: Place){
        label.text = place.name
        imageView.image = UIImage(systemName: place.image)
    }
}

struct Place {
    let name: String
    let image: String
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
