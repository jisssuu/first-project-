//
//  CountryDetailView.swift
//  Flags
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct CountryDetailView: View {
    var country: (name: String, file:String)
    var body: some View {
        List {
            Image(country.file)
                .resizable()
                .frame(width: 200, height: 200)
            Text("\(country.name)!")
            
            HStack {
                Text(country.name)
                Text("\(country.name.count * 100)million people!")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            HStack{
                Text("GDP")
                Text("$\(country.name.count * 10)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            HStack{
                Text("Apple user")
                Text("\(country.name.count * 33/10)% people use")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(0 ..< 5 ) {index in
                Text("country name / \(index+1) : \(country.name.count/(index+1))" )
            }
        }
        .navigationTitle(country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country:Nations.contintents[0].countries[0])
    }
}
