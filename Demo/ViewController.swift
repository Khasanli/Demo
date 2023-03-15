//
//  ViewController.swift
//  Demo
//
//  Created by Khayala Hasanli on 15.03.23.
//

import UIKit

class ViewController : UIViewController {
    
    var options = ["Option 1", "Option 2", "Option 3"]
    var items = ["Item 1", "Item 2", "Item 3"]
    
    var sourceState : [Int: Int] = [:]
    
    var selectedItemIndex = -1

    private let leftTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "leftTableViewCell")
        tableView.backgroundColor = .clear
        tableView.allowsMultipleSelection = false
        return tableView
    }()
    
    private let rightTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "rightTableViewCell")
        tableView.backgroundColor = .lightGray
        tableView.allowsMultipleSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        leftTableView.delegate = self
        leftTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.dataSource = self
        
        sourceState = getState()
        setView()
    }
    
    private func getState() -> [Int: Int] {
        if let data = UserDefaults.standard.data(forKey: "sourceState") {
            do {
                let decoder = JSONDecoder()
                let dict = try decoder.decode([Int: Int].self, from: data)
                return dict
            } catch {
                print("Error retrieving dictionary from UserDefaults: \(error)")
                return [:]
            }
        }
        return [:]
    }

    private func saveState() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(sourceState)
            UserDefaults.standard.set(data, forKey: "sourceState")
        } catch {
            
            print("Error saving dictionary to UserDefaults: \(error)")
        }
    }
    
    private func setView(){
        view.addSubview(leftTableView)
        leftTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        leftTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        leftTableView.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leftTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        view.addSubview(rightTableView)
        rightTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        rightTableView.leftAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rightTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rightTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView == leftTableView {
                return items.count
            } else if tableView == rightTableView {
                if leftTableView.indexPathForSelectedRow != nil {
                    return options.count
                }
            }
            return 0
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftTableViewCell", for: indexPath)
            cell.backgroundColor = .clear
            cell.textLabel?.text = items[indexPath.row]
            return cell
        } else if tableView == rightTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightTableViewCell", for: indexPath)
            
            cell.textLabel?.text = options[indexPath.row]
            if let selectedIndex = sourceState[selectedItemIndex], indexPath.row == selectedIndex{
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            selectedItemIndex = indexPath.row
            rightTableView.reloadData()
        } else if tableView == rightTableView {
            if let selectedIndex = sourceState[selectedItemIndex], indexPath.row == selectedIndex {
                sourceState[selectedItemIndex] = nil
            } else {
                sourceState[selectedItemIndex] = indexPath.row
            }
            saveState()
            rightTableView.reloadData()
        }
    }
}
