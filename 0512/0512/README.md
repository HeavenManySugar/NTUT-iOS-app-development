# 植物管理 App (0512)

這是一個 SwiftUI iOS 應用程式，用於追蹤和管理植物的相關資訊。

## 功能

*   **多種檢視模式**：提供清單、網格和卡片三種模式來瀏覽所有植物 ([`AllPlantsView.swift`](0512/views/AllPlantsView.swift))。
*   **植物詳細資訊**：顯示植物的名稱、物種和圖片 ([`PlantDetailView.swift`](0512/views/PlantDetailView.swift))。
*   **紀錄追蹤**：
    *   澆水紀錄 ([`WateringRecordsView.swift`](0512/views/WateringRecordsView.swift))
    *   換盆紀錄 ([`RepottingRecordsView.swift`](0512/views/RepottingRecordsView.swift))
    *   成長歷程 ([`GrowthTimelineView.swift`](0512/views/GrowthTimelineView.swift))
*   **範例資料**：應用程式啟動時會載入預設的植物範例資料 ([`SampleData.swift`](0512/models/SampleData.swift))。

## 資料模型

主要的資料結構定義在 [`Planet.swift`](0512/models/Planet.swift) 中：

*   `Plant`: 代表一株植物，包含名稱、物種、圖片名稱陣列，以及各種紀錄。
*   `WateringRecord`: 代表一次澆水紀錄。
*   `RepottingRecord`: 代表一次換盆紀錄。
*   `GrowthRecord`: 代表一次成長紀錄。

## 如何執行

1.  **開啟專案**：
    *   使用 Xcode 開啟 `0512.xcodeproj` 檔案。
2.  **選擇模擬器或裝置**：
    *   在 Xcode 頂端的工具列中，選擇一個 iOS 模擬器或連接的實體裝置。
3.  **執行應用程式**：
    *   點擊 Xcode 工具列中的 "Play" 按鈕 (或按下 Command+R) 來建置並執行應用程式。

應用程式將會在所選的模擬器或裝置上啟動，並顯示 [`AllPlantsView`](0512/views/AllPlantsView.swift) 作為初始畫面。