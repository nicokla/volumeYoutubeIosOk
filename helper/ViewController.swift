import UIKit

class ViewController: UIViewController {
    var isPlaying:Bool = true

    @IBOutlet weak var secondesText: UILabel!
    
    @IBAction func volumeSliderAction(_ sender: UISlider) {
        ytPlayerView.player!.volume = sender.value / sender.maximumValue
    }
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func timeSliderAction(_ sender: UISlider) {
        let myFloat = sender.value / sender.maximumValue
        let myTime = myFloat * Float(ytPlayerView.duration)
        ytPlayerView.seek(seekToSeconds: myTime, allowSeekAhead: true)
    }
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBAction func boutonNextAction(_ sender: Any) {
        performSegue(withIdentifier: "youpi", sender: self)
    }
    
    @IBAction func boutonPlayPauseAction(_ sender: Any) {
        isPlaying = !isPlaying
        if (isPlaying) {
            boutonPlayPause.setTitle("pause", for: UIControl.State.normal)
            ytPlayerView.playVideo()
        } else {
            boutonPlayPause.setTitle("play", for: UIControl.State.normal)
            ytPlayerView.pauseVideo()
        }
    }
    
    @IBOutlet weak var boutonNext: UIButton!
    @IBOutlet weak var boutonPlayPause: UIButton!
    @IBOutlet weak var ytPlayerView: YTPlayerView!
    
    var videoId:String = "EqPtz5qN7HM"
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideoSwift()
    }

    func loadVideoSwift(){
        let playerVars:[String: Any] = [
            "controls" : "0",
            "showinfo" : "0",
            "autoplay": "0",
            "rel": "0",
            "modestbranding": "0",
//            "iv_load_policy" : "3",
            "fs": "0",
            "playsinline" : "1"
            ]
        ytPlayerView.delegate = self
        _ = ytPlayerView.load(videoId: videoId, playerVars: playerVars)
//        ytPlayerView.isUserInteractionEnabled = false
//        ytPlayerView!.playVideo()
    }
    
}

extension ViewController: YTPlayerViewDelegate{
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
//        playerView.petitVolume()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
//        print("Quality :: ", quality)
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState){}

    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError){}
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float){
        secondesText.text = String(Int(playTime))
        timeSlider.value = playTime / Float(playerView.duration)
    }
    
    func playerViewPreferredWebViewBackgroundColor(_ playerView: YTPlayerView) -> UIColor {
        return UIColor.blue
    }
    
    //    func playerViewPreferredInitialLoadingView(_ playerView: YTPlayerView) -> UIView? {
    //        let loader = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
    //        loader.backgroundColor = UIColor.brown
    //        return loader
    //    }
}
