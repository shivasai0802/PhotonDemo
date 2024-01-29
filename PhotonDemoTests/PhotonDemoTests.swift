//
//  PhotonDemoTests.swift
//  PhotonDemoTests
//
//  Created by shiva on 1/29/24.
//

import XCTest

@testable import PhotonDemo

class PhotonDemoTests: XCTestCase {
    func testSchoolDataModel() {
        let model1 = NYCHighSchool(dbn: "dbn",
                                   school_name: "Clinton School Writers & Artists, M.S. 260",
                                   overview_paragraph: "1231231234")
        XCTAssertEqual(model1.dbn, "dbn")
        XCTAssertEqual(model1.school_name, "Clinton School Writers & Artists, M.S. 260")
        XCTAssertEqual(model1.overview_paragraph, "1231231234")
    }
}

class HighSchoolViewModelTests: XCTestCase {

    func testFetchHighSchoolData() {
        let viewModel = HighSchoolViewModel()
        
        
        let mockService = MockHighSchoolService()
        viewModel.highSchoolService = mockService

        // Expectation to wait for the async fetch
        let expectation = XCTestExpectation(description: "get High School Data")

       viewModel.fetchHighSchoolData()

        // Fulfill the expectation when the data is fetched
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled or timeout after a certain time
        wait(for: [expectation], timeout: 5.0)

        // Assert that the fetched data is not nil
        XCTAssertNotNil(viewModel.highSchoolList)
        let mockdata = viewModel.highSchoolList
        let first = mockdata?.first
        XCTAssertNotNil(first)
        XCTAssertEqual(first?.dbn, "mockDBN1")
        XCTAssertEqual(first?.school_name, "mockSchool1")
        XCTAssertEqual(first?.overview_paragraph, "MockOverview1")
       
        
    }
}

class MockHighSchoolService: HighSchoolService {
    override func fetchSchoolData(completion: @escaping (Result<[NYCHighSchool], Error>) -> Void) {
        
        let mockData: [NYCHighSchool] = [NYCHighSchool(dbn: "mockDBN1",
                                                        school_name: "mockSchool1",
                                                        overview_paragraph: "MockOverview1"),
                                         NYCHighSchool(dbn: "dbn",
                                                                    school_name: "Clinton School Writers & Artists, M.S. 260",
                                                                    overview_paragraph: "1231231234")]
        completion(.success(mockData))
    }
}


