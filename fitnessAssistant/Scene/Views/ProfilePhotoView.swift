//
//  ProfilePhoto.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import UIKit

class ProfilePhotoView: UIView {


    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "fitnessBanner1")
        iv.layer.cornerRadius = 50
        iv.layer.borderWidth = 3
        iv.layer.masksToBounds = false
        iv.clipsToBounds = true
        iv.tintColor = K.ColorConst.red
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "error"
        return label
    }()
    
    
    init(title: String) {
        super.init(frame: .zero)
        self.nameLabel.text = title
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        self.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(100)
            make.centerX.equalToSuperview()
        }
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()

        }
        
    }
    
    
    public func configUI(){
        
    }
    
    
    
    

}
