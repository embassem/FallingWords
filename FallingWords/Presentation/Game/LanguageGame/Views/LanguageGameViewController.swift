//
//  LanguageGameViewController.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class LanguageGameViewController: BaseViewController {

    let viewModel: LanguageGameViewModel

    @IBOutlet private weak var fallingWordContainer: UIView!
    @IBOutlet private weak var remainingLabel: UILabel!
    @IBOutlet private weak var correctLabel: UILabel!
    @IBOutlet private weak var wrongLabel: UILabel!
    @IBOutlet private weak var noAnswerLabel: UILabel!
    @IBOutlet private weak var correctButton: UIButton!
    @IBOutlet private weak var wrongButton: UIButton!
    
    @IBOutlet private weak var currentWordLabel: UILabel!
    lazy var backButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btn.setImage(#imageLiteral(resourceName: "ic_back"), for: [])
        btn.addTarget(self, action: #selector(backButtonWasTapped), for: .touchUpInside)
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let top: NSLayoutConstraint
        let leading: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            top = btn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
            leading = btn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        } else {
            top = btn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25)
            leading = btn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12)
        }
        NSLayoutConstraint.activate([top, leading])

        return btn
    }()
    
     var fallingWordLabel: UILabel?
       

    // MARK: - Methods
    public init(_ viewModel: LanguageGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.viewDidLoad()
        
    }

    func configureUI() {
        view.backgroundColor = UIColor.background
        view.bringSubviewToFront(backButton)
        bind(to: viewModel)
    }

    private func bind(to viewModel: LanguageGameViewModel) {
        viewModel.state
            .observe(on: self, observerBlock: { [weak self] _ in self?.gameStatusChanged() })
        viewModel.currentItem
            .observe(on: self, observerBlock: { [weak self] in self?.currectItemDidCahnge(item: $0) })
        
        viewModel.remaining.observe(on: self, observerBlock: { [weak self] in  self?.remainingLabel.text = "\($0)" })
        viewModel.correct.observe(on: self, observerBlock: { [weak self] in  self?.correctLabel.text = "\($0)" })
        viewModel.wrong.observe(on: self, observerBlock: { [weak self] in  self?.wrongLabel.text = "\($0)" })
        viewModel.noAnswer.observe(on: self, observerBlock: { [weak self] in  self?.noAnswerLabel.text = "\($0)" })
    }

    @objc
    func backButtonWasTapped() {
        //TODO: Display an Alert to confirm back while game is on
        navigationController?.popViewController(animated: true)
    }
    
    func gameStatusChanged() {
        let status = viewModel.state.value
        
        switch status {
            case .ended:
            gameEnded()
            default:break
        }
    }
    
    func gameEnded() {
        let message =
        """
        your Score was
        Correct: \(viewModel.correct.value)
        Wrong: \(viewModel.wrong.value)
        Not Answerd: \(viewModel.noAnswer.value)
        of total : \(viewModel.total)
        """
        let alert = UIAlertController(title: "Game Ended", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func currectItemDidCahnge(item: LanguageWord? ) {
        guard let word = item else {
            currentWordLabel.text = nil
            return
        }
        currentWordLabel.text = word.word
        resetLabel(text: word.translation)
        startGame()
    }
    
    func resetLabel(text: String) {
        fallingWordLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        fallingWordLabel?.textAlignment = .center
        fallingWordLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        fallingWordLabel?.textColor = .grayscale800
        if let lbl = fallingWordLabel {
             fallingWordContainer.addSubview(lbl)
        }
       
        fallingWordLabel?.center.x = fallingWordContainer.bounds.midX
        fallingWordLabel?.center.y = fallingWordContainer.bounds.minY
        fallingWordLabel?.text = text
    }
    
    func startGame() {
//        correctButton.isUserInteractionEnabled = true
//        wrongButton.isUserInteractionEnabled = true
        let duration = Double.random(in: 3...6)
        let delay = 0.0
        let animationOptions: UIView.AnimationOptions = [.curveEaseOut,
                                                         .allowUserInteraction,
                                                         .beginFromCurrentState,
                                                         .allowAnimatedContent]
        
        animator = UIViewPropertyAnimator(
            duration: duration,
            curve: .easeIn,
            animations: {
                self.fallingWordLabel?.center.y = (self.fallingWordContainer.bounds.maxY + 50.0)

        })
        
        animator?.startAnimation()
        animator?.addCompletion({ _ in
            
            self.finishFalling()
        })
//        UIView.animate(withDuration: duration,
//                       delay: delay,
//                       options: animationOptions,
//                       animations: {
//
//        }, completion: {(finished: Bool) in
//            self.finishFalling(finished: finished)
//        })

    }
    var animator: UIViewPropertyAnimator?
    
    func finishFalling() {
        fallingWordLabel?.text = nil
        fallingWordLabel = nil
        noAnswerAction()
    }
    
    @IBAction func correctAnswerAction(_ sender: UIButton) {
        animator?.stopAnimation(true)
        clearLabel()
        viewModel.correctAnswerAction()
    }
    
    @IBAction func wrongAnswerAction(_ sender: UIButton) {
        animator?.stopAnimation(true)
        clearLabel()
        viewModel.wrongAnswerAction()
       
    }
    
    func noAnswerAction() {
        clearLabel()
        viewModel.noAnswerAction()
    }
    
    func clearLabel() {
//        fallingWordLabel.layer.removeAllAnimations()
        fallingWordLabel?.removeFromSuperview()
        fallingWordLabel = nil
    }
}
