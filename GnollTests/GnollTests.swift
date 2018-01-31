//
//  GnollTests.swift
//  GnollTests
//
//  Created by Jovito Royeca on 29/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import XCTest
@testable import Gnoll

class GnollTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRemote() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "RepositoriesViewController")
        if let rvc = vc as? RepositoriesViewController {
            let _ = RepositoriesRouter.initRepositoriesModule(withView: rvc)
            rvc.retrieveRepositories(withQuery: "managuide")
        }
    }
    
    func testRemote2() {
        let interactor: RepositoriesInteractorInputProtocol & RepositoriesRemoteDataManagerOutputProtocol = RepositoriesInteractor()
        let localDataManager: RepositoriesLocalDataManagerInputProtocol = RepositoriesLocalDataManager()
        let remoteDataManager: RepositoriesRemoteDataManagerInputProtocol = RepositoriesRemoteDataManager()
        
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        interactor.retrieveRepositories(withQuery: "managuide")
        expectation.fulfill()
        wait(for: [expectation], timeout: 10.0)
    }
}
