//
//  EpisodesViewController.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 04/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class EpisodesViewController: UITableViewController {
    
    let viewModel: EpisodesViewModel = EpisodesViewModel()
    var disposeBag = DisposeBag()
    var fetchedEpisodes = [EpisodeInfoCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        getData()
    }
    
    func getData() {
        self.viewModel.fetchAllEpisodes().observeOn(MainScheduler.instance).subscribe(onNext: { episodes in
            for episode in episodes {
                if episode.name != "" {
                    self.fetchedEpisodes.append(episode)
                    self.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
    

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = true
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: "episodesCell")
        tableView.register(EpisodesHeader.self, forCellReuseIdentifier: "headerCell")
        tableView.register(EpisodesFooter.self, forCellReuseIdentifier: "footerCell")
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! EpisodesHeader
            cell.frame.size.height = 140
            return cell
        } else {
            return EpisodesTableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return fetchedEpisodes.count
        } else {
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        } else if indexPath.section == 2 {
            return 83
        } else {
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! EpisodesHeader
            cell.frame.size.height = 140
            
            return cell
        } else if indexPath.section == 1 && fetchedEpisodes.count > indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as! EpisodesTableViewCell
            cell.episodeDateLabel.text = fetchedEpisodes[indexPath.row].date
            cell.episodeNameLabel.text = fetchedEpisodes[indexPath.row].name
            cell.episodeNumberLabel.text = fetchedEpisodes[indexPath.row].episode
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "footerCell") as! EpisodesFooter
            cell.frame.size.height = 83
            cell.charButton.rx.tap.observeOn(MainScheduler.instance).subscribe(onNext: {
                self.navigationController?.setViewControllers([CharactersViewController()], animated: false)
                }).disposed(by: disposeBag)
            cell.locationButton.rx.tap.observeOn(MainScheduler.instance).subscribe(onNext: {
                self.navigationController?.setViewControllers([LocationsViewController()], animated: false)
            }).disposed(by: disposeBag)
            return cell
        } else {
                return UITableViewCell()
        }
    }
}
