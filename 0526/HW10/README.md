# Gemini AI 聊天助手

![Gemini AI 助手](/Users/zhangruien/Documents/code/NTUT-iOS-app-development/0526/HW10/HW10/Assets.xcassets/AppIcon.appiconset/Icon-60@2x.png)

## 專案簡介

Gemini AI 聊天助手是一款基於 Google 的 Gemini AI 技術開發的 iOS 應用程式，讓使用者可以輕鬆地與 AI 模型進行對話。透過簡潔美觀的介面，使用者能夠輸入問題或請求，並快速獲得 AI 產生的回應。

## 功能特點

- 🔮 **智慧對話**: 運用 Google Gemini AI 強大的自然語言處理能力回答問題
- 💬 **即時回應**: 快速生成回答並即時呈現
- 🎨 **美觀介面**: 精心設計的 UI 配色與動畫效果
- 🌐 **API 集成**: 使用 Swift 的 `URLSession` 與 `async/await` 進行 API 串接
- 💾 **JSON 處理**: 運用 `JSONEncoder` 與 `JSONDecoder` 進行資料序列化

## 技術規格

- **開發語言**: Swift 5.9+
- **UI 框架**: SwiftUI
- **最低系統要求**: iOS 15.0+
- **API**: Google Gemini AI API
- **非同步處理**: async/await 語法
- **資料序列化**: JSONEncoder/JSONDecoder

## 安裝使用

### 前置需求

- macOS 運行 Xcode 15.0 或更高版本
- 有效的 Google Gemini AI API 金鑰

### 設定步驟

1. Clone 或下載專案到本地電腦
2. 在 Xcode 中打開 `HW10.xcodeproj`
3. 在 `ContentView.swift` 中將 `apiKey` 變數替換為你的 Gemini API 金鑰:
   ```swift
   private let apiKey = "YOUR_API_KEY" // 替換為你的 API 金鑰
   ```
4. 使用 Xcode 的模擬器或實體裝置運行應用程式

## 使用示例

1. 啟動應用程式
2. 在文字輸入區域輸入你想問 AI 的問題
3. 點擊「生成回答」按鈕
4. 等待回應出現在下方區域

## 介面預覽

應用程式使用優雅的漸層色彩方案，包含紫色、粉紅色和淺白色，創造出視覺上吸引人的使用體驗。

## 專案結構

```
HW10/
├── HW10/
│   ├── HW10App.swift        # 應用程式入口點
│   ├── ContentView.swift    # 主視圖與 API 邏輯
│   └── Assets.xcassets      # 圖片資源
├── HW10.xcodeproj           # Xcode 專案檔案
└── README.md                # 專案說明文件
```

## API 參考

本專案使用 Google Gemini AI API 的 `generateContent` 端點:

```
https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent
```

## 開發者

- 張睿恩

## 授權資訊

本專案為北科大 iOS App 開發課程作業，僅供教學使用。Gemini AI 是 Google 的商標。

---

*製作於 2025 年 5 月*