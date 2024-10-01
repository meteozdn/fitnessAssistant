//
//  TrainingViewController.swift
//  moviesApp
//
//  Created by Metehan Özden on 9.09.2024.
//

import UIKit

class TrainingViewController: UIViewController {
    
    private var topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let categories = ["OMUZ":"shoulder", "GÖĞÜS":"chest", "SIRT":"back", "KOL" :"arms", "BACAK":"leg", "KARIN":"abs"]
    private var collectionsCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var places = [Place(name: "Ev", image: "house.fill"),Place(name: "Salon", image: "dumbbell.fill"),Place(name: "Dışarı", image: "tree.fill")]
    private var placeCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var viewModel: TrainViewModel?
    
    
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .black
        return sv
    }()
    
    
    private let contentView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .white
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.ColorConst.gray
        self.navigationController?.navigationBar.tintColor = UIColor.red
        
        setUI()
        scrollView.contentSize = contentView.frame.size
        
    }
    
    private func setUI(){
        
        
        
        self.navigationItem.title = "Antrenman"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewCollection))
        navigationItem.rightBarButtonItem?.tintColor = .projectRed
        
        setScrollView()
        
        
        
        let searchTextField = CustomTextField(authType: .search)
        contentView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.width.equalTo(screenWidth * 0.9)
            make.height.equalTo(screenWidth * 0.1)
            make.top.equalToSuperview().offset(100)
            
            make.centerX.equalToSuperview()
        }
        
        guard let imageButton = buttonWithImage(image: UIImage(named: "fitnessBanner1")!, text: "Günün Antrenmanı") else {return}
        imageButton.addTarget(self, action: #selector(addNewCollection), for: .touchUpInside)
        contentView.addSubview(imageButton)
        imageButton.snp.makeConstraints { make in
            make.width.equalTo(screenWidth * 0.9)
            make.height.equalTo(screenWidth * 0.3)
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            
        }
        
        let muscleCategoryLabel = generateTitle("Kas Grubu")
        contentView.addSubview(muscleCategoryLabel)
        muscleCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(imageButton.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.left.right.equalToSuperview().inset(20)
        }
        
        let topLayout = UICollectionViewFlowLayout()
        topLayout.scrollDirection = .horizontal
        topLayout.itemSize = CGSize(width: screenWidth * 0.50, height: screenWidth * 0.30)
        topCollectionView = setCollectionView(layout: topLayout, tag: 1, cell: ReadyCategoryCollectionViewCell.self)
        topCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(screenWidth * 0.3)
            make.top.equalTo(muscleCategoryLabel.snp.bottom).offset(10)
        }
        
        let placeLabel = generateTitle("Mekan")
        contentView.addSubview(placeLabel)
        placeLabel.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.left.right.equalToSuperview().inset(20)
        }
        
        let placeCVLayout = UICollectionViewFlowLayout()
        placeCVLayout.scrollDirection = .horizontal
        placeCVLayout.itemSize = CGSize(width: screenWidth * 0.28, height: screenWidth * 0.28)
        placeCVLayout.minimumLineSpacing = 11
        placeCV = setCollectionView(layout: placeCVLayout, tag: 2, cell: PlaceCollectionViewCell.self)
        
        placeCV.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(screenWidth * 0.3)
            make.top.equalTo(placeLabel.snp.bottom).offset(10)
        }
        
        
        let readyCategoryLabel = generateTitle("Hazır Kategoriler")
        contentView.addSubview(placeLabel)
        readyCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(placeCV.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.left.right.equalToSuperview().inset(20)
        }
        let readyCollectionLayout = UICollectionViewFlowLayout()
        readyCollectionLayout.scrollDirection = .horizontal
        readyCollectionLayout.itemSize = CGSize(width: screenWidth * 0.3, height: screenWidth * 0.6)
        collectionsCV = setCollectionView(layout: readyCollectionLayout, tag: 3, cell: ReadyCategoryCollectionViewCell.self)
        collectionsCV.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(screenWidth * 0.6)
            make.top.equalTo(readyCategoryLabel.snp.bottom).offset(10)
        }
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionsCV.snp.bottom).offset(50)
        }
        
    }
    
    private func generateTitle(_ title: String)-> UILabel{
        let readyCategoryLabel = UILabel()
        readyCategoryLabel.text = title
        readyCategoryLabel.font = .systemFont(ofSize: 20, weight: .bold)
        contentView.addSubview(readyCategoryLabel)
        return readyCategoryLabel
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        scrollView.backgroundColor = .white
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        scrollView.contentInsetAdjustmentBehavior = .never
        
    }
    
    private func setCollectionView(layout: UICollectionViewFlowLayout, tag: Int, cell: SuperCell.Type) -> UICollectionView{
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.tag = tag
        cv.delegate = self
        cv.register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        contentView.addSubview(cv)
        return cv
    }
    
    
    @objc private func addNewCollection(){
        let alert = UIAlertController(title: "Yeni Koleksiyon", message: "Kolleksiyon Eklensin mi", preferredStyle: .alert)
        let action = UIAlertAction(title: "Kolleksiyon Ekle", style: .default) { (action) in
            print("success")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


extension TrainingViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsSelection = true
        //viewModel?.getDailyExercise()
        if collectionView.tag == 1 {
            navigationController?.pushViewController(ExerciseViewModelBuilder.make(id: indexPath.row ), animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 2 {
            return 3
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceCollectionViewCell.identifier, for: indexPath) as! PlaceCollectionViewCell
            cell.layoutIfNeeded()
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            cell.configure(place: places[indexPath.row])
            return cell
        }else{
            let sortedCategory = categories.map { $0 }
            let category = sortedCategory[indexPath.row]
            let name = category.key
            let image = category.value
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadyCategoryCollectionViewCell.identifier, for: indexPath) as! ReadyCategoryCollectionViewCell
            cell.setupCell(title: name, image: image)
            cell.layoutIfNeeded()
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        }
    }
    
    
}

