//
//  ProfileViewController.swift
//  moviesApp
//
//  Created by Metehan Özden on 9.09.2024.
//

import UIKit
import SnapKit
class ProfileViewController: UIViewController {
    
    
    let profileHeader = ProfilePhotoView(title: "Kenan")
    private var optionsButtonsTableView = UITableView(frame: .zero)
    weak var sharedPreferences = SharedPreferenceManager.instance
    //let image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    let optionsObject: [OptionsObject] = [
        OptionsObject(title: "Profili Düzenle", icon: "pencil", hasSwitch: false),
        OptionsObject(title: "Bildririmler", icon: "bell", hasSwitch: true),
        OptionsObject(title: "Şifremi Değiştir", icon: "key.horizontal", hasSwitch: false),
        OptionsObject(title: "Gizlilik Kuralları", icon: "hand.raised", hasSwitch: false),
        OptionsObject(title: "Çıkış Yap", icon: "rectangle.portrait.and.arrow.right", hasSwitch: false),

    ]
    
    private func setUI(){
        view.backgroundColor = .projectSmokeGray
        optionsButtonsTableView.dataSource = self
        optionsButtonsTableView.layer.cornerRadius = 15
        optionsButtonsTableView.clipsToBounds = true
        optionsButtonsTableView.isScrollEnabled = false
        self.navigationItem.title = "Profilim"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem?.tintColor = .projectRed
        
        optionsButtonsTableView.register(ProfileButtonTableViewCell.self, forCellReuseIdentifier: ProfileButtonTableViewCell.identifier)
                
        self.view.addSubview(profileHeader)
        profileHeader.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(150)
        }
        
        self.view.addSubview(optionsButtonsTableView)
        optionsButtonsTableView.snp.makeConstraints { make in
            make.height.equalTo(43 * optionsObject.count)
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(profileHeader.snp.bottom).offset(50)
        }
        

        
        

    }
        
    @objc private func logOut(){
        sharedPreferences?.clearAllPreference()
        
        let initVC = LoginViewModelBuilder.make()
        initVC.modalPresentationStyle = .fullScreen
        let navController = UINavigationController(rootViewController: initVC)
        navController.modalPresentationStyle = .fullScreen
        navController.navigationBar.isHidden = true
        self.present(navController, animated: true)
        print("logOut")
    }
    
    
}


extension ProfileViewController: UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  optionsObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileButtonTableViewCell.identifier, for: indexPath) as? ProfileButtonTableViewCell else {
            return UITableViewCell()
        }
        let title = optionsObject[indexPath.row].title
        let icon = optionsObject[indexPath.row].icon
        let hasToggle = optionsObject[indexPath.row].hasSwitch

            cell.configure(with: title, iconName: icon, hasToggle: hasToggle)
     
        
        return cell
    }
    
    
}

extension ProfileViewController: UITableViewDelegate{
    
}


 struct OptionsObject{
     var title:String
     var icon: String
     var hasSwitch: Bool
     init(title: String, icon: String, hasSwitch: Bool) {
        self.title = title
        self.icon = icon
        self.hasSwitch = hasSwitch
    }
}
