//
//  LocationDetailsViewController.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON
import UIKit

class LocationDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let viewModel: LocationDetailsViewModel = LocationDetailsViewModel()
    let disposeBag = DisposeBag()
    var selectedLocation: LocationDataCell?
    var fetchedResidents = [ResidentDataCell]()
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(.gray6)
        self.navigationController?.title = self.selectedLocation?.name
        self.navigationController?.isNavigationBarHidden = false
        setupCollectionView()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LocationDetailsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "residentsHeader")
        collectionView.register(ResidentCell.self, forCellWithReuseIdentifier: "residentCell")
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func getData() {
        guard let selectedLocation = self.selectedLocation else { return }
        for resident in selectedLocation.residents {
            self.viewModel.fetchResidents(residentID: resident).observeOn(MainScheduler.instance).subscribe(onNext: { resultResident in
                self.fetchedResidents.append(resultResident)
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
        }
    }
}

extension LocationDetailsViewController {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "residentsHeader", for: indexPath) as! LocationDetailsHeader
        guard let selectedLocation = self.selectedLocation else { return UICollectionReusableView()}
        header.type.text = selectedLocation.type
        header.nameLabel.text = selectedLocation.name
        header.dimension.text = selectedLocation.dimension.uppercased()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedLocation?.residents.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "residentCell", for: indexPath) as! ResidentCell
        if fetchedResidents.count > indexPath.row {
            cell.nameLabel.text = self.fetchedResidents[indexPath.row].name
            cell.lifeStatusLabel.text = self.fetchedResidents[indexPath.row].status
            cell.charAvatar.image = UIImage()
            cell.charAvatar.loadImageFromURL(url: self.fetchedResidents[indexPath.row].avatarLink)
        }
        return cell
    }
}

extension LocationDetailsViewController: UICollectionViewDelegateFlowLayout {
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

