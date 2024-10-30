//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewA = CustomView(backgroundColor: .lightGray, viewName: "A")
    private let viewB = CustomView(backgroundColor: .red, viewName: "B")
    private let viewC = CustomView(backgroundColor: .blue, viewName: "C")
    private let viewD = CustomView(backgroundColor: .yellow, viewName: "D")
    private let viewE = CustomView(backgroundColor: .green, viewName: "E")
    
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
}

// MARK: -> ViewTappedDelegate
extension ViewController: ViewTappedDelegate {
    func didTapView(withName name: String) {
        label.text = "Нажата вью: \(name)"
    }
}
    
    
// MARK: -> Setup Views
private extension ViewController {
    func setupViews() {
        addSubViews()
        setupLabel()
        setupDelegates()
        setupLayout()
    }
    
    func addSubViews() {
		view.addSubview(viewA)
		viewA.addSubview(viewB)
		viewA.addSubview(viewC)
		viewB.addSubview(viewD)
		viewC.addSubview(viewE)
        
        view.addSubview(label)
	}
    
    func setupLabel() {
        label.text = "Здесь будет название выбранной вью"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
    }
    
    func setupDelegates() {
        viewA.delegate = self
        viewB.delegate = self
        viewC.delegate = self
        viewD.delegate = self
        viewE.delegate = self
    }
}

// MARK: -> Setup Layout
private extension ViewController {
	func setupLayout() {
		viewA.translatesAutoresizingMaskIntoConstraints = false
		viewB.translatesAutoresizingMaskIntoConstraints = false
		viewC.translatesAutoresizingMaskIntoConstraints = false
		viewD.translatesAutoresizingMaskIntoConstraints = false
		viewE.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			viewA.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			viewA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			viewA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
			viewA.heightAnchor.constraint(equalToConstant: 300),
			
			viewB.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewB.leadingAnchor.constraint(equalTo: viewA.leadingAnchor, constant: 20),
			viewB.widthAnchor.constraint(equalToConstant: 150),
			viewB.heightAnchor.constraint(equalToConstant: 150),
			
			viewC.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewC.trailingAnchor.constraint(equalTo: viewA.trailingAnchor, constant: -20),
			viewC.widthAnchor.constraint(equalToConstant: 150),
			viewC.heightAnchor.constraint(equalToConstant: 150),
			
			viewD.bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -20),
			viewD.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 20),
			viewD.widthAnchor.constraint(equalToConstant: 100),
			viewD.heightAnchor.constraint(equalToConstant: 50),
			
			viewE.topAnchor.constraint(equalTo: viewC.topAnchor, constant: 60),
			viewE.centerXAnchor.constraint(equalTo: viewC.centerXAnchor),
			viewE.widthAnchor.constraint(equalToConstant: 80),
			viewE.heightAnchor.constraint(equalToConstant: 120),
            
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
		])
	}
}

