//
//  RepositoriesInteractor.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit

class RepositoriesInteractor: RepositoriesInteractorInputDelegate {
    weak var presenter: RepositoriesInteractorOutputDelegate?
    var datamanager: RepositoriesDataManagerProtocol?
    
    func retrieveRepositories(withQuery query: String) {
//        do {
//            if let repoList = try datamanager?.retrieveRepositories(withQuery: query) {
//                let repoEntityList = repoList.map() {
//                    return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
//                }
//                if  postModelList.isEmpty {
//                    remoteDatamanager?.retrievePostList()
//                }else{
//                    presenter?.didRetrievePosts(postModelList)
//                }
//            } else {
//                remoteDatamanager?.retrievePostList()
//            }
//
//        } catch {
//            presenter?.didRetrievePosts([])
//        }
    }
    
}

extension RepositoriesInteractor: PostListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDatamanager?.savePost(id: postModel.id, title: postModel.title, imageUrl: postModel.imageUrl, thumbImageUrl: postModel.thumbImageUrl)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
