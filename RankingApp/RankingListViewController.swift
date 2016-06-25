//
//  RankingListViewController.swift
//  RankingApp
//
//  Created by Teacher on 2016/06/18.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

class RankingListViewController: UITableViewController {
    /// ランキングのリスト情報
    let list = Feed.getRanking()
}

extension RankingListViewController {
    /// 各セクション毎のセル数を返すDataSourceメソッド
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    /// 各セルのインスタンスを返すDataSourceメソッド
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = list[indexPath.row]
        
        // 表示順 = 順位のはず
        let rank = indexPath.row + 1
        let imgData = NSData(contentsOfURL: item.imgUrl)!
        
        let cell = UITableViewCell()
        // 文字列中で \(変数名) とすると、変数展開ができる
        cell.textLabel?.text = "\(rank)位 \(item.title)"
        cell.imageView?.image = UIImage(data: imgData)
        
        return cell
    }
    
    /// セルをタップした時のDelegateメソッド
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // ランキング詳細画面に遷移
        
        // 'Main.storyboard'を参照するインスタンスの生成
        // `NSBundle.mainBundle()`は現時点では決まり文句として覚えておけばOK
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        // Storyboard上から、IDをキーにしてViewControllerを生成
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("RankingDetailViewController")
        
        // 独立した画面としてModal表示
        // self.presentViewController(viewController, animated: true, completion: nil)
        
        // NavigationController配下の画面として遷移
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}