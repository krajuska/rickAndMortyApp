//
//  CharactersViewController.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 30/04/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class CharactersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let viewModel: CharactersViewModel = CharactersViewModel()
    let disposeBag = DisposeBag()
    var characters = [CharCell]()
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    var footer: CharactersFooter = CharactersFooter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionView()
        setupFooter()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "charHeader")
        collectionView.register(CharactersCell.self, forCellWithReuseIdentifier: "charCell")
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 83)
    }
    
    func setupFooter() {
        view.addSubview(footer)
        footer.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 83)
        footer.didClickEpisodeButton.subscribe(onNext: { value in
            if value == true {
                self.navigationController?.setViewControllers([EpisodesViewController()], animated: false)
            }
        }).disposed(by: disposeBag)
        footer.didClickLocationButton.subscribe(onNext: { value in
            if value == true {
                self.navigationController?.setViewControllers([LocationsViewController()], animated: false)
            }
        }).disposed(by: disposeBag)
        
    }

    func getData() {
        self.viewModel.fetchCaractersCells(forcePage: true).observeOn(MainScheduler.instance).subscribe(onNext: { resultArray in
            self.characters = resultArray
            self.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    func fetchNextSet() {
        self.viewModel.fetchCaractersCells().observeOn(MainScheduler.instance).subscribe(onNext: { resultArray in
            for i in 0..<resultArray.count {
                self.characters.append(resultArray[i])
            }
            self.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension CharactersViewController {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "charHeader", for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 5 {
            self.fetchNextSet()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charCell", for: indexPath) as! CharactersCell
        if characters.count >= indexPath.row {
            cell.nameLabel.text = self.characters[indexPath.row].name
            cell.lifeStatusLabel.text = self.characters[indexPath.row].status
            cell.charAvatar.image = UIImage()
            cell.charAvatar.loadImageFromURL(url: self.characters[indexPath.row].avatarLink)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterDetailsViewController()
        vc.charSelected = self.characters[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 50) / 2
        return CGSize(width: width, height: width*135/100)
    }
}
