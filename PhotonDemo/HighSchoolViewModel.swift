//
//  HighSchoolViewModel.swift
//  PhotonDemo
//
//  Created by shiva on 1/29/24.
//


import Foundation

class HighSchoolViewModel: ObservableObject {
    var highSchoolService = HighSchoolService()

    @Published var highSchoolList: [NYCHighSchool]?

    func fetchHighSchoolData() {
        highSchoolService.fetchSchoolData { result in
            switch result {
            case .success(let fetchedHighSchoolData):
                DispatchQueue.main.async {
                    self.highSchoolList = fetchedHighSchoolData
                }
                print("*** HighSchool Data \(String(describing: self.highSchoolList))")
            case .failure(let error):
                print("Fetching high school data failed with error: \(error)")
            }
        }
    }
}
