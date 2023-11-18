//
//  TAExtension+UIImageView.swift
//  TianSources
//
//  Created by ThienTran on 18/11/2023.



import Foundation
import UIKit
import Kingfisher

public extension UIImage {
    
    convenience init?(base64String: String) {
        
        guard let stringData = Data(base64Encoded: base64String) else {
            print("Error: couldn't parse base64String to data")
            self.init()
            return
        }
        
        self.init(data: stringData)
    
    }
}

//MARK: Kingfisher for UIImage
extension String {
    func getNumbers() -> [NSNumber] {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let charset = CharacterSet.init(charactersIn: " ,.")
        return matches(for: "[+-]?([0-9]+([., ][0-9]*)*|[.][0-9]+)").compactMap { string in
            return formatter.number(from: string.trimmingCharacters(in: charset))
        }
    }

    // https://stackoverflow.com/a/54900097/4488252
    func matches(for regex: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: [.caseInsensitive]) else { return [] }
        let matches  = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.compactMap { match in
            guard let range = Range(match.range, in: self) else { return nil }
            return String(self[range])
        }
    }
}

public extension UIImage {
    func getFileSizeInfo(allowedUnits: ByteCountFormatter.Units = .useMB,
                         countStyle: ByteCountFormatter.CountStyle = .file) -> String? {
        // https://developer.apple.com/documentation/foundation/bytecountformatter
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.countStyle = countStyle
        return getSizeInfo(formatter: formatter)
    }

    func getFileSize(allowedUnits: ByteCountFormatter.Units = .useMB,
                     countStyle: ByteCountFormatter.CountStyle = .memory) -> Double? {
        guard let num = getFileSizeInfo(allowedUnits: allowedUnits, countStyle: countStyle)?.getNumbers().first else { return nil }
        return Double(truncating: num)
    }

    func getSizeInfo(formatter: ByteCountFormatter, compressionQuality: CGFloat = 1.0) -> String? {
        guard let imageData = jpegData(compressionQuality: compressionQuality) else { return nil }
        return formatter.string(fromByteCount: Int64(imageData.count))
    }
}

extension UIImage {
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }

    func compress(to kb: Int, allowedMargin: CGFloat = 0.2) -> Data {
        let bytes = kb * 1024
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        var complete = false
        while(!complete) {
            if let data = holderImage.jpegData(compressionQuality: 1.0) {
                let ratio = data.count / bytes
                if data.count < Int(CGFloat(bytes) * (1 + allowedMargin)) {
                    complete = true
                    return data
                } else {
                    let multiplier:CGFloat = CGFloat((ratio / 5) + 1)
                    compression -= (step * multiplier)
                }
            }
            
            guard let newImage = holderImage.resized(withPercentage: compression) else { break }
            holderImage = newImage
        }
        return Data()
    }
}

public extension UIImageView {
//    func setImageFromData(imageName: String) {
//        let image = UIImage(named: imageName ,
//                            in: BundleType.UBankCore.getBundle(),
//                            compatibleWith: nil)
//        self.image = image
//    }
}

//MARK: Kingfisher for UIImageView
public extension UIImageView {
    func setImage(from url: URL, placeHolderImg: UIImage? = nil, completion: @escaping (UIImage?)->Void = {_ in }) {
        
        let kingFisherProcessor = DownsamplingImageProcessor(size: self.bounds.size) |> RoundCornerImageProcessor(cornerRadius: self.cornerRadius_)
       
        self.kf.setImage(
            with: url,
            placeholder: placeHolderImg,
            options: [
                .processor(kingFisherProcessor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.25)),
            ],
            progressBlock: { receivedSize, totalSize in
                // Progress updated
            },
            completionHandler: { result in
                
                switch result {
                    
                case .success(let imgResult):
                    
                     guard let imgData = imgResult.image.jpegData(compressionQuality: 1.0) else {
                         completion(nil)
                         return
                     }
                     
                     completion(UIImage(data: imgData))
                    
                case .failure(_):
                    completion(nil)
                    return
                }
        
                // Done
            }
        )

    }
    
    
    
    func cancelDownloadImgTask() {
        self.kf.cancelDownloadTask()
    }
    
}
