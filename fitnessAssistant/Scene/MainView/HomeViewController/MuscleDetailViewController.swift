//
//  MuscleDetailViewController.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 13.09.2024.
//

import UIKit

class MuscleDetailViewController: UIViewController {
    

    private var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addList))
        navigationItem.rightBarButtonItem?.tintColor = .projectRed
        view.backgroundColor = .white
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.height.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
    }
    
    func setComponensts(_ image : String){
        imageView.image = UIImage(named: image)
        
    }
    
     @objc private func addList(){
         guard let url = URL(string: "https://oguzhanatlan.online/api/post.php?api_key=key123&action=user_add")else{return}
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         let body:[String: Any] = [
                 "name":"kenan",
                 "surname":"birkan",
                 "username":"kenobirko",
                 "eposta":"kenobirko@gmail.com",
                 "password":"ramizsiken19",
                 "gender":1,
              ]
    
         request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
         let task = URLSession.shared.dataTask(with: request){ data , _, error in
             guard let data = data, error == nil else{
                 return
             }
              
             do {
                 let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                 print(response)
             }catch{
                 print(error)
             }
                
         }
         task.resume()
         
         
    }
    

}

