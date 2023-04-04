//
//  FlemateView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 1/10/2022.
//

import SwiftUI

struct FlameLetView: View {
    @Binding var sentenceIndex:Int
    @Binding var bigger:Bool
    var sentence:[String] = ["You are great!", "You did a great job. I will let others know", "You are awesome! Never forget that.", "You've completed a task. Reward yourself with a break.", "You can accomplish anything that you put your mind to", "You are perfect just the way you are.", "Everything you do is with excellence.", "You are an incredible human", "Don't forget to take a break", "I am so proud of you." ,"You deserve a hug right now."]
    var body: some View {
        
        TimelineView(.animation){ timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3)*50)
            let x = cos(angle.radians)
            
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6)*15)
            let x2 = cos(angle2.radians)
            
            withAnimation(.linear(duration: 4)){
                Text("\(sentence[sentenceIndex])")
                    .frame(width: 300,height: 60)
                    .lineLimit(3)
                    .offset(x:150, y:20)
            }
            
            
            Canvas{ context, size in
                context.fill(path(in: CGRect(x: 20, y: 20, width: size.width, height: size.height), x: x, x2: x2), with: .color(.orange))
                
            }
            .frame(width: bigger ? 80 : 80*x2, height: bigger ? 100 : 100*x2*0.9, alignment: .topLeading)
            .shadow(color: .yellow, radius: 5, x: -3, y: 1)
            
        }
    }

    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.41283*width, y: 0.00423*height))
        path.addCurve(to: CGPoint(x: 0.39294*width, y: 0), control1: CGPoint(x: 0.40682*width, y: 0.00146*height), control2: CGPoint(x: 0.39995*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.37305*width, y: 0.00423*height), control1: CGPoint(x: 0.38594*width, y: 0), control2: CGPoint(x: 0.37907*width, y: 0.00146*height))
        path.addCurve(to: CGPoint(x: 0.36365*width, y: 0.0164*height), control1: CGPoint(x: 0.36809*width, y: 0.00727*height), control2: CGPoint(x: 0.36475*width, y: 0.01159*height))
        path.addCurve(to: CGPoint(x: 0.36709*width, y: 0.03032*height), control1: CGPoint(x: 0.36255*width, y: 0.02121*height), control2: CGPoint(x: 0.36377*width, y: 0.02616*height))
        /////////
        path.addCurve(to: CGPoint(x: 0.34819*width, y: 0.53895*height), control1: CGPoint(x: 0.48941*width, y: 0.19372*height), control2: CGPoint(x: 0.51526*width*x, y: 0.4162*height))
        path.addCurve(to: CGPoint(x: 0.19902*width, y: 0.38551*height), control1: CGPoint(x: 0.28391*width, y: 0.49728*height), control2: CGPoint(x: 0.23288*width, y: 0.44479*height))
        ///11111111
        path.addCurve(to: CGPoint(x: 0.05097*width*x, y: 0.49834*height), control1: CGPoint(x: 0.13724*width, y: 0.41199*height*x), control2: CGPoint(x: 0.08603*width, y: 0.45101*height))
        path.addCurve(to: CGPoint(x: 0.00013*width, y: 0.65402*height), control1: CGPoint(x: 0.01591*width, y: 0.54568*height), control2: CGPoint(x: 0.00168*width, y: 0.59952*height))
        path.addCurve(to: CGPoint(x: 0.04411*width, y: 0.79276*height), control1: CGPoint(x: 0.00265*width, y: 0.70207*height), control2: CGPoint(x: 0.0176*width, y: 0.74924*height))
        path.addCurve(to: CGPoint(x: 0.15447*width, y: 0.90744*height), control1: CGPoint(x: 0.07062*width, y: 0.83628*height), control2: CGPoint(x: 0.10814*width, y: 0.87527*height))
        path.addCurve(to: CGPoint(x: 0.31389*width, y: 0.98007*height), control1: CGPoint(x: 0.2008*width, y: 0.93961*height), control2: CGPoint(x: 0.25501*width, y: 0.9643*height))
        path.addCurve(to: CGPoint(x: 0.49736*width, y: 0.99925*height), control1: CGPoint(x: 0.37278*width, y: 0.99584*height), control2: CGPoint(x: 0.43516*width, y: 1.00235*height))
        path.addCurve(to: CGPoint(x: 0.9946*width, y: 0.65402*height), control1: CGPoint(x: 0.81758*width, y: 0.99925*height), control2: CGPoint(x: 0.98366*width, y: 0.84581*height))
        path.addCurve(to: CGPoint(x: 0.41283*width, y: 0.00423*height), control1: CGPoint(x: 1.00753*width, y: 0.42387*height), control2: CGPoint(x: 0.7957*width, y: 0.14079*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.37389*width, y: 0.9058*height))
        path.addCurve(to: CGPoint(x: 0.23262*width, y: 0.86205*height), control1: CGPoint(x: 0.32114*width, y: 0.90625*height), control2: CGPoint(x: 0.27033*width, y: 0.89051*height))
        path.addCurve(to: CGPoint(x: 0.17284*width, y: 0.75405*height), control1: CGPoint(x: 0.19492*width, y: 0.83359*height), control2: CGPoint(x: 0.17341*width, y: 0.79474*height))
        path.move(to: CGPoint(x: 0.75037*width, y: 0.57388*height))
        path.addCurve(to: CGPoint(x: 0.68123*width, y: 0.5961*height), control1: CGPoint(x: 0.73106*width, y: 0.58772*height), control2: CGPoint(x: 0.70619*width, y: 0.59571*height))
        path.addCurve(to: CGPoint(x: 0.61728*width, y: 0.57597*height), control1: CGPoint(x: 0.65628*width, y: 0.59649*height), control2: CGPoint(x: 0.63327*width, y: 0.58925*height))
        path.move(to: CGPoint(x: 0.72273*width, y: 0.48601*height))
        path.addCurve(to: CGPoint(x: 0.76786*width, y: 0.46915*height), control1: CGPoint(x: 0.73434*width, y: 0.47601*height), control2: CGPoint(x: 0.75058*width, y: 0.46995*height))
        path.addCurve(to: CGPoint(x: 0.81487*width, y: 0.48175*height), control1: CGPoint(x: 0.78514*width, y: 0.46835*height), control2: CGPoint(x: 0.80205*width, y: 0.47288*height))
        path.move(to: CGPoint(x: 0.5679*width, y: 0.48531*height))
        path.addCurve(to: CGPoint(x: 0.61303*width, y: 0.46845*height), control1: CGPoint(x: 0.57952*width, y: 0.47531*height), control2: CGPoint(x: 0.59575*width, y: 0.46925*height))
        path.addCurve(to: CGPoint(x: 0.66004*width, y: 0.48105*height), control1: CGPoint(x: 0.63031*width, y: 0.46765*height), control2: CGPoint(x: 0.64722*width, y: 0.47218*height))
            
        return path
    }
}




