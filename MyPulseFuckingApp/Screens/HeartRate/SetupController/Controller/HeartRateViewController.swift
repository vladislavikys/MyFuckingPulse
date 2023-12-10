//
//  ViewController.swift
//  MyPulseFuckingApp
//
//  Created by Влад on 10.12.23.
//

import UIKit

class HeartRateViewController: BaseViewController {
    // Определение переменной для управления шириной (leading) контейнера.
    var leadingConstraint: NSLayoutConstraint!
    
    // Создание кнопки для отображения информации.
    var infoButton = UIButton()
    // Создание метки для отображения текста о наличии пальцев.
    var fingersLabel = UILabel()
    // Создание метки для отображения "ударов в минуту" (bpm).
    var bpmLabel = UILabel()
    // Создание метки для отображения результата пульса.
    var resultLabel = UILabel()
    // Создание изображения сердца для анимации.
    var heartImage = UIImageView()
    // Создание изображения для отображения кривой.
    var crookedLineImage = UIImageView()
    // Создание изображения для отображения графика (линии).
    var scheduleLineImage = UIImageView()
    // Создание кнопки "Start" для начала измерения пульса.
    var startButton = PublicButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Установка текста заголовка контроллера на "Heart rate".
        titleLabel.text = "Heart rate"
        setupUI()
    }

    // Приватный метод для настройки пользовательского интерфейса в контроллере.
    private func setupUI() {
        // Добавление на контроллер различных элементов интерфейса.
        view.addSubview(infoButton)
        view.addSubview(fingersLabel)
        //view.addSubview(clueLabel)
        // view.addSubview(tutorialImage)
        view.addSubview(bpmLabel)
        view.addSubview(resultLabel)
        view.addSubview(heartImage)
        //view.addSubview(scheduleLineImage)
        view.addSubview(crookedLineImage)
        view.addSubview(startButton)
        
        // Настройка изображения для графика расписания.
//        scheduleLineImage.image = UIImage(named: "scheduleLine")
//        scheduleLineImage.translatesAutoresizingMaskIntoConstraints = false
//        scheduleLineImage.contentMode = .scaleAspectFit
        
        // Настройка кнопки информации.
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.setImage(UIImage(named: "infoButton"), for: .normal)
        
        // Настройка метки для отображения состояния пальцев.
        fingersLabel.translatesAutoresizingMaskIntoConstraints = false
        fingersLabel.font = .regularFont(size: 16)
        fingersLabel.textColor = UIColor(red: 0.114, green: 0.114, blue: 0.145, alpha: 1)
        fingersLabel.text = "No fingers"
        
        // Настройка метки подсказки.
//        clueLabel.translatesAutoresizingMaskIntoConstraints = false
//        clueLabel.font = .regularFont(size: 16)
//        clueLabel.textColor = UIColor(red: 0.114, green: 0.114, blue: 0.145, alpha: 1)
//        clueLabel.textAlignment = .center
//        clueLabel.numberOfLines = 0
//        clueLabel.text = "Place your finger on the back camera and flashlight"
        
//        // Настройка изображения обучения.
//        tutorialImage.translatesAutoresizingMaskIntoConstraints = false
//        tutorialImage.image = UIImage(named: "tutorial")
        
        // Настройка метки для отображения результата.
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = .mediumFont(size: 60)
        resultLabel.text = "00"
        resultLabel.textColor = UIColor(red: 0.114, green: 0.114, blue: 0.145, alpha: 1)
        resultLabel.textAlignment = .center
        
        // Настройка метки для отображения "bpm".
        bpmLabel.translatesAutoresizingMaskIntoConstraints = false
        bpmLabel.font = .mediumFont(size: 16)
        bpmLabel.text = "bpm"
        bpmLabel.textColor =  UIColor(red: 0.114, green: 0.114, blue: 0.145, alpha: 1)
        
        // Настройка изображения сердца.
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        heartImage.image = UIImage(named: "fullHeart")
        heartImage.contentMode = .scaleAspectFit
        
        // Настройка изображения кривой линии.
        crookedLineImage.translatesAutoresizingMaskIntoConstraints = false
        crookedLineImage.image = UIImage(named: "crookedLine")
        crookedLineImage.contentMode = .scaleAspectFit
        
        // Настройка кнопки "Start" с вызовом метода startButtonAction при нажатии.
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.contentMode = .scaleAspectFit
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        // Установка начальной позиции метки результата.
        setupLeadingConstraintForResultLabel()
        
        NSLayoutConstraint.activate([
            
            //scheduleLineImage.topAnchor.constraint(equalTo: clueLabel.bottomAnchor, constant: 60),
           // scheduleLineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            
            infoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            infoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18),
            
            fingersLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            fingersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            clueLabel.bottomAnchor.constraint(equalTo: tutorialImage.bottomAnchor, constant: -100),
//            clueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            clueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            clueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            
//            tutorialImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tutorialImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            
            bpmLabel.topAnchor.constraint(equalTo: fingersLabel.topAnchor, constant: 165),
            bpmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            
            resultLabel.topAnchor.constraint(equalTo: fingersLabel.topAnchor, constant: 155),
            resultLabel.leadingAnchor.constraint(equalTo: bpmLabel.trailingAnchor, constant: -100),
            
            heartImage.topAnchor.constraint(equalTo: fingersLabel.topAnchor, constant: 143),
            heartImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -156),
            
            crookedLineImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            crookedLineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 68),
            startButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    // Метод для установки начального положения метки результата относительно метки "bpm".
    func setupLeadingConstraintForResultLabel() {
//        leadingConstraint = resultLabel.leadingAnchor.constraint(equalTo: bpm.trailingAnchor, constant: 100)
//        leadingConstraint.isActive = true
    }
    // Обработчик нажатия кнопки "Start".
    @objc private func startButtonAction() {
        // Запуск процесса измерения пульса.
        // self.startPulseHeartRate()
    }
    
}




