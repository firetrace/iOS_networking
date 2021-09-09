//
//  InfoViewController.swift
//  HomeWorkApp
//
//  Created by Admin on 09.09.2021.
//

import UIKit

enum Task {
    case One
    case Two
    case Three
}

struct InfoModel {
    let task: Task
    let data: Data?
}

class InfoViewController: UIViewController {

    private let task: Task
    
    private lazy var infoView: InfoView =  {
        var view = InfoView(frame: .zero)
        view.toAutoLayout()
        
        return view
    }()

    init(task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.navigationItem.largeTitleDisplayMode = .never

        tabBarController?.navigationItem.title = "Информация"
        tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    private func setupLayout() {
        view.addSubview(infoView)
        
        NSLayoutConstraint.activate([infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     infoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     infoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     infoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
