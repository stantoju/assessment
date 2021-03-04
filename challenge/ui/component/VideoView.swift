//
//  VideoView.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import UIKit
import AVKit
import SwiftUI

class VideoView: UIView {
    
    
    
    // MARK: - Properties
    
    var showControls = true
    var player: AVPlayer?
    var activityIndicatorView: UIActivityIndicatorView!
    var pausePlayButton: UIButton!
    var currentTimeLabel: UILabel!
    var videoLengthLabel: UILabel!
    var isPlaying = false
    var controlsView: UIStackView!
    var backButton: UIButton!
    var forwardButton: UIButton!
    var controlsContainerView: UIView!
    
    
    lazy var videoSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        let circleImage = makeCircleWith(size: CGSize(width: 20, height: 20),
                                         backgroundColor: .white)
        
        slider.setThumbImage(circleImage, for: .normal)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        
        return slider
    }()
    
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupGradientLayer()
        
    }
    
    
    // MARK: - Handlers
    
    private func setupView(){
        
        controlsContainerView = generateView()
        controlsContainerView.backgroundColor = .black
        
        activityIndicatorView = generateActivityIndicator()
        activityIndicatorView.style = .large
        activityIndicatorView.startAnimating()
        
        pausePlayButton = generateImageButton(image: "pause")
        pausePlayButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        
        currentTimeLabel = generateLabel(title: "00.00", size: 12)
        currentTimeLabel.textColor = .white
        
        videoLengthLabel = generateLabel(title: "00.00", size: 12)
        videoLengthLabel.textAlignment = .right
        videoLengthLabel.textColor = .white
        
        backButton = generateImageButton(image: "skip-back")
        forwardButton = generateImageButton(image: "skip-forward")
        
        controlsView = UIStackView(arrangedSubviews: [backButton, pausePlayButton, forwardButton])
        controlsView.spacing = 50
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.toggleContolsView))
        controlsView.addGestureRecognizer(gesture)
            
            
        
        addSubview(controlsContainerView)
        controlsContainerView.fillSuperview()
        
        controlsContainerView.addSubviews(activityIndicatorView,controlsView,currentTimeLabel,videoLengthLabel, videoSlider)
        
        activityIndicatorView.centerInSuperview()
        
        controlsView.centerInSuperview()
        currentTimeLabel.anchor(top: nil, leading: controlsContainerView.leadingAnchor, bottom: controlsContainerView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 30, right: 10))
        
        videoLengthLabel.anchor(top: nil, leading: nil, bottom: controlsContainerView.bottomAnchor, trailing: controlsContainerView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 30, right: 10))
        
        videoSlider.anchor(top: nil, leading: currentTimeLabel.trailingAnchor, bottom: controlsContainerView.bottomAnchor, trailing: videoLengthLabel.leadingAnchor, padding: .init(top: 0, left: 10, bottom: 25, right: 10))
        
        
        
        
    }
    
    
     func setupPlayerView(url: String) {
        
        if let url = URL(string: url) {
            player = AVPlayer(url: url)

            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = bounds

            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)

            //track player progress

            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in

                let seconds = CMTimeGetSeconds(progressTime)
                let secondsString = String(format: "%02d", seconds.truncatingRemainder(dividingBy: 60))
                let minutesString = String(format: "%02d", seconds.truncatingRemainder(dividingBy: 60))

                self.currentTimeLabel.text = "\(minutesString):\(secondsString)"

                //lets move the slider thumb
                if let duration = self.player?.currentItem?.duration {
                    let durationSeconds = CMTimeGetSeconds(duration)

                    self.videoSlider.value = Float(seconds / durationSeconds)

                }

            })
        }
        
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        controlsContainerView.layer.addSublayer(gradientLayer)
    }
    
    @objc private func toggleContolsView(){
        
            UIView.animate(withDuration: 0.5) {
                if self.showControls {
                    self.controlsContainerView.alpha = 0
                } else {
                        self.controlsContainerView.alpha = 0
                }
                self.showControls = !self.showControls
            }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //this is when the player is ready and rendering frames
        if keyPath == "currentItem.loadedTimeRanges" {
            activityIndicatorView.stopAnimating()
            controlsContainerView.backgroundColor = .clear
            pausePlayButton.isHidden = false
            isPlaying = true
            
            if let duration = player?.currentItem?.duration {
                let seconds = CMTimeGetSeconds(duration)
                
                let secondsText = Int(seconds) % 60
                let minutesText = String(format: "%02d", Int(seconds) / 60)
                videoLengthLabel.text = "\(minutesText):\(secondsText)"
            }
        }
    }
    
    
    @objc func handlePause() {
        if isPlaying {
            player?.pause()
            pausePlayButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player?.play()
            pausePlayButton.setImage(UIImage(named: "pause"), for: .normal)
        }
        
        isPlaying = !isPlaying
    }
    
    @objc func handleSliderChange() {
        print(videoSlider.value)
        
        if let duration = player?.currentItem?.duration {
            let totalSeconds = CMTimeGetSeconds(duration)
            
            let value = Float64(videoSlider.value) * totalSeconds
            
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                //perhaps do something later here
            })
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            VideoView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
