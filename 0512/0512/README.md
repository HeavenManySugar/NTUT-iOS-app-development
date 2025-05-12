# 植物紀錄App

## 說明

本App是用於記錄植物生長狀況的應用程式，可以記錄植物的澆水、換盆以及成長歷程。

## 功能

*   **全部植物**: 顯示所有植物的清單或網格，可以切換顯示模式。
*   **植物詳細資訊**: 顯示單一植物的詳細資訊，包含名稱、種類、圖片。
*   **澆水紀錄**: 記錄植物的澆水日期和備註。
*   **換盆紀錄**: 記錄植物的換盆日期和備註。
*   **成長歷程**: 記錄植物的成長日期和備註。

## 操作方式

1.  **首頁**:
    *   開啟App後，會顯示全部植物的清單。
    *   點擊植物可以查看詳細資訊。
    *   可以使用分段控制來切換清單或網格顯示模式。
2.  **植物詳細資訊頁面**:
    *   顯示植物的名稱、種類和圖片。
    *   點擊「澆水紀錄」、「換盆紀錄」或「成長歷程」可以查看相關紀錄。
3.  **紀錄頁面**:
    *   顯示該植物的相關紀錄列表。
    *   如果沒有紀錄，會顯示「尚無紀錄」。

## 檔案結構說明

*   `0512/`: 主要的App程式碼目錄。
    *   `_512App.swift`: App的入口點。
    *   `ContentView.swift`: 主要的內容視圖，顯示 [`AllPlantsView`](0512/views/AllPlantsView.swift)。
    *   `Assets.xcassets/`: 存放圖片資源。
    *   `models/`: 存放資料模型。
        *   [`Planet.swift`](0512/models/Planet.swift): 定義植物的資料結構。
        *   [`SampleData.swift`](0512/models/SampleData.swift): 包含範例植物資料。
    *   `views/`: 存放視圖檔案。
        *   [`AllPlantsView.swift`](0512/views/AllPlantsView.swift): 顯示所有植物的視圖。
        *   [`PlantDetailView.swift`](0512/views/PlantDetailView.swift): 顯示植物詳細資訊的視圖。
        *   [`WateringRecordsView.swift`](0512/views/WateringRecordsView.swift): 顯示澆水紀錄的視圖。
        *   [`RepottingRecordsView.swift`](0512/views/RepottingRecordsView.swift): 顯示換盆紀錄的視圖。
        *   [`GrowthTimelineView.swift`](0512/views/GrowthTimelineView.swift): 顯示成長歷程的視圖。
*   `0512.xcodeproj/`: Xcode專案檔案。
*   `README.md`: 本文件。

## 環境需求

*   Xcode 13 或更高版本
*   iOS 15 或更高版本

## 作者

張睿恩