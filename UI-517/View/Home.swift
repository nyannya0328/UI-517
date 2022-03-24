//
//  Home.swift
//  UI-517
//
//  Created by nyannyan0328 on 2022/03/23.
//

import SwiftUI

struct Home: View {
    @State var prgress : CGFloat = 0.5
    
    @State var currentMonth : String = "Jan"
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack{
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .padding(10)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.white.opacity(0.4),lineWidth: 1)
                        
                        )
                    
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .rotationEffect(.init(degrees: -90))
                }


            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            
            
            VStack{
                
                Text("Saved This Month")
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                AnimatedNumberText(value: prgress * 1300, font: .system(size: 35, weight:.bold),isCurrency: true)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color("Green"))
                    .padding(.top,5)
                    .lineLimit(1)
                
                
                SpeedMeter(progress: $prgress)
                
                
                
              
            }
            .padding(.top,50)
            .frame(maxWidth:.infinity)
            .frame(height: 350)
            .background{
                
                
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(
                    
                    
                    
                        LinearGradient(colors: [
                        
                        
                            Color("LightGreen").opacity(0.5),
                            Color("LightGreen").opacity(0.3),
                            Color("LightGreen").opacity(0.1),
                        
                        
                        
                        ] + Array(repeating: .clear, count: 5), startPoint: .topTrailing, endPoint: .bottomLeading)
                    
                    
                    
                    )
                
            }
            .padding(.horizontal)
            .padding(.top,15)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:15){
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        
                        HStack(spacing:20){
                            
                            
                            ForEach(months,id:\.self){month in
                                
                                
                                Text(month)
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                    .padding([.horizontal,.vertical],10)
                                    .background{
                                        
                                        
                                        if currentMonth == month{
                                            
                                            
                                            Capsule()
                                                .fill(.red.opacity(0.3))
                                                .matchedGeometryEffect(id: "TAB", in: animation)
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    .onTapGesture {
                                        withAnimation{
                                            prgress = progressArray[getIndex(month: month)]
                                            currentMonth = month
                                        }
                                    }
                                
                            }
                        }
                        
                    }
                    .padding(.top,20)
                    .padding(.horizontal)
                    
                    
                    
                    BottomContent()
                        .padding(.top,10)
                    
                    
                    
                }
                
                
                
                
            }
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG").ignoresSafeArea())
    }
    
    @ViewBuilder
    func BottomContent()->some View{
        
        
        VStack{
            
            ForEach(expenses){exp in
                
                
                HStack(spacing:25){
                    
                    
                    Image(exp.icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        
                        Text(exp.title)
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text(exp.subTitle)
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth:.infinity,alignment:.leading)
                    
                    
                    
                    Text(exp.amount)
                        .font(.title2)
                        .foregroundColor(.white)
                        
                    
                    
                }
                .padding(.horizontal)
                
            }
        }
        
        
    }
    func getIndex(month : String)->Int{
        
        
        return months.firstIndex { value in
            
            month == value
        } ?? 0
        
        
        
    }
    
    
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
