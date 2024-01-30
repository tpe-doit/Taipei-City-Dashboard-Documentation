## 關於臺北城市儀表板

臺北城市儀表板是由臺北大數據中心（TUIC）開發的資料視覺化平台。

我們的主要目標是建立一個全方位的資料視覺化工具，協助台北市政府的治理決策，而 2021 年時，運行儀表板第一版也成功地實現了這項任務。

自從 2021 年推出以來，臺北城市儀表板在協助台北市政府官員做出明智政策決策方面發揮了重要作用。在 TUIC 網站上的[這篇文章](https://tuic.gov.taipei/zh/works/dashboard)中，您可以了解有關臺北城市儀表板的構思和演進的更多資訊。

## 為什麼要選擇臺北城市儀表板

相較其他類似的資料視覺化平台，臺北城市儀表板以其全面而簡約直觀的設計脫穎而出。它的建立旨在鼓勵跨時間和空間的交叉參照，將資料集組織成視覺化的模組組件，並透過視覺化帶來更多不同以往的發現與洞見。

臺北城市儀表板顯示的大部分數據來自台北的開放資料平台[data.taipei](https://data.taipei/)。我們更為儀表板上的每個資料集提供數據解釋指南和建議的使用案例，讓任何用戶能充分探索台北開放資料的種種可能性。

臺北城市儀表板是第一個開源的城市儀表板。我們不僅公開儀表板的程式碼，也邀請使用者一起加入開發的行列。

無論您想為改善台北的開放資料生態系統做出貢獻，還是創建自己的資料視覺化工具，臺北城市儀表板都是一個很好的起點和基礎。

## 讓我們的儀表板，成為您的儀表板

2023 年中期，隨著台北市的開放資料生態系統逐漸成熟，我們的願景也逐漸擴大。我們現階段的目標不僅是協助政策決策，還希望幫助市民了解他們城市的重要統計數據。我們亦希望公開儀表板的程式碼，以便任何相關組織可以輕鬆創建自己的資料視覺化工具。

讓我們的儀表板，成為您的儀表板。

### 臺北城市儀表板 2.0

根據上述願景，我們決定開始開發臺北城市儀表板 2.0。與其前身不同，臺北城市儀表板 2.0 將成為一個公共平台，而不是只是一個內部工具。臺北城市儀表板 2.0 的程式碼將會是開源的，歡迎所有有興趣的各方參與這個平台的開發。

我們已經完成了臺北城市儀表板 2.0 的初步介面和基本功能開發，因此我們認為現在已經適合對外公開後續的開發流程。從現在開始，您將能夠對臺北城市儀表板 2.0 提出功能和修改建議，並與我們一同開發這個平台。十分期待您加入臺北城市儀表板的旅程！

## 本文件的內容概覽

本文件涵蓋了臺北城市儀表板 2.0 的前端部分，並詳細介紹本專案的各個主要面向。

> **i01**
> 臺北城市儀表板 2.0 的前端部分在本文件中將統一稱為「本專案」。

> **w01**
> 由於其靜態和開源的性質，本專案只包括儀表板用戶界面，不提供管理界面。
>
> 儘管如此，我們已經採取措施確保將本專案能輕易的被轉換為動態應用程式。如果想要了解更多，請參閱[這裡](/front-end/create-a-dynamic-application)。

如果您有興趣以任何方式使用本專案的程式庫，建議您務必詳閱前四章以瞭解更多資訊。第五章中的第一篇文章則針對不同的需求提供進一步建議。

如果您在本文件中遇到任何問題或錯字，歡迎點擊每篇文章底部的「於 Github 編輯此文章」按鈕並提出修改建議。您也可以透過電子郵件直接聯繫我們。

## 授權和版權

本專案的程式碼是以[AGPL-3 許可證](https://github.com/tpe-doit/Taipei-City-Dashboard-FE/blob/main/LICENSE)下發行，允許任何形式的修改和商業化。但是，如果您使用我們的程式庫，請務必歸屬我們，且您對程式庫進行任何改動後，也必須將您修改的版本公開釋出，供本產品的其他使用者參考。

## 專案貢獻者

_contributors_
[![TUIC](/images/contributors/tuic.png)**臺北大數據中心**](https://tuic.gov.taipei)
[![何紹宇](/images/contributors/何紹宇.png)**何紹宇**](https://github.com/igorho2000)
[![陳威竹](/images/contributors/陳威竹.png)**陳威竹**](https://github.com/Chu-c-git)
[![黃軒柏](/images/contributors/黃軒柏.png)**黃軒柏**](https://github.com/godspeedhuang)
[![游璿達](/images/contributors/游璿達.png)**游璿達**](https://github.com/iimahao)
[![黃敬皓](/images/contributors/黃敬皓.png)**黃敬皓**](https://github.com/JHH11)
[![施柔安](/images/contributors/施柔安.png)**施柔安**](https://github.com/ann125697)
[![李思橙](/images/contributors/李思橙.png)**李思橙**](https://github.com/annieleeeee)
[![吳亞融](/images/contributors/吳亞融.png)**吳亞融**](https://github.com/Lauren8799)
[![許富盈](/images/contributors/許富盈.png)**許富盈**](https://github.com/fuyingxx0)
[![張庭梧](/images/contributors/張庭梧.png)**張庭梧**](https://github.com/tingwoo)
[![梁璿安](/images/contributors/梁璿安.png)**梁璿安**](https://github.com/NTUBOY)
[![陳又華](/images/contributors/陳又華.png)**陳又華**](https://github.com/chenjoachim)
[![台灣大哥大](/images/contributors/台灣大哥大.png)**台灣大哥大**](https://www.taiwanmobile.com/)
[![楊明倫](/images/contributors/楊明倫.png)**楊明倫**](https://github.com/KevinYang2229)
[![顏佑軒](/images/contributors/顏佑軒.png)**顏佑軒**](https://github.com/chrisyen8341)
[![徐慶怡](/images/contributors/徐慶怡.png)**徐慶怡**](https://github.com/pandaachuitwm)
[![林昭宏](/images/contributors/林昭宏.png)**林昭宏**](https://github.com/Toma-L)
[![蔡宜秀](/images/contributors/蔡宜秀.png)**蔡宜秀**](https://github.com/EllenTsaitw)
[![李冠儀](/images/contributors/李冠儀.png)**李冠儀**](https://github.com/gary920209)
[![陳柏睿](/images/contributors/陳柏睿.png)**陳柏睿**](https://github.com/rakechen-0307)
[![吳典睿](/images/contributors/吳典睿.png)**吳典睿**](https://github.com/dienruei123)
[![劉庭均](/images/contributors/劉庭均.png)**劉庭均**](https://github.com/Davidliu012)
[![吳承羲](/images/contributors/吳承羲.png)**吳承羲**](https://github.com/chengxi061)
[![黃梓睿](/images/contributors/黃梓睿.png)**黃梓睿**](https://github.com/11044123)
[![廖偉翔](/images/contributors/廖偉翔.png)**廖偉翔**](https://github.com/XinRed)
[![陳俊嘉](/images/contributors/陳俊嘉.png)**陳俊嘉**](https://github.com/11044123/Taipei-City-Dashboard-FE)
[![沈鈺芳](/images/contributors/沈鈺芳.png)**沈鈺芳**](https://github.com/11044123/Taipei-City-Dashboard-FE)
[![黃愉翔](/images/contributors/黃愉翔.png)**黃愉翔**](https://github.com/huangyyuuu)
[![林育緹](/images/contributors/林育緹.png)**林育緹**](https://github.com/oohyuti)
[![王佑豪](/images/contributors/王佑豪.png)**王佑豪**](https://github.com/vnaticzhock)
[![謝芝嫻](/images/contributors/謝芝嫻.png)**謝芝嫻**](https://github.com/pigbearhsien)
[![賴彥良](/images/contributors/賴彥良.png)**賴彥良**](https://github.com/yenlianglai)
[![蔡立倫](/images/contributors/蔡立倫.png)**蔡立倫**](https://github.com/tsailawrence)
[![林柔安](/images/contributors/林柔安.png)**林柔安**](https://github.com/anne030303)
[![陳宇修](/images/contributors/陳宇修.png)**陳宇修**](https://github.com/Kenny-Snub-Nose-Monk)
[![黃亘立](/images/contributors/黃亘立.png)**黃亘立**](https://github.com/j450nhuang)
[![卓易霆](/images/contributors/卓易霆.png)**卓易霆**](https://github.com/artgistim)

## 聯絡我們

TUIC 官方電子郵件（tuic@gov.taipei）

TUIC 前端工程師 Igor Ho（ey2816@gov.taipei）
