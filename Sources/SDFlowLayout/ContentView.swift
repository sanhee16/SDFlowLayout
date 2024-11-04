//
//  ContentView.swift
//
//
//  Created by sandy on 8/28/24.
//

import Foundation
import SwiftUI

internal struct Student: Equatable, Hashable {
    var name: String
    var age: Int
    var grade: String
}

internal struct ContentView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .gray, .pink]
    private var items1: [String] = [
        "loremipsum", "dolorsit", "ametconsectetur", "adipiscingelit", "seddoeiusmod",
        "temporincididunt", "utlaboreetdolore", "magnaliqua", "utenaimad", "minimveniam",
        "quisnostrud", "exercitationullamco", "laborisnisiut", "aliquipexeacommodo",
        "consequatduis", "auteirure", "dolorinreprehenderit", "involuptatevelit",
        "essecillumdolore", "eu fugiatnulla", "pariatur", "excepteursintoccaecat",
        "cupidatatnon", "proident", "suntinculpaqui", "officiadeserunt", "mollitanimid",
        "estlaborum", "semperrisus", "lobortisphasellus", "suscipitnisl", "euismodnunc",
        "purusgravida", "malesuadafames", "acscelerisqueposuere", "nibhevulputate",
        "egestasviverra", "sedvestibulum", "velitlaoreet", "antein", "volutpati",
        "donecpharetra", "magnafringilla", "acscelerisquediam", "eusem", "vehiculametus",
        "nibhcras", "suscipiteget", "turpisconsequat", "enimquam", "venenatis",
        "diammauris", "nonaccumsan", "liberonunc", "egestascondimentum", "curabiturcursus",
        "proinsagittis", "molestielectus", "pellentesquetellus", "eleifendtristique",
        "vestibulumnisl", "quamsed", "nequepharetra", "quisquevitae", "iaculisvolutpat",
        "lectusquis", "sollicitudin", "feugiatimperdiet", "consequatnulla", "viverraaliquet",
        "habitantmorbi", "tristiqueinteger", "dignissimperdiet", "interdumvelit",
        "integerbibendum", "porttitoraccumsan", "ornarearcu", "doneclobortis",
        "venenatisenim", "tellusefficitur", "euismodfacilisis", "duiscursus",
        "maecenasvolutpat", "egetfaucibus", "morbinelementum", "tristiquemauris",
        "condimentumvitae", "aeneansollicitudin", "porttitordiam", "temporullamcorper",
        "justoefficitur", "sodalesmattis", "eleifendplacerat", "egestasphasellus",
        "tortorhendrerit", "interdumquis", "mattisodio", "sapiennec", "mauriscommodo",
        "molestiediam", "vehiculaeros", "vivamusfaucibus", "tinciduntcurabitur",
        "volutpatnunc", "donecvel", "eratfames"
    ]
    private let items2: [Student] = [
        Student(name: "Alice", age: 23, grade: "B+"),
        Student(name: "David", age: 45, grade: "A-"),
        Student(name: "John", age: 34, grade: "C"),
        Student(name: "Sarah", age: 28, grade: "B"),
        Student(name: "Lucas", age: 19, grade: "A"),
        Student(name: "Emily", age: 20, grade: "C-"),
        Student(name: "Grace", age: 30, grade: "B-"),
        Student(name: "Daniel", age: 32, grade: "A"),
        Student(name: "Chris", age: 42, grade: "C+"),
        Student(name: "Brian", age: 37, grade: "A+"),
        Student(name: "Zoe", age: 21, grade: "B+"),
        Student(name: "James", age: 26, grade: "A-"),
        Student(name: "Henry", age: 24, grade: "C"),
        Student(name: "Linda", age: 29, grade: "D"),
        Student(name: "Oscar", age: 31, grade: "B"),
        Student(name: "Nina", age: 25, grade: "C-"),
        Student(name: "Kevin", age: 38, grade: "B-"),
        Student(name: "Lily", age: 22, grade: "A"),
        Student(name: "Fiona", age: 39, grade: "C+"),
        Student(name: "Leo", age: 33, grade: "D+"),
        Student(name: "Ella", age: 40, grade: "B+"),
        Student(name: "Anna", age: 27, grade: "A-"),
        Student(name: "Mason", age: 41, grade: "C"),
        Student(name: "Stella", age: 35, grade: "D"),
        Student(name: "Ivy", age: 18, grade: "B"),
        Student(name: "Noah", age: 36, grade: "C-"),
        Student(name: "Olivia", age: 20, grade: "B-"),
        Student(name: "Ethan", age: 43, grade: "A"),
        Student(name: "Chloe", age: 44, grade: "C+"),
        Student(name: "Miles", age: 39, grade: "D+"),
        Student(name: "Ruby", age: 46, grade: "B+"),
        Student(name: "Sophie", age: 23, grade: "A-"),
        Student(name: "Ryan", age: 47, grade: "C"),
        Student(name: "Hazel", age: 21, grade: "D"),
        Student(name: "Sam", age: 48, grade: "B"),
        Student(name: "Bella", age: 49, grade: "C-"),
        Student(name: "Jack", age: 24, grade: "B-"),
        Student(name: "Vera", age: 22, grade: "A"),
        Student(name: "Gavin", age: 50, grade: "C+"),
        Student(name: "Jade", age: 29, grade: "D+"),
        Student(name: "Maya", age: 25, grade: "B+"),
        Student(name: "Aaron", age: 30, grade: "A-"),
        Student(name: "Luna", age: 26, grade: "C"),
        Student(name: "Eli", age: 19, grade: "D"),
        Student(name: "Zara", age: 28, grade: "B"),
        Student(name: "Tyler", age: 44, grade: "C-"),
        Student(name: "Faith", age: 45, grade: "B-"),
        Student(name: "Jude", age: 27, grade: "A"),
        Student(name: "Tara", age: 37, grade: "C+"),
    ]
    @State private var tags: [String] = ["Mercury",  "Venus", "Earth", "Mars", "Jupiter",  "Saturn", "Uranus", "Neptune", "Pluto"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("HashTag")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    SDFlowLayout(data: $tags.wrappedValue.indices, id: \.self) { idx in
                        hashTagItem($tags.wrappedValue[idx], onTapDelete: {
                            $tags.wrappedValue.remove(at: idx)
                        })
                        .padding([.trailing, .bottom], 5)
                    }
                })
                .padding()
                
                
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("String")
                        .font(.headline)
                        .padding(.bottom, 10)
                    SDFlowLayout(data: self.items1, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundColor(self.colors.randomElement()?.opacity(0.3))
                            )
                            .padding([.trailing, .bottom], 5)
                    }
                })
                .padding()
                
                Divider()
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Structure")
                        .font(.headline)
                        .padding(.bottom, 10)
                    SDFlowLayout(data: self.items2, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 2, content: {
                            HStack(alignment: .center, spacing: 2, content: {
                                Text(item.name)
                                Text("\(item.age)")
                            })
                            Text(item.grade)
                        })
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(self.colors.randomElement()?.opacity(0.3))
                        )
                        .padding([.trailing, .bottom], 20)
                    }
                })
                .padding()
            }
        }
    }
    
    private func hashTagItem(_ text: String, onTapDelete: @escaping ()->()) -> some View {
        HStack(alignment: .center, spacing: 0) {
            Text("#")
            Text(text)
                .padding(.trailing, 4)
//            Image(systemName: "xmark")
//                .font(.system(size: 14))
//                .onTapGesture {
//                    onTapDelete()
//                }
        }
        .padding(3)
//        .background(
//            RoundedRectangle(cornerRadius: 4)
//                .foregroundColor(self.colors.randomElement()?.opacity(0.3))
//        )
    }
}

#Preview {
    ContentView()
}
