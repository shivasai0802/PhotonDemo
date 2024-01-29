//
//  HighSchoolView.swift
//  PhotonDemo
//
//  Created by shiva on 1/29/24.
//

import SwiftUI

struct HighSchoolView: View {
    @ObservedObject private var viewModel = HighSchoolViewModel()

    var body: some View {
        VStack {
            if let highSchoolList = viewModel.highSchoolList {
                Text("NYC HighSchool List")
                NavigationView {
                    List {
                        ForEach(highSchoolList, id:\.self) { highSchool in
                            NavigationLink(destination: SchoolDescriptionView(schoolDescription: highSchool)) {
                                VStack(alignment: .leading) {
                                    Text("School DBN: " + highSchool.dbn)
                                        .font(.body)

                                    Text("School Name: " + highSchool.school_name)
                                        .font(.body)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear() {
            viewModel.fetchHighSchoolData()
        }
    }
}

struct HighSchoolView_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolView()
    }
}
