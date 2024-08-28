// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

struct SDFlowLayout<Content: View, Data : RandomAccessCollection, ID : Hashable>: View where Data.Element: Equatable{
    var data: Data
    var id: KeyPath<Data.Element, ID>
    var content: (Data.Element) -> Content
    
    var viewBackground: Color = Color.white
    var cloudBackground: Color = Color.gray
    var font: Font = Font.body
    var action: (String) -> ()
    
    @State private var viewHeight = CGFloat.zero
    
    var body: some View {
        GeometryReader { geometry in
            self.generateHashtagViews(g: geometry, totalHeight: $viewHeight)
        }
        .frame(height: viewHeight, alignment: .leading)
    }
    
    private func generateHashtagViews(g: GeometryProxy, totalHeight: Binding<CGFloat>) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(data, id: id) { item in
                content(item)
                    .padding([.leading, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if(abs(width - d.width) > g.size.width){
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == self.data.last! {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if item == self.data.last! {
                            height = 0
                        }
                        return result
                    })
            }
            .onChange(of: height, perform: { value in
                totalHeight.wrappedValue += height
            })
        }.background(getViewHeight($viewHeight))
    }
    
    private func getViewHeight(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geo -> Color in
            let rect = geo.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
