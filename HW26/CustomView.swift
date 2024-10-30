//
//  CustomView.swift
//  HW26
//
//  Created by Полина Соколова on 30.10.24.
//

import UIKit

protocol ViewTappedDelegate {
    func didTapView(withName name: String)
}

class CustomView: UIView {
    var viewName: String?
    var delegate: ViewTappedDelegate?
    
    init(backgroundColor: UIColor, viewName: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.viewName = viewName
        addLabel(text: viewName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -> Setup Methods
    private func addLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
    }
    
    // MARK: -> Responding to clicks
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if super.point(inside: point, with: event) {
            return true
        }
        
        for subview in subviews {
            let pointInSubview = subview.convert(point, from: self)
            
            if subview.point(inside: pointInSubview, with: event) {
                return true
            }
        }
        return false
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha > 0 else {
            return nil
        }
        
        let touchedView = super.hitTest(point, with: event)
        
        if let customView = touchedView as? CustomView,  let viewName = customView.viewName {
            delegate?.didTapView(withName: viewName)
            return customView
        } else {
            print("nil")
            return nil
        }
    }
}

