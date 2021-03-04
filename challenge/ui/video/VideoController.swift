//
//  VideoController.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import UIKit
import AVFoundation
import AVKit
import SwiftUI

class VideoController: UIViewController {
    
    
    // MARK: - Properties
    
    var videoView = VideoView()
    let viewmodel = VideoViewmodel()
    var lessonTitle: UILabel!
    var lessonSubtitle: UILabel!
    var bgView: BgAnimation!
    var lesson: Lesson? {
        didSet {
            videoView.setupPlayerView(url: lesson?.media_url ?? "")
//            lessonTitle.text = lesson?.name ?? "Lesson Title"
        }
    }
    
    
    
    
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.navigationController?.navigationBar.backgroundColor = .clear
        let backButton = view.generateImageButton(image: "back")
        backButton.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = leftItem
        
    }
    
    
    func setupView() {
        bgView = BgAnimation()
        lessonTitle = view.generateLabel(title: "Lesson Title", size: 20)
        lessonSubtitle = view.generateLabel(title: "Lesson Sub Title", size: 12)
        lessonSubtitle.textColor = .gray
        view.addSubviews(bgView, videoView, lessonTitle, lessonSubtitle)
        
        bgView.frame = view.bounds
        
        videoView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: .zero, height: 200))
        
        lessonTitle.anchor(top: videoView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        lessonSubtitle.anchor(top: lessonTitle.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        videoView.player?.play()
        viewmodel.saveLesson(lesson: self.lesson!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        videoView.player?.pause()
        videoView.player = nil
    }
    

}

    
    
    
    struct VideoController_Previews: PreviewProvider {
        static var previews: some View {
            Container().edgesIgnoringSafeArea(.all)
        }
        
        struct Container: UIViewControllerRepresentable {
            func makeUIViewController(context: Context) -> UIViewController {
                UINavigationController(rootViewController: VideoController())
                
            }
            
            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
                
            }
            
            typealias UIViewControllerType = UIViewController
            
            
        }
    }
    

