//
//  OnBoardViewController.swift
//  moviesApp
//
//  Created by Metehan Özden on 8.09.2024.
//

import UIKit
import SnapKit

class OnBoardViewController: UIViewController {

    var nextButton: UIButton = UIButton()
    var backButton: UIButton = UIButton()
    var pageController =  UIPageControl()
    var headerView : OnBoardingPageImage?
    let descriptions = ["The application is designed to bring routine sports activities to a new level. You will be able to try exercises that are aimed at strengthening and stretching the body and choose what will bring you the most pleasure. We took care of visual charts so you can track and work on your progress.",
    "We combined bright colors, minimalistic design and clean photos. This was the key to a fresh and friendly design of the fitness app.","Before starting with the programmatic approach let's first try to understand why we need it in the first place, as the same can be achieved using storyboards as well"
    ]
    var currentPage = 0
    var descriptionLabel: UILabel = {
       let object = UILabel()
        object.numberOfLines = 0
        object.textAlignment = .center
        object.font = .systemFont(ofSize: 20)
        return object
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }

    func setUI(){
        view.backgroundColor = .white
        
        //Header
        headerView = OnBoardingPageImage(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeigh * 0.50))
        if let headerView = headerView {
            view.addSubview(headerView)
            headerView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
                make.height.equalTo(screenHeigh * 0.50)
            }
            
            view.addSubview(descriptionLabel)
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom).offset(60)
                make.right.left.equalToSuperview().inset(screenWidth * 0.1)
            }
        }


        descriptionLabel.text = descriptions[currentPage]
        pageController.translatesAutoresizingMaskIntoConstraints = false
        pageController.currentPageIndicatorTintColor = .black
        pageController.pageIndicatorTintColor = .systemGray2
        pageController.numberOfPages = descriptions.count
        
        view.addSubview(pageController)
        pageController.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
        }
        
        
        setupButtons()
    }

    func setupButtons() {
        
        nextButton = createButton("chevron.right")
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextInfo), for: .touchUpInside)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.right.equalToSuperview().offset(screenWidth * -0.1)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }

        backButton = createButton("chevron.left")
        backButton.addTarget(self, action: #selector(backInfo), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(screenWidth * 0.1)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
    }
    
    private func createButton(_ iconName: String)-> UIButton {
        let button = UIButton()
        button.backgroundColor = traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.layer.borderColor = traitCollection.userInterfaceStyle == .dark ? UIColor.white.cgColor : UIColor.black.cgColor
        button.imageView?.tintColor = traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        return button
    }
    
    @objc private func nextInfo(){
        if currentPage == descriptions.count - 1 {
        }else{
            currentPage += 1
        }
        updateUI()
    }

    @objc private func backInfo(){
        if currentPage == 0 {
        }else{
            currentPage -= 1
        }
        updateUI()
    }
    
    func updatePageController(){
        pageController.currentPage = currentPage
    }
    func updateUI(){
        descriptionLabel.text = descriptions[currentPage]
        headerView?.changeImage(currentPage)
        updatePageController()
    }
    
    
}



class OnBoardingPageImage: UIView{
    
    let baseImagePath = "fitnessBanner"
    
    var heroImageView: UIImageView = {
        let object = UIImageView()
       return UIImageView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView(){
        
        self.heroImageView = UIImageView()
        self.heroImageView.image =  UIImage(named: "fitnessBanner1")
        self.heroImageView.contentMode = .scaleAspectFill
        addSubview(self.heroImageView)
        self.heroImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(screenHeigh * 0.50)
        }
        roundBottomCorners(radius: 120)
    }
    
   private func roundBottomCorners(radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    
    func changeImage(_ index: Int)  {
        heroImageView.image = UIImage(named: "\(baseImagePath)\(index + 1)")
    }

}








