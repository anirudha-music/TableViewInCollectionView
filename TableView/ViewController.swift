//
//  ViewController.swift
//  TableView
//
//  Created by Anirudha on 18/05/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionV: UICollectionView!
    
    var selectedRowIndex = -1
    
    @IBOutlet weak var optionA: UIButton!
    @IBAction func optionA(_ sender: Any) {
        scrollCollectionView(0)
    }
    
    @IBOutlet weak var optionB: UIButton!
    @IBAction func optionB(_ sender: Any) {
        scrollCollectionView(1)
    }
    
    @IBOutlet weak var optionC: UIButton!
    @IBAction func optionC(_ sender: Any) {
        scrollCollectionView(2)
    }
    
    @IBOutlet weak var optionD: UIButton!
    @IBAction func optionD(_ sender: Any) {
        scrollCollectionView(3)
    }
    
    func scrollCollectionView(_ to: Int) {
        let indexPath = IndexPath(item: to, section: 0)
        collectionV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCollectionCell", for: indexPath) as! TableCollectionCell
        cell.tableView.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Option \(tableView.tag)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRowIndex == indexPath.row {
            selectedRowIndex = -1
        } else {
            selectedRowIndex = indexPath.row
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            return 90 //Expanded
        }
        return 40 //Not expanded
    }
}

















