//
//  ViewController.swift
//  PhotoGeneratorApp
//
//  Created by Константин Алехин on 27.04.2022.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Random"
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect (x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(label)
        getRandomJoke()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55
        )
        
        label.frame = CGRect(
            x: 30,
            y: view.frame.size.height-(view.frame.size.height / 4) * 3 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 90
        )
    }
    
    @objc
    func didTapButton() {
        getRandomPhoto()
        getRandomJoke()
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        } catch {
            print(error)
        }
        
//        guard let data = try? Data(contentsOf: url) else {
//            return
//        }
//        imageView.image = UIImage(data: data)
    }
    func getRandomJoke() {
        let string = "https://geek-jokes.sameerkumar.website/api"
        guard let url = URL(string: string) else {
            return
        }
        do {
            let jokeString = try String(contentsOf: url)
            label.text = jokeString
        } catch {
            print(error)
        }
    }
    
}
