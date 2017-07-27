//
//  FeedTableViewController.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import UIKit
import RealmSwift

class FeedTableViewController: UITableViewController {

    let realm = try! Realm()
    let shots = try! Realm().objects(Shot.self).sorted(byKeyPath: "created_at", ascending: false)
    var notificationToken: NotificationToken?
    
    let pullToUpdateContoll: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(loadLatest), for: .valueChanged)
        control.attributedTitle = NSAttributedString(string: "Pull to refresh")
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadLatest()
        setUpRealmNotification()
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
    }

    func setupUI() {
        tableView.addSubview(pullToUpdateContoll)
        let logOutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(FeedTableViewController.logOut))
   
        self.navigationItem.rightBarButtonItem = logOutButton
    }
    
    func loadLatest() {
        let apiManager = APIManager()

        apiManager.getShots() { [weak self] in
            self?.pullToUpdateContoll.endRefreshing()
        }
    }
    
    func logOut() {
        let authManager = AuthManager()
        authManager.logOut()
        guard let window = UIApplication.shared.delegate?.window else { fatalError() }
        guard let controller = AppStoryboard.login.initialViewController else { return }
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    //MARK: - Realm
    func setUpRealmNotification() {
        self.notificationToken = shots.addNotificationBlock { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                print("Initial")
                self.tableView.reloadData()
                break
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                print("Update")
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.endUpdates()
                break
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
                break
            }
        }
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let messagesPreviewCount = shots.count
        self.tableView.isHidden = messagesPreviewCount < 1
        return messagesPreviewCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        
        cell.shot = shots[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height / 2
    }
}
