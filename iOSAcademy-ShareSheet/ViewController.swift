//
//  ViewController.swift
//  iOSAcademy-ShareSheet
//
//  Created by RainBowT on 2024/7/17.
//

import UIKit

class ViewController: UIViewController {
    
    // 創建一個 UIButton，並設置其屬性
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link // 設置按鈕的背景顏色
        button.setTitle("Tap ME", for: .normal) // 設置按鈕標題
        button.setTitleColor(.white, for: .normal) // 設置按鈕標題顏色
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置按鈕的框架和位置，並將其添加到視圖中
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // 當按鈕被點擊時，調用此方法來顯示分享表單
    @objc private func presentShareSheet(_ sender: UIButton) {
        // 確保 image 和 url 都被正確創建
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else {
            return
        }
        
        // 創建一個 UIActivityViewController，並設置要分享的內容
        let shareSheetVC = UIActivityViewController(
            activityItems: [image, url],
            applicationActivities: nil)
        
        // 為 iPad 設置彈出視圖的來源視圖和位置
        shareSheetVC.popoverPresentationController?.sourceView = sender
        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
        
        // 顯示分享表單
        present(shareSheetVC, animated: true)
    }
}

