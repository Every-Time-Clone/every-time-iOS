//
//  DetailBoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

final class MenuBoardMyListViewController: BoardViewController {

    // MARK: - Properties

    private let userPostsManger: UserPostsManager = UserPostsManager()
    private var userPosts: [UserPostModel] = []

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUserPosts()
    }

    // MARK: - Network

    private func fetchUserPosts() {
        let uuid = "54aaf847-9cf2-49ea-b2b4-fd5bde695215" // test용

        userPostsManger.request(uuid) { [weak self] response in
            response.data.forEach {
                self?.userPosts.insert($0.convertToUserPost(), at: 0)
            }
            self?.boardTableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier, for: indexPath) as! PostTableViewCell
        cell.setUserPostDataBind(userPosts[indexPath.row])
        return cell
    }
    
    // MARK: - @objc Methods
    
    @objc override func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black

        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "내가 쓴 글"
    }

    @objc override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = PostDetailViewController()
        let post = userPosts[indexPath.row]
        postDetailVC.postType = .myPost
        postDetailVC.postModel = PostModel(uuid: post.uuid,
                                           user: UserModel(uuid: "uuid", email: "min@naver.com", nickname: "nic"),
                                           title: post.title,
                                           contents: post.contents,
                                           time: post.uploadDate,
                                           goods: post.goods,
                                           commentNumber: "8",
                                           scrapNumber: "8",
                                           isScrapped: false)
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
}
