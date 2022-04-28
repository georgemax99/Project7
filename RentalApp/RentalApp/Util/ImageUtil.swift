import Foundation
import UIKit


// Tutorial source: https://www.advancedswift.com/resize-uiimage-no-stretching-swift/
class ImageUtil {
    
    func resizedImage(image: UIImage, scale: Double) -> UIImage? {

        var size = image.size
        size.height *= scale
        size.width *= scale
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
