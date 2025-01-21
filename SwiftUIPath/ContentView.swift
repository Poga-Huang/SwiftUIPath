//
//  ContentView.swift
//  SwiftUIPath
//
//  Created by 黃柏嘉 on 2025/01/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            PieChart()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}


//圓形環圈圖
struct CircleChart: View {
    var body: some View {
        ZStack {
          Circle()
            .trim(from: 0, to: 0.2)
            .stroke(.blue, lineWidth: 80)
                    
          Circle()
            .trim(from: 0.2, to: 0.6)
            .stroke(.orange, lineWidth: 90)
            .overlay {
              Text("40%")
                .font(.system(size: 30,
                      weight: .heavy,
                      design: .rounded))
                .foregroundStyle(.white)
                .offset(x: -100, y: 70.0)
          }
                    
          Circle()
            .trim(from: 0.6, to: 0.9)
            .stroke(.green, lineWidth: 80)
                    
          Circle()
            .trim(from: 0.9, to: 1.0)
            .stroke(.yellow, lineWidth: 80)
        }
        .frame(width: 250)
    }
}
//進度顯示
struct ProgressChart: View {
    var body: some View {
        ZStack {
          Circle()
            .stroke(lineWidth: 20)
            .fill(.gray)
                    
          Circle()
            .trim(from: 0, to: 0.85)
            .stroke(lineWidth: 20)
            .fill(.blue)
            .rotationEffect(.degrees(270))
            .overlay {
              Text("85%")
                .multilineTextAlignment(.center)
                .fontWeight(.black)
                .font(.largeTitle)
          }
        }
        .frame(width: 200)
    }
}
//Sahpe
struct Mount: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addQuadCurve(to: CGPoint(x: rect.size.width/2,
                                      y: 0),
                          control: CGPoint(x: rect.size.width/4,
                                           y: -20))
        path.addQuadCurve(to: CGPoint(x: rect.size.width,
                                      y: 0),
                          control: CGPoint(x: rect.size.width * 0.75,
                                           y: -20))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
 
        return path
    }
}

//圓餅圖
struct PieChart: View {
    var body: some View {
        ZStack {
          Path() { path in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addArc(center: CGPoint(x: 100, y: 100),
                        radius: 50,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 270),
                        clockwise: true)
          }
          .fill(.blue)
                        
          Path() { path in
             path.move(to: CGPoint(x: 100, y: 100))
             path.addArc(center: CGPoint(x: 100, y: 100),
                         radius: 50,
                         startAngle: Angle(degrees: 90),
                         endAngle: Angle(degrees: 0),
                         clockwise: true)
                            
             path.closeSubpath()
          }
          .fill(.purple)
          .stroke(.red, lineWidth: 3)
          .offset(CGSize(width: 6.0, height: 6.0))
          .overlay {
              Text("25%")
                  .font(.system(size: 15,
                        weight: .semibold,
                        design: .rounded))
                  .offset(x: -70, y: -25)
                  .foregroundStyle(.white)
          }
                        
          Path() { path in
             path.move(to: CGPoint(x: 100, y: 100))
             path.addArc(center: CGPoint(x: 100, y: 100),
                         radius: 50,
                         startAngle: Angle(degrees: 180),
                         endAngle: Angle(degrees: 90),
                         clockwise: true)
          }
          .fill(.green)
                        
          Path() { path in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addArc(center: CGPoint(x: 100, y: 100),
                        radius: 50,
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 180),
                        clockwise: true)
          }
          .fill(.gray)
        }
        .frame(height: 300)
    }
}
