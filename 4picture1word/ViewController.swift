
import UIKit

class ViewController: UIViewController {
    
    private lazy var imagesContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var firstImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var secondImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var lettersCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        view.dataSource = self
        view.delegate = self
        
        view.register(LetterCell.self, forCellWithReuseIdentifier: "letterCell")
        return view
        
    }()
    
    private lazy var wordCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        view.dataSource = self
        view.delegate = self
        
        view.register(WordCell.self, forCellWithReuseIdentifier: "wordCell")
        return view
        
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .gray
        view.setTitle("Next", for: .normal)
        view.setTitleColor(UIColor.blue, for: .normal)
        view.addTarget(self, action: #selector(nextLevel(sender:)), for: .touchUpInside)
        return view
    }()
    
    let levels: [LevelModel] = [
        LevelModel(firstImage: UIImage(named: "1")!, secondImage: UIImage(named: "1")!, thirdImage: UIImage(named: "1")!, fourthImage: UIImage(named: "1")!, correctAnswer: ["g","e","e", "k","t","e","c","h"], letters: ["f", "g", "c", "a", "e", "t", "e", "h", "e", "k"], color: .cyan),
        LevelModel(firstImage: UIImage(named: "2")!, secondImage: UIImage(named: "2")!, thirdImage: UIImage(named: "2")!, fourthImage: UIImage(named: "2")!, correctAnswer: ["g","e","e", "k","t","e","c","h"], letters: ["f", "g", "c"], color: .cyan),
        LevelModel(firstImage: UIImage(named: "3")!, secondImage: UIImage(named: "3")!, thirdImage: UIImage(named: "3")!, fourthImage: UIImage(named: "3")!, correctAnswer: ["g","e","e", "k","t","e","c","h"], letters: ["f", "g", "c"], color: .cyan)
    ]
    
    var index = 0
    
    var word: [String] = []
    
   // var selectedIndexs: IndexPath?
    
    var selectedItems: [UIColor] = []
    
    var bools: [Bool] = []
    
    var items: [Int] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
        
        view.addSubview(imagesContainer)
        
        imagesContainer.translatesAutoresizingMaskIntoConstraints = false
        imagesContainer.heightAnchor.constraint(equalToConstant: 350).isActive = true
        imagesContainer.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imagesContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imagesContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        imagesContainer.addSubview(firstImageView)
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        firstImageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        firstImageView.leadingAnchor.constraint(equalTo: imagesContainer.leadingAnchor, constant: 5).isActive = true
        firstImageView.topAnchor.constraint(equalTo: imagesContainer.topAnchor, constant: 5).isActive = true
        
        imagesContainer.addSubview(secondImageView)
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        secondImageView.trailingAnchor.constraint(equalTo: imagesContainer.trailingAnchor, constant: -5).isActive = true
        secondImageView.topAnchor.constraint(equalTo: imagesContainer.topAnchor, constant: 5).isActive = true
        
        imagesContainer.addSubview(thirdImageView)
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        thirdImageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        thirdImageView.leadingAnchor.constraint(equalTo: imagesContainer.leadingAnchor, constant: 5).isActive = true
       thirdImageView.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 10).isActive = true
        
        imagesContainer.addSubview(fourthImageView)
        fourthImageView.translatesAutoresizingMaskIntoConstraints = false
        fourthImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        fourthImageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        fourthImageView.trailingAnchor.constraint(equalTo: imagesContainer.trailingAnchor, constant: -5).isActive = true
        fourthImageView.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(wordCollectionView)
        wordCollectionView.translatesAutoresizingMaskIntoConstraints = false
        wordCollectionView.topAnchor.constraint(equalTo: imagesContainer.bottomAnchor, constant: 10).isActive = true
        wordCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        wordCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        wordCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        view.addSubview(lettersCollectionView)
        lettersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        lettersCollectionView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 180).isActive = true
        lettersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lettersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lettersCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: lettersCollectionView.bottomAnchor, constant: 10).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        firstImageView.image = levels[0].firstImage
        secondImageView.image = levels[0].secondImage
        thirdImageView.image = levels[0].thirdImage
        fourthImageView.image = levels[0].fourthImage
    }
    
    @objc func nextLevel(sender: UIButton) {
        index += 1
        firstImageView.image = levels[index].firstImage
        secondImageView.image = levels[index].secondImage
        thirdImageView.image = levels[index].thirdImage
        fourthImageView.image = levels[index].fourthImage
        
        lettersCollectionView.reloadData()
        
        word.removeAll()
        wordCollectionView.reloadData()
    }
    
    func colors() -> [UIColor] {
        for _ in 1...levels[index].letters.count {
            selectedItems.append(.cyan)
        }
        
        return selectedItems
    }
    
    func isClicks() -> [Bool] {
        for _ in 1...levels[index].letters.count {
            bools.append(false)
        }
        
        return bools
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == lettersCollectionView {
            return levels[index].letters.count
        } else {
            return word.count
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == lettersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as! LetterCell
            
            cell.letterLabel.text = levels[index].letters[indexPath.row]
            cell.backgroundColor = colors()[indexPath.row]
            cell.letterLabel.isHidden = isClicks()[indexPath.row]

//            if indexPath == selectedIndexs {
//                cell.backgroundColor = .white
//                cell.letterLabel.isHidden = true
//            } else {
//                cell.backgroundColor = .cyan
//                cell.letterLabel.isHidden = false
//            }
           
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wordCell", for: indexPath) as! WordCell
            
            cell.letterLabel.text = word[indexPath.row]
            
            return cell
        }
        
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize.init(width: 70, height: 70)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lettersCollectionView
        {
            let letter = levels[index].letters[indexPath.row]
            
            word.append(letter)
            
             wordCollectionView.reloadData()
            
          //  selectedIndexs = indexPath
            
            selectedItems[indexPath.row] = .white
            
            bools[indexPath.row] = true
            
            items.append(indexPath.row)
            
            lettersCollectionView.reloadData()
            
            if word == levels[index].correctAnswer {
                print("???? ??????????????!")
            } else {
                print("???? ???? ??????????????!")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        if collectionView == lettersCollectionView {
            for i in items {
                if indexPath.row == i {
                    return false
                }
            }
        }
        
        return true
    }
}


//?????????????????? ?????????????? ???????????????????????? -> String, ?????????????? ?????????? ???????? ???????????????? ???????? string (name: String) ?? ???????????????????? ?????????? ???? 1 ???? 100 ?? ?? ?????????????????????? ???? ?????????? ?????????? ?????????????????? ?????????? ?? ?????????? ????????: "Aibek, 19 ??????" ?? ???????????? ???????????????????? ??????????????????.
