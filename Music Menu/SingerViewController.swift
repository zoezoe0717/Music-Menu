//
//  SingerViewController.swift
//  Music Menu
//
//  Created by Zoe on 2021/12/5.
//

import UIKit
import AVFoundation

class SingerViewController: UIViewController {
    let player = AVPlayer()
    var playerItem: AVPlayerItem?
    var fileUrl = Bundle.main.url(forResource: nil, withExtension: "mp3")
    
    let singerName = ["Macdella","EyeballRay","SheAth"]
    let songName = ["不想肚子餓","ButterflyRay","Put on my hat"]
    let singerImage = ["大麥.jpeg","eyeballray.jpeg","Sheth.jpeg"]
    let masicArray = ["Macdella - 不想肚子餓","EyeballRay-花蝴蝶","SheATH - Put on my hat"]
    
    var arrayIndex:Int = 0
    
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var songNameLable: UILabel!
    @IBOutlet weak var singerNameLable: UILabel!
    @IBOutlet weak var musicSegmentControl: UISegmentedControl!
    @IBOutlet weak var singerPageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singerGradientBackgourd()
        sync()
        imageSet()
        musicPlayer()

    }
    //設定背景為漸層色
    func singerGradientBackgourd(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [CGColor(srgbRed: 22/255, green: 34/255, blue: 42/255, alpha: 1),CGColor(srgbRed: 58/255, green: 96/255, blue: 115/255, alpha: 1)]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    func musicPlayer(){
        if arrayIndex == 0 {
            fileUrl = Bundle.main.url(forResource: masicArray[0], withExtension: "mp3")!
        }else if arrayIndex == 1 {
            fileUrl = Bundle.main.url(forResource: masicArray[1], withExtension: "mp3")!
        }else {
            fileUrl = Bundle.main.url(forResource: masicArray[2], withExtension: "mp3")!
        }
        playerItem = AVPlayerItem(url: fileUrl!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    func imageSet(){
        singerImageView.layer.borderWidth = 5
        singerImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        singerImageView.layer.cornerRadius = 50
        singerImageView.clipsToBounds = true

    }
    
    
    func sync(){
        singerImageView.image = UIImage(named: singerImage[arrayIndex])
        singerNameLable.text = singerName[arrayIndex]
        songNameLable.text = songName[arrayIndex]
        musicSegmentControl.selectedSegmentIndex = arrayIndex
        singerPageControl.currentPage = arrayIndex
        
    }
    
    @IBAction func pageControl(_ sender: Any) {
        if singerPageControl.currentPage == 0 {
            arrayIndex = 0
        }else if singerPageControl.currentPage == 1 {
            arrayIndex = 1
        }else {
            arrayIndex = 2
        }
        musicPlayer()
        sync()
    }
    
    @IBAction func segmentedControl(_ sender: Any) {
        if musicSegmentControl.selectedSegmentIndex == 0 {
            arrayIndex = 0
        }else if musicSegmentControl.selectedSegmentIndex == 1 {
            arrayIndex = 1
        }else{
            arrayIndex = 2
        }
        musicPlayer()
        sync()
    }
    
    @IBAction func leftButton(_ sender: Any) {
        if arrayIndex == 2 {
            arrayIndex = arrayIndex - 1
        }else if arrayIndex == 1 {
            arrayIndex = arrayIndex - 1
        }else{
            arrayIndex = arrayIndex + 2
        }
        sync()
        musicPlayer()
    }
    
    @IBAction func rightButton(_ sender: Any) {
        if arrayIndex == 0 {
            arrayIndex = arrayIndex + 1
        }else if arrayIndex == 1 {
            arrayIndex = arrayIndex + 1
        }else{
            arrayIndex = arrayIndex - 2
        }
        musicPlayer()
        sync()
    }
    @IBAction func rightSwipe(_ sender: Any) {
        if arrayIndex == 0 {
            arrayIndex = arrayIndex + 1
        }else if arrayIndex == 1 {
            arrayIndex = arrayIndex + 1
        }else{
            arrayIndex = arrayIndex - 2
        }
        musicPlayer()
        sync()
        
    }
    @IBAction func leftSwipe(_ sender: Any) {
        if arrayIndex == 2 {
            arrayIndex = arrayIndex - 1
        }else if arrayIndex == 1 {
            arrayIndex = arrayIndex - 1
        }else{
            arrayIndex = arrayIndex + 2
        }
        sync()
        musicPlayer()
    }

}
