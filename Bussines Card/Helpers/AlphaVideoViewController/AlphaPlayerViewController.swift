////
////  ViewController.swift
////  MyTransparentVideoExample
////
////  Created by Quentin on 27/10/2017.
////  Copyright © 2017 Quentin Fasquel. All rights reserved.
////
//
//import AVFoundation
//import UIKit
//
//class AlphaPlayerViewController: UIViewController {
//    
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    let videoSize = CGSize(width: 300, height: 300)
//    let playerView = AVPlayerView(frame: CGRect(origin: .zero, size: videoSize))
//    view.addSubview(playerView)
//    
//    // Use Auto Layout anchors to center our playerView
//    playerView.translatesAutoresizingMaskIntoConstraints = false
//    playerView.widthAnchor.constraint(equalToConstant: videoSize.width).isActive = true
//    playerView.heightAnchor.constraint(equalToConstant: videoSize.height).isActive = true
//    playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    playerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    
//    // Setup our playerLayer to hold a pixel buffer format with "alpha"
//    let playerLayer: AVPlayerLayer = playerView.playerLayer
//    playerLayer.pixelBufferAttributes = [
//      (kCVPixelBufferPixelFormatTypeKey as String): kCVPixelFormatType_32BGRA]
//
//    // Our AVPlayerLayer has a default backgroundColor to nil
//    // Set a backgroundColor the viewController's view
//    view.backgroundColor = .red
//
//    // Setup looping on our video
//    playerView.isLoopingEnabled = true
//    
//    // Load our player item
//    let videoUrl: URL = Bundle.main.url(forResource: "Vertical - vertical duplication", withExtension: "mp4")!
//    playerView.loadVideo(from: videoUrl) { [weak self] playerItem, error in
//      guard let playerItem = playerItem, error == nil else {
//        return print("Something went wrong when loading our video", error!)
//      }
//
//      // Set the video so that seeking also renders with transparency
//      playerItem.seekingWaitsForVideoCompositionRendering = true
//      // Apply a video composition (which applies our custom filter)
//      playerItem.videoComposition = self?.createVideoComposition(for: playerItem)
//      // Finally, we can start playing
//      playerView.player?.play()
//     
//      //self?.animateBackgroundColor()
//    }
//  }
//
//  override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//    // Dispose of any resources that can be recreated.
//  }
//
//  func createVideoComposition(for playerItem: AVPlayerItem) -> AVVideoComposition {
//    let videoSize = CGSize(width: playerItem.presentationSize.width, height: playerItem.presentationSize.height / 2.0)
//    let composition = AVMutableVideoComposition(asset: playerItem.asset, applyingCIFiltersWithHandler: { request in
//      let sourceRect = CGRect(origin: .zero, size: videoSize)
//      let alphaRect = sourceRect.offsetBy(dx: 0, dy: sourceRect.height)
//      let filter = AlphaFrameFilter()
//      filter.inputImage = request.sourceImage.cropped(to: alphaRect)
//        .transformed(by: CGAffineTransform(translationX: 0, y: -sourceRect.height))
//      filter.maskImage = request.sourceImage.cropped(to: sourceRect)
//      return request.finish(with: filter.outputImage!, context: nil)
//    })
//
//    composition.renderSize = videoSize
//    return composition
//  }
//  
//  var backgroundColors: [UIColor] = [.green, .yellow]
//
//  // Infinite animation
//  func animateBackgroundColor() {
//    UIView.animate(
//      withDuration: 2.0,
//      delay: 0.0,
//      options: [],
//      animations: {
//        let colorIndex = self.backgroundColors.index(of: self.view.backgroundColor!) ?? 0
//        let countColors = self.backgroundColors.count
//        self.view.backgroundColor = self.backgroundColors[(colorIndex + 1) % countColors]
//    }, completion: { _ in
//      self.animateBackgroundColor()
//    })
//  }
//}
