//
//  LocationsViewController.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//
//
import UIKit
import RxSwift

class LocationsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let viewModel: LocationsViewModel = LocationsViewModel()
    let disposeBag = DisposeBag()
    var locations = [LocationDataCell]()
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var footer: LocationFooter = LocationFooter()
    var shouldPushCharactersView: Bool = false
    var shouldPushEpisodesView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionView()
        setupFooter()
        getData()
        
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LocationHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "locationHeader")
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: "locationCell")
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 83)
    }
    
    func setupFooter() {
        view.addSubview(footer)
        footer.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 83)
        footer.episodeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.setViewControllers([EpisodesViewController()], animated: false)
        }).disposed(by: disposeBag)
        footer.charButton.rx.tap.subscribe(onNext: {
            self.navigationController?.setViewControllers([CharactersViewController()], animated: false)
        }).disposed(by: disposeBag)
    }
    
    func getData() {
        self.viewModel.fetchLocationInfo().observeOn(MainScheduler.instance).subscribe(onNext: {
            resultArray in
            self.locations = resultArray
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
}

    extension LocationsViewController {
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "locationHeader", for: indexPath)
            return header
            
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.locations.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCell
            cell.typeLabel.text = locations[indexPath.row].type
            cell.locationNameLabel.text = locations[indexPath.row].name
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = LocationDetailsViewController()
            vc.selectedLocation = self.locations[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    extension LocationsViewController: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: width, height: width/2)
        }

}
