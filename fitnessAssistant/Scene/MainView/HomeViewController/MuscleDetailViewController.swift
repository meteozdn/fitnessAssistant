//
//  MuscleDetailViewController.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 13.09.2024.
//

import UIKit

class MuscleDetailViewController: UIViewController, UICollectionViewDelegate {

    
    
    private var imageView = UIImageView()
    private var descriptionLabel = UILabel()
    private var subMusclesCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var muscles: [Category] = []
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
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth * 0.27, height: screenWidth * 0.6)
        subMusclesCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        subMusclesCV.delegate = self
        subMusclesCV.dataSource = self
        subMusclesCV.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        view.addSubview(subMusclesCV)
        subMusclesCV.snp.makeConstraints { make in
            make.left.right.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(100)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.snp.makeConstraints { make in
            make.left.right.equalTo(imageView)
            make.top.equalTo(subMusclesCV.snp.bottom).offset(20)
        }


        
    }
    
    func setComponensts( image : String, description: String, muscles: [Category]){
        imageView.image = UIImage(named: image)
        descriptionLabel.text = description
        DispatchQueue.main.async {
            self.muscles = muscles
            self.subMusclesCV.reloadData()
        }
    }
    
    @objc private func addList(){
        print("add")
    }

}

extension MuscleDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        muscles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
        cell.configure(with: muscles[indexPath.row].exerciseName ?? "")
        print("aaa")
        return cell
    }
}
