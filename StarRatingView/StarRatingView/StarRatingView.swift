//
//  StarRatingView.swift
//  StarRatingView
//
//  Created by Safiyan Zulfiqar on 21/08/2023.
//

import Foundation
import SwiftUI

public struct StarRatingView: View {
    private let maxRating: Float
    private let mainColor = Color.yellow
    
    private let rating: Float
    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int
    
    public init(rating: Float, maxRating: Float = 5.0) {
        self.rating = rating
        self.maxRating = maxRating
        fullCount = Int(rating)
        emptyCount = Int(maxRating - rating)
        halfFullCount = (Float(fullCount + emptyCount) < maxRating) ? 1 : 0
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<fullCount, id: \.self) { _ in
                self.fullStar
            }
            ForEach(0..<halfFullCount, id: \.self) { _ in
                self.halfFullStar
            }
            ForEach(0..<emptyCount, id: \.self) { _ in
                self.emptyStar
            }
        }
    }
    
    // MARK: - Private
    private var fullStar: some View {
        Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(mainColor)
    }
    
    private var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(mainColor)
    }
    
    private var emptyStar: some View {
        Image(systemName: "star")
            .resizable()
            .scaledToFit()
            .foregroundColor(mainColor)
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 3.5)
            .previewLayout(.sizeThatFits)
    }
}
