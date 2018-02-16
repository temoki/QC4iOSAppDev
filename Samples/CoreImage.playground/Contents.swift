import UIKit
import PlaygroundSupport

struct StopWatch {
    private let start = Date()
    func lap() { print("lap: \(Date().timeIntervalSince(start)) sec") }
}

// Core Image は iPhone シミュレータだと遅い

let originalImage = #imageLiteral(resourceName: "lena_std.tiff")
let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
imageView.contentMode = .scaleAspectFill
imageView.image = originalImage
PlaygroundPage.current.liveView = imageView

let input = CIImage(image: originalImage)
let 🕑 = StopWatch()

let sepia = CIFilter(name: "CISepiaTone")!
sepia.setValue(input, forKey: kCIInputImageKey)
sepia.setValue(0.8, forKey: kCIInputIntensityKey)
let sepiaOutput = sepia.outputImage!
🕑.lap()

let pixellate = CIFilter(name: "CIPixellate")!
pixellate.setValue(sepia.outputImage!, forKey: kCIInputImageKey)
let pixellateOutput = pixellate.outputImage!
🕑.lap()

imageView.image = UIImage(ciImage: pixellateOutput)


