// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public struct SDFlowLayout<Content: View, Data : RandomAccessCollection, ID : Hashable>: View where Data.Element: Equatable{
    var data: Data
    var id: KeyPath<Data.Element, ID>
    var content: (Data.Element) -> Content
    
    @State private var viewHeight = CGFloat.zero
    
    public init(data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.id = id
        self.content = content
        self.viewHeight = viewHeight
    }
    
    public var body: some View {
        GeometryReader { geometry in
            self.generateContents(geometry: geometry, totalHeight: $viewHeight)
        }
        .frame(height: viewHeight, alignment: .leading)
    }
    
    private func generateContents(geometry: GeometryProxy, totalHeight: Binding<CGFloat>) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(data, id: id) { item in
                content(item)
                    .alignmentGuide(.leading, computeValue: { dimensions in
                        if(abs(width - dimensions.width) > geometry.size.width) {
                            width = 0
                            height -= dimensions.height
                        }
                        let result = width
                        if item == self.data.last! {
                            width = 0
                        } else {
                            width -= dimensions.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if item == self.data.last! {
                            height = 0
                        }
                        totalHeight.wrappedValue += result
                        return result
                    })
            }
        }
        .background(
            GeometryReader { geometry -> Color in
                let rect = geometry.frame(in: .local)
                DispatchQueue.main.async {
                    $viewHeight.wrappedValue = rect.size.height
                }
                return .clear
            }
        )
    }
}
