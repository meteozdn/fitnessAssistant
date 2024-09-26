//
//  ProfileButtonTableViewCell.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 16.09.2024.
//

import UIKit

class ProfileButtonTableViewCell: UITableViewCell, SuperCell {

    static let identifier = "ProfileButtonTableViewCell"
    
      private let iconImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFit
          return imageView
      }()
      
      private let titleLabel: UILabel = {
          let label = UILabel()
          label.font = .systemFont(ofSize: 16)
          return label
      }()
      
    private let toggleSwitch: UISwitch = {
          let toggle = UISwitch()
          return toggle
      }()
      
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setUI()
      }
    
    func setUI()  {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(toggleSwitch)
        
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(15)
            make.centerY.equalToSuperview()
        }
        
        toggleSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }

    }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      public func configure(with title: String, iconName: String, hasToggle: Bool = false) {
          titleLabel.text = title
          //titleLabel.textColor = K.ColorConst.red
          iconImageView.image = UIImage(systemName: iconName)
          iconImageView.tintColor = K.ColorConst.red
          toggleSwitch.isHidden = !hasToggle
          toggleSwitch.onTintColor = K.ColorConst.red
          if !hasToggle {
              let goToPageIcon = UIImageView()
              goToPageIcon.image = UIImage(systemName: "chevron.right")
              goToPageIcon.tintColor = K.ColorConst.red
              self.contentView.addSubview(goToPageIcon)
              goToPageIcon.snp.makeConstraints { make in
                  make.right.equalToSuperview().offset(-15)
                  make.centerY.equalToSuperview()              }
              
          }
      }


    
}
