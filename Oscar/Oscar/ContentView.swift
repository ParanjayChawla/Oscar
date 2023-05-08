//
//  ContentView.swift
//  Oscar
//
//  Created by Apple on 03/10/22.
//

import SwiftUI


struct ContentView: View {
    @State var price : String
    @State var years : String
    @State var rate : String
    var answer : Float
    var body: some View {
        VStack {
            
            Label("OSCAR",systemImage: "").scenePadding(.all).font(.largeTitle).bold(true)
            Image(uiImage: UIImage(named: "oscar_icon")!).fixedSize().scenePadding(.bottom)
            HStack {
                Label("Price",systemImage: "dollarsign.square").lineLimit(0)
                TextField("enter the total cost",text: $price).keyboardType(.numberPad)
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            HStack {
                Label("Years",systemImage: "timelapse").lineLimit(0)
                TextField("duration of the loan in years",text: $years).keyboardType(.numberPad)
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            HStack {
                Label("Interest %",systemImage: "bandage.fill").lineLimit(0)
                TextField("pain percentage",text: $rate).keyboardType(.decimalPad)
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            
            
            
            
            let a = hello(years: $years.wrappedValue, p: $price.wrappedValue, int: $rate.wrappedValue)
            
            HStack {
                Label("Your Montly payments are \(a)", systemImage: "arrow.right").lineLimit(0)
            }.padding(EdgeInsets(top: 20, leading: 5, bottom: 50, trailing: 5))
            
            
        }
        .padding()
    }
    private func hello (years: String, p: String, int: String) -> String {
        // Function that calculates the payments per month
        if (years == "" || p == "" || int == "" ){
            return " ... not yet"
        }
        
        let y = Double(years)
        let p = Double(p)
        let i = Double(int)
        let p_int = (i! / 100.0) / 12.0
        
        let top = (p_int) * (pow(1.0 + (p_int) , y! * 12.0) )
        print("top",top)
        let b = (pow(1.0 + (p_int) , y! * 12.0) ) - 1
        print("b",b)
        let a = p! * (top/b)
        print("a",a)
        if (a.isNaN) {
            return " ... your inputs seem a little off."
        }
        let roundedValue = round(a * 100) / 100.0
        return "\(roundedValue)"
    }
    
    
}


func config() {
    
}

