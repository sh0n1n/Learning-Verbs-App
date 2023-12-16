//
//  TrainViewController.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/12/23.
//

import UIKit
import SnapKit

final class TrainViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pastSimpleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.text = "Past Simple"
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.text = "Past Particible"
        
        return label
    }()
    
    private lazy var pastSimpleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.layer.borderColor = UIColor.label.cgColor
        field.layer.borderWidth = 2.0
        field.layer.cornerRadius = 15
        field.delegate = self
        
        return field
    }()
    
    private lazy var participleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.layer.borderColor = UIColor.label.cgColor
        field.layer.borderWidth = 2.0
        field.layer.cornerRadius = 15
        field.delegate = self
        
        return field
    }()
    
    private lazy var checkButton: UIButton = {
       let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray5
        button.setTitle("Check".localized, for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Score: 0".localized
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var currentVerbLabel: UILabel = {
        let label = UILabel()
        
        label.text = "\(currenVerb)/\(dataSource.count)".localized
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
         
         button.layer.cornerRadius = 10
         button.backgroundColor = .systemGray5
        button.setTitle("Skip".localized, for: .normal)
         button.setTitleColor(UIColor.label, for: .normal)
         button.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
         
         return button
     }()
    // MARK: - Properties
    private let edgeInsets = 30
    private let dataSource = IrregularVerbs.shared.selectedVerbs
    private var currentVerb: Verb? {
        guard dataSource.count > count else { return nil}
        return dataSource[count]
    }
    
    private var count = 0 {
        didSet {
            infinitiveLabel.text = currentVerb?.infinitive
            pastSimpleTextField.text = ""
            participleTextField.text = ""
            checkButton.backgroundColor = .label
            checkButton.setTitle("Check".localized, for: .normal)
        }
    }
    
    private var score = 0 {
        didSet {
            scoreLabel.text = "Score:".localized + String(score)
        }
    }
    
    private var currenVerb = 1 {
        didSet {
            currentVerbLabel.text = "\(currenVerb)/\(dataSource.count)"
        }
    }

    private var isFirstAttempt = true

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Train Verbs".localized
        setupUI()
        hideKeyboardWhentappedAround()
        
        infinitiveLabel.text = dataSource.first?.infinitive
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotofication()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unregisterForKeyboardNotification()
    }
    
    // MARK: - Private Methods
    @objc
    private func checkAction() {
        if checkAnswers() {
            if isFirstAttempt {
                score += 1
            }
            count += 1
            currenVerb += 1
            checkButton.backgroundColor = .systemGray5
            isFirstAttempt = true
        } else {
            checkButton.backgroundColor = .red
            checkButton.setTitle("Try Again".localized, for: .normal)
            isFirstAttempt = false
        }
        
        if count == dataSource.count {
            showScoreAlert()
        }
    }
    
    @objc
    private func skipAction() {
        count += 1
        currenVerb += 1
        isFirstAttempt = true
        
        if count == dataSource.count {
            showScoreAlert()
        } else {
            let currentScore = score
            
            if let nextVerb = currentVerb {
                pastSimpleTextField.text = nextVerb.pastSimple
                participleTextField.text = nextVerb.participle
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {self.score = currentScore
                    self.infinitiveLabel.text = nextVerb.infinitive
                    self.pastSimpleTextField.text = ""
                    self.participleTextField.text = ""
                    self.checkAction()
                    self.checkButton.backgroundColor = .systemGray5
                    self.checkButton.setTitle("Check".localized, for: .normal)
                }
            }
        }
    }
    
    private func showScoreAlert() {
        let alertController = UIAlertController(title: "Training Completed".localized, message: "Your score is \(score)".localized, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK".localized, style: .default) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        })

        present(alertController, animated: true, completion: nil)
    }
    
    private func checkAnswers() -> Bool {
        pastSimpleTextField.text?.lowercased() == currentVerb?.pastSimple.lowercased() && participleTextField.text?.lowercased() == currentVerb?.participle.lowercased()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([infinitiveLabel, pastSimpleLabel, pastSimpleTextField, participleLabel, participleTextField, checkButton, scoreLabel, currentVerbLabel, skipButton])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(60)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleTextField.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleLabel.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleTextField.snp.makeConstraints { make in
            make.top.equalTo(participleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleTextField.snp.bottom).offset(100)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(edgeInsets)
        }
        
        currentVerbLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(edgeInsets)
            make.top.equalTo(scoreLabel)
        }
        
        skipButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
            make.top.equalTo(checkButton).offset(60)
        }
    }
}

// MARK: - UITextFieldDelegate
extension TrainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if pastSimpleTextField.isFirstResponder {
            participleTextField.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
    }
}

// MARK: - Keyboard Events
private extension TrainViewController {
    func registerForKeyboardNotofication() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset.bottom = frame.height + 50
    }
    
    @objc
    func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero - 50
    }
    
    func hideKeyboardWhentappedAround() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(recognizer)
    }
    
    @objc
    func hideKeyboard() {
            scrollView.endEditing(true)
    }
}
