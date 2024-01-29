//
//  SchoolDescriptionView.swift
//  PhotonDemo
//
//  Created by shiva on 1/29/24.
//

import SwiftUI

struct SchoolDescriptionView: View {
    @State var schoolDescription: NYCHighSchool?
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("School Description")
                    .font(.title)
                    .padding()
                if let desc = schoolDescription?.overview_paragraph {
                    Text(desc)
                        .font(.body)
                        .padding()
                }
            }
        }
       
    }
}

struct SchoolDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDescriptionView()
    }
}
