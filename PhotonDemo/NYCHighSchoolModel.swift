//
//  NYCHighSchoolModel.swift
//  PhotonDemo
//
//  Created by shiva on 1/29/24.
//

import Foundation

struct NYCHighSchool: Codable, Hashable {
    var dbn: String
    var school_name: String
    var overview_paragraph: String
}

let newYorkCityURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"

class HighSchoolService {
    func fetchSchoolData(completion: @escaping (Result<[NYCHighSchool], Error>) -> Void) {
        let url = URL(string: newYorkCityURL)

        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url!)) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "AppErrorDomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to retrieve School data"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                let highSchoolData = try decoder.decode([NYCHighSchool].self, from: data)
                completion(.success(highSchoolData))
            } catch {
                completion(.failure(error))
            }
        }

        dataTask.resume()
    }
}
