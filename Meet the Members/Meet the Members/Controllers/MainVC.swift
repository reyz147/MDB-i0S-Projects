//
//  MainVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    // Create a property for our timer, we will initialize it in viewDidLoad
    var timer: Timer?
    
    var runCount = 0
    var storedbutton = 0
    var pressed = 0
    var score = 0
    var hasbeenselected = false
    var answer:String?
    var mainStreak = 0
    var choices = [String]()
    
    // MARK: STEP 7: UI Customization
    // Action Items:
    // - Customize your imageView and buttons.
    
    
    let imageView: UIImageView = {
        let view = UIImageView()
        
        // MARK: >> Your Code Here <<
        view.backgroundColor = .systemGray
    
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let buttons: [UIButton] = {
        return (0..<4).map { index in
            let button = UIButton()

            // Tag the button its index
            button.tag = index
            
            // MARK: >> Your Code Here <<
            
            button.backgroundColor = .systemTeal
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }
        
    }()
    
    // MARK: STEP 10: Stats Button
    // Action Items:
    // - Follow the examples you've seen so far, create and
    // configure a UIButton for presenting the StatsVC. Only the
    // callback function `didTapStats(_:)` was written for you.
    
    // MARK: >> Your Code Here <<
    private let statButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Stats", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .cyan
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(statButton)
        
        
        
        // Create a timer that calls timerCallback() every one second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        
        // MARK: STEP 6: Adding Subviews and Constraints
        // Action Items:
        // - Add imageViews and buttons to the root view.
        // - Create and activate the layout constraints.
        // - Run the App
        
        // Additional Information:
        // If you don't like the default presentation style,
        // you can change it to full screen too! However, in this
        // case you will have to find a way to manually to call
        // dismiss(animated: true, completion: nil) in order
        // to go back.
        //
        // modalPresentationStyle = .fullScreen
        
        // MARK: >> Your Code Here <<
        
        view.addSubview(imageView)
        view.addSubview(buttons[0])
        view.addSubview(buttons[1])
        view.addSubview(buttons[2])
        view.addSubview(buttons[3])
        view.addSubview(statButton)
        view.addSubview(pauseButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 400),
        
        ])
        
        NSLayoutConstraint.activate([
            buttons[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            buttons[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

                        
            buttons[1].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            buttons[1].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttons[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                        
            buttons[2].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            buttons[2].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttons[2].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                        
            buttons[3].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 650),
            buttons[3].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttons[3].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            statButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 750),
            statButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            statButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -220)
        ])
        
        NSLayoutConstraint.activate([
            pauseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 750),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220),
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
        
        
        getNextQuestion()
        
        // MARK: STEP 9: Bind Callbacks to the Buttons
        // Action Items:
        // - Bind the `didTapAnswer(_:)` function to the buttons.
        
        // MARK: >> Your Code Here <<
        buttons[0].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        statButton.addTarget(self, action: #selector(didTapStats(_:)), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(didTapPause(_:)), for: .touchUpInside)
        
        
        // MARK: STEP 10: Stats Button
        // See instructions above.
        
        // MARK: >> Your Code Here <<
    }
    
    // What's the difference between viewDidLoad() and
    // viewWillAppear()? What about viewDidAppear()?
    override func viewWillAppear(_ animated: Bool) {
        // MARK: STEP 13: Resume Game
        // Action Items:
        // - Reinstantiate timer when view appears
        
        // MARK: >> Your Code Here <<
        
    
        
    }
    
    
    
    func getNextQuestion() {
        // MARK: STEP 5: Data Model
        // Action Items:
        // - Get a question instance from `QuestionProvider`
        // - Configure the imageView and buttons with information from
        //   the question instance
        
        // MARK: >> Your Code Here <<
        let question = QuestionProvider.shared.nextQuestion()
        let image = question?.image
        answer = question?.answer
        let choices = question?.choices
    
        
        imageView.image = image
        
        buttons[0].setTitle(choices?[0], for: .normal)
        buttons[1].setTitle(choices?[1], for: .normal)
        buttons[2].setTitle(choices?[2], for: .normal)
        buttons[3].setTitle(choices?[3], for: .normal)
    }
    
    // MARK: STEP 8: Buttons and Timer Callback
    // Action Items:
    // - Complete the callback function for the 4 buttons.
    // - Complete the callback function for the timer instance
    //
    // Additional Information:
    // Take some time to plan what should be in here.
    // The 4 buttons should share the same callback.
    //
    // Add instance properties and/or methods
    // to the class if necessary. You may need to come back
    // to this step later on.
    //
    // Hint:
    // - The timer will fire every one second.
    // - You can use `sender.tag` to identify which button is pressed.
    @objc func timerCallback() {
              
        // MARK: >> Your Code Here <<
        
        runCount += 1
        if runCount >= 5 {
            for button in buttons {
                if (button.titleLabel!.text) == answer {
                    button.backgroundColor = .systemGreen
                    storedbutton = button.tag
                }
            }
        if runCount == 7{
            runCount = 0
            buttons[storedbutton].backgroundColor = .systemTeal
            buttons.forEach { btn in
                btn.isUserInteractionEnabled = true
            }
            getNextQuestion()
        }
        }
        if (hasbeenselected == true) {
            if runCount == 2{
                buttons[pressed].backgroundColor = .systemTeal
                buttons[storedbutton].backgroundColor = .systemTeal
                runCount = 0
                hasbeenselected = false
                getNextQuestion()
                buttons.forEach { btn in
                    btn.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    @objc func didTapAnswer(_ sender: UIButton) {
        
        pressed = sender.tag
        runCount = 0
        if (buttons[pressed].titleLabel!.text) == answer {
            hasbeenselected = true
            score += 1
            print(score)
            mainStreak += 1
            buttons[pressed].backgroundColor = .systemGreen
            choices.append("Correct")
            buttons.forEach { btn in
                btn.isUserInteractionEnabled = false
            }
        }
        else {
            hasbeenselected = true
            buttons[pressed].backgroundColor = .systemRed
            mainStreak = 0
            for button in buttons {
                buttons.forEach { btn in
                    btn.isUserInteractionEnabled = false
                }
                if (button.titleLabel!.text) == answer {
                    button.backgroundColor = .systemGreen
                    storedbutton = button.tag
                    choices.append("False")
                }
            }
        }
    }
    
    @objc func didTapStats(_ sender: UIButton) {
        
        let vc = StatsVC(data: "Hello", streak: mainStreak, results: choices)
        
        vc.modalPresentationStyle = .fullScreen
        
        // MARK: STEP 11: Going to StatsVC
        // When we are navigating between VCs (e.g MainVC -> StatsVC),
        // we often need a mechanism for transferring data
        // between view controllers. There are many ways to achieve
        // this (initializer, delegate, notification center,
        // combined, etc.). We will start with the easiest one today,
        // which is custom initializer.
        //
        // Action Items:
        // - Pause the game when stats button is tapped
        // - Read the example in StatsVC.swift, and replace it with
        //   your custom init for `StatsVC`
        // - Update the call site here on line 139
    
        
    
        present(vc, animated: true, completion: nil)
    }
    
    //pause

    private let pauseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Pause", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .cyan
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func didTapPause(_ sender: UIButton) {
        
        if pauseButton.currentTitle == "Pause"{
            hasbeenselected = true
            pauseButton.setTitle("Resume", for: .normal)
            pauseButton.backgroundColor = .systemTeal
            timer!.invalidate()
        }
        else {
            pauseButton.setTitle("Pause", for: .normal)
            pauseButton.backgroundColor = .cyan
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }

}

    

