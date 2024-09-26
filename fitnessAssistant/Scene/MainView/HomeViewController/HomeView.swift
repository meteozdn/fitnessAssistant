//
//  HomeViewController.swift
//  moviesApp
//
//  Created by Metehan Özden on 9.09.2024.
//
import UIKit
import DGCharts
import Lottie
class HomeViewController:UIViewController, UICollectionViewDelegate  {
    
    //MARK: -Variables
    private var topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var muscles = [Category]()
    private let days = ["Pzt", "Sal", "Çrş", "Prş", "Cum", "Cmt", "Pzr"]
    private let imagesPath = [ "chest","shoulder","arms", "back", "leg", "butt", "abs"]
   //TODO: Modelle(Dynamic)
    var viewModel: HomeViewModel?
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
    
    
    var helloTextLabel: UILabel = {
       let object = UILabel()
        object.font = .systemFont(ofSize: 40)
        object.textColor = .projectRed
        object.numberOfLines = 0
        return object
    }()

    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        setUI()
        viewModel?.getMuscleCategories()

    }
    
    @objc func goToProfile(){
        print("goToProfile")
    }
    
    
    private func setUI() {

        //Day Streaks
        let topLayout = UICollectionViewFlowLayout()
        topLayout.scrollDirection = .horizontal
        topLayout.itemSize = CGSize(width: screenWidth / 8.5, height: 70)
        topLayout.minimumLineSpacing = 5

        topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: topLayout)
        topCollectionView.tag = 1
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(StreakCollectionViewViewCell.self, forCellWithReuseIdentifier: StreakCollectionViewViewCell.identifier)
        topCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
      
        //Exercises
        let bottomLayout = UICollectionViewFlowLayout()
        bottomLayout.itemSize = CGSize(width: screenWidth * 0.27, height: screenWidth * 0.6)
        bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: bottomLayout)
        bottomCollectionView.tag = 2
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        bottomCollectionView.register(ReadyCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ReadyCategoryCollectionViewCell.identifier)
            
        //NavigationBar
        self.navigationItem.title = "12 Ekim"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(goToProfile))
        navigationItem.rightBarButtonItem?.tintColor = .projectRed
        
        setScrollView()
        setHeader(name: "Kenan")
        /*
        guard let imageButton = buttonWithImage(image: UIImage(named: "fitnessBanner1")!, text: "Günün Antrenmanı") else {return}

        contentView.addSubview(imageButton)
        imageButton.snp.makeConstraints { make in
            make.width.equalTo(screenWidth * 0.9)
            make.height.equalTo(screenWidth * 0.3)
            make.top.equalTo(topCollectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        */

    }
    
}



extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return days.count
        }else {
            return muscles.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreakCollectionViewViewCell.identifier, for: indexPath) as! StreakCollectionViewViewCell
            cell.setDone(days[indexPath.row], done: indexPath.row < 5 ? true : false)
            return cell

        }else{

            let name = muscles[indexPath.row].exerciseName
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadyCategoryCollectionViewCell.identifier, for: indexPath) as! ReadyCategoryCollectionViewCell
            let image = imagesPath[indexPath.row]
            cell.setupCell(title: name!, image: image)
            cell.layoutIfNeeded()
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 2{
            let name = muscles[indexPath.row].exerciseName!
            let image = imagesPath[indexPath.row]
            let descriptions = muscles[indexPath.row].categoriesDescription
            let muscles = muscles[indexPath.row].subCategories
            print("subss----------\(muscles))")
            let rootVC = MuscleDetailViewController()
            rootVC.title = name
            let navVC = UINavigationController(rootViewController: rootVC)
            rootVC.setComponensts(image: image, description: descriptions ?? "No desc", muscles: muscles ?? [])
            present(navVC,animated: true)
        }
    }
    

    

 
}

extension HomeViewController: UITableViewDelegate {
    
}


extension HomeViewController{
    //ScrollView func
    private func setScrollView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.width.height.top.bottom.equalTo(self.scrollView)
        }
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    //Header func
    private func setHeader(name:String){
        
        let helloText = "Hoşgeldin\n\(name)"
        let attributedHelloText = NSMutableAttributedString(string: helloText)
        attributedHelloText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 9))
        let boldFont = UIFont.boldSystemFont(ofSize: 40)
        attributedHelloText.addAttribute(.font, value: boldFont, range: NSRange(location: 9, length: helloText.count-9))

        helloTextLabel.attributedText = attributedHelloText
        contentView.addSubview(helloTextLabel)
        helloTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
        
        let streakCountLabel = UILabel()
        let streakCountText = "5"
        streakCountLabel.font = .systemFont(ofSize: 50, weight: .bold)
        streakCountLabel.textColor = .projectRed
        streakCountLabel.text = streakCountText
        streakCountLabel.textAlignment = .center
        view.addSubview(streakCountLabel)
        streakCountLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(helloTextLabel.snp.height)
            make.height.equalTo(helloTextLabel).inset(20)
            make.top.equalTo(helloTextLabel).inset(10)
        }
        let streakLabel = UILabel()
        let streakText = "Günlük Seri"
        streakLabel.text = streakText
        streakLabel.font = .systemFont(ofSize: 15)
        streakLabel.textAlignment = .center
        view.addSubview(streakLabel)
        streakLabel.snp.makeConstraints { make in
            make.top.equalTo(streakCountLabel.snp.bottom)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(helloTextLabel.snp.height)
        }
        
        view.addSubview(topCollectionView)
        topCollectionView.snp.makeConstraints { make in
            make.top.equalTo(helloTextLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
          
        view.addSubview(bottomCollectionView)
        bottomCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }


    }
}



extension HomeViewController: HomeViewModelDelegate{
    func handle(_ output: MuscleOutput) {
        switch output {
        case .muscle(let categories):
            muscles = categories
            
            DispatchQueue.main.async {
                self.bottomCollectionView.reloadData()
            }
            return
        case .error(let e):
            print(e)
            return
        }
        
    }
}

private class CategoriesCellModel{
    let title: String
    let image: String
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}






