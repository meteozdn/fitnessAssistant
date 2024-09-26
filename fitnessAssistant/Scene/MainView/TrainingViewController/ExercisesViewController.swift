//
//  TrainCollectionsViewController.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 21.09.2024.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    var headerView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Kol egzersizleri"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    var viewModel: ExerciseViewModel?
    private var exercisesTableView = UITableView(frame: .zero)
    var exercises: Exercises = Exercises()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        exercisesTableView.dataSource = self
        setUI()
    }
    
    
    func setUI(){
        viewModel?.delegate = self
        viewModel?.getExercise(5)
        self.headerView.image =  UIImage(named: "fitnessBanner2")
        view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.20)
        }

        view.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        
        let timeIcon = createInfoLabel(iconName: "clock", title: "20 dk")
        view.addSubview(timeIcon)
        timeIcon.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.left.equalToSuperview().inset(20)
        }
        
        let difficultIcon = createInfoLabel(iconName: "flame", title: "Zor")
        view.addSubview(difficultIcon)
        difficultIcon.snp.makeConstraints { make in
            make.left.equalTo(timeIcon.snp.right).offset(10)
            make.top.bottom.equalTo(timeIcon)
        }
        let lineView = UIView()
        lineView.backgroundColor = .gray
        view.addSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(timeIcon.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
        exercisesTableView.register(ExercisesTableViewCell.self, forCellReuseIdentifier: ExercisesTableViewCell.identifier)
        view.addSubview(exercisesTableView)
        exercisesTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

    }
    
    
    
    func createInfoLabel(iconName: String, title: String) -> UIView{
        let object = UIView()

        let icon = UIImageView()
        icon.image = UIImage(systemName: iconName)
        icon.tintColor = K.ColorConst.red

        object.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        //titleLabel.textColor = K.ColorConst.red
        titleLabel.text = title
        object.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(5)
            make.top.bottom.equalTo(icon)
        }
        return object
        
    }
    
}

extension ExercisesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesTableViewCell.identifier, for: indexPath) as! ExercisesTableViewCell
        cell.configure(exercises[indexPath.row].exerciseName ?? "")
        return cell

    }
    
    
}


extension ExercisesViewController: ExerciseViewModelDelegate{
    func handle(_ output: ExerciseModelOutput) {
        switch output {
        case .exercises(let e):
            exercises = e
            
            DispatchQueue.main.async {
                self.exercisesTableView.reloadData()
            }
            return
        case .error:
            return
        }
    }
    
}
