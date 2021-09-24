//
//  StatsVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import UIKit

class StatsVC: UIViewController {
    
    // MARK: STEP 11: Going to StatsVC
    // Read the instructions in MainVC.swift
    
    var dataExample: String
    var streak: Int
    var lastThree: [String] = []
    
    init(data: String, streak: Int, results: [String]) {
        self.dataExample = data
        self.streak = streak
        for result in results {
            lastThree.append(result)
        }
        
        // Delegate rest of the initialization to super class
        // designated initializer.
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: >> Your Code Here <<
    
    
    
    // MARK: STEP 12: StatsVC UI
    // Action Items:
    // - Initialize the UI components, add subviews and constraints
    
    // MARK: >> Your Code Here <<
    private let statsLabel: UILabel = {
        let label = UILabel()
        
        // == UIColor.darkGray
        label.textColor = .darkGray
        
        // == NSTextAlignment(expected type).center
        label.textAlignment = .center
        
        // == UIFont.systemFont(ofSize: 27, UIFont.weight.medium)
        label.font = .systemFont(ofSize: 27, weight: .medium)
        
        // Must have if you are using constraints.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let last: UILabel = {
        let label = UILabel()
        
        // == UIColor.darkGray
        label.textColor = .darkGray
        
        // == NSTextAlignment(expected type).center
        label.textAlignment = .center
        
        // == UIFont.systemFont(ofSize: 15, UIFont.weight.medium)
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        // Must have if you are using constraints.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(statsLabel)
        view.backgroundColor = .white
        view.addSubview(last)
        statsLabel.text = "Your longest streak is: \(streak)"
        if lastThree.count >= 3{
        last.text = "Your last three answers were: \(lastThree[lastThree.count - 3]), \(lastThree[lastThree.count - 2]), \(lastThree[lastThree.count - 1])"
        last.numberOfLines = 0
        } else {
            var textString = "Your last choices are: \n"
            textString.append(lastThree.joined(separator: ", "))
            last.text = textString
        }
        
        last.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            statsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            statsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            statsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            last.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            last.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            last.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
}
