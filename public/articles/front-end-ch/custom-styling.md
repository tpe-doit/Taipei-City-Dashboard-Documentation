## 範圍
除了由第三方套件（圖表和地圖）渲染的元素之外，本專案都使用純 `css` 或 `scss` 進行樣式設計(Styling)。因爲未使用UI庫，使得本專案能輕易被客製化。本專案全域樣式和局部樣式均有使用。

如果您對圖表（Apexcharts）和地圖（Mapbox）的樣式感興趣，請參考[客製化圖表](/front-end/custom-charts)和[客製化地圖](/front-end/custom-charts)文章。

>**w01**
>對於協作者，請注意，在修改本專案時，有一些全域和局部樣式是不允許修改的。此外，我們也制定了設計指南，如果您希望對本專案貢獻新元素，則應遵循這些指南。請務必在下一章中閱讀我們的[設計指南](/front-end/design-guide)。

## 全域樣式
全域樣式包括`HTML`元素的基本樣式和在Vue組件間共享的樣式。所有全域樣式均以`css`編寫，位於資料夾`/src/assets/styles`中。

### 樣式變數
本專案大量使用樣式變數來確保顏色、字體和各種間距的統一性。下面是所有樣式變數的完整列表，您可以在檔案`globalStyles.css`中進行修改。

```css
:root {
  --color-background: #090909; /* 主背景顏色 */
  --color-border: #494b4e; /* 所有邊框的顏色 */
  --color-highlight: #5a9cf8; /* 重要元素的顏色（藍色） */
  --color-normal-text: white;
  --color-complement-text: #888787; /* 不太重要文字的顏色 */
  --color-component-background: #282a2c; /* 大多數UI元素的背景顏色 */
  --color-overlay: rgba(0, 0, 0, 0.65); /* 對話框的遮罩 */
  --font-to-icon: 1.2;
  --font-xl: 1.5rem;
  --font-l: 1.25rem;
  --font-m: 1rem;
  --font-s: 0.75rem;
  --font-icon: "material-icons";
}
```

>**i01**
>本專案中的所有圖示都使用一個特殊的圖示字體（Material Icons）來渲染，該字體由[Google Fonts](https://fonts.google.com/icons?icon.style=Rounded&icon.set=Material+Icons)提供。本專案選擇了「圓角(Rounded)」的圖示風格。字體設定檔可以在文件夾`/src/assets/fonts`中找到。

## 局部樣式
局部樣式的效果限縮於所屬的Vue元件，並均以`scss`編寫，位於所有Vue元件的底部。在本專案中，每個Vue元件的root class與其文件名相同，但不含空格且全部小寫。
