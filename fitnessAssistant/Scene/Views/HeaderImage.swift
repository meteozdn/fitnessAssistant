
class HeaderImage: UIView{
    
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








