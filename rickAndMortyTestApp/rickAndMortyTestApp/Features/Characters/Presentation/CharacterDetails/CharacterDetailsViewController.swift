//
//  CharacterDetailsViewController.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 01/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class CharacterDetailsViewController: UITableViewController {
    
    let viewModel: CharacterDetailsViewModel = CharacterDetailsViewModel()
    var disposeBag = DisposeBag()
    var charSelected = CharCell()
    var episodes = [EpisodeInfoCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        getData()
    }
    
    func getData() {
        for i in 0..<charSelected.episodes.count {
            self.viewModel.fetchEpisodeInfo(episode: charSelected.episodes[i]).observeOn(MainScheduler.instance).subscribe(onNext: { episode in
                self.episodes.append(episode)
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.bounces = false
        
        //header
        tableView.register(CharDetailsHeader.self, forCellReuseIdentifier: "headerCell")
        tableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: "episodesCell")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 60
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CharacterInfoTableViewHeader()
        if section == 1 {
            header.titleLabel.text = "Informations"
            return header
        } else if section == 2 {
            header.titleLabel.text = "Episodes"
            return header
        } else {
            return header
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return episodes.count
        } else {
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.frame.width
        } else if indexPath.section == 1 {
            return 60
        } else  if indexPath.section == 2 {
            return 80
        }  else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! CharDetailsHeader
            cell.circleAvatar.loadImageFromURL(url: charSelected.avatarLink)
            cell.nameLabel.text = charSelected.name
            cell.lifeStatusLabel.text = charSelected.status
            cell.speciesLabel.text = charSelected.species.uppercased()
            return cell
        } else if indexPath.section == 1 {
            tableView.allowsSelection = false
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InformationTableViewCell
            switch indexPath.row {
            case 0:
                cell.topicLabel.text = "Gender"
                cell.infoLabel.text = charSelected.gender
            case 1:
                cell.topicLabel.text = "Origin"
                cell.infoLabel.text = charSelected.origin
            case 2:
                cell.topicLabel.text = "Type"
                cell.infoLabel.text = charSelected.type
            case 3:
                cell.topicLabel.text = "Location"
                cell.infoLabel.text = charSelected.location
            default:
                cell.topicLabel.text = "Loading..."
            }
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as! EpisodesTableViewCell
            cell.episodeDateLabel.text = episodes[indexPath.row].date
            cell.episodeNameLabel.text = episodes[indexPath.row].name
            cell.episodeNumberLabel.text = episodes[indexPath.row].episode
            return cell
        } else {
            return UITableViewCell()
        }
    }

}
