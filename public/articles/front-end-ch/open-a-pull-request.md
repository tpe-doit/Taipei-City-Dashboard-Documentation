## Commits
對於本專案，沒有硬性規定commit message應該如何撰寫，請遵循一般常理(best practice)即可。然而，我們有要求所有的commit必須被簽名驗證(signed and verified)。簽名過的commits 在 GitHub 上會有一個小的已驗證(verified)圖示顯示在commit message旁邊。如果您對如何簽名commit不熟悉，請參考 GitHub 的 [這個指南](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)。

## 在開啟pull request之前
在開啟pull request之前，請確保以下事項屬實：

***looks_one*** 已跑過程式檢查器（`npm run lint`）並已解決所有問題

***looks_two*** 程式已經過充分測試，並且沒有在開發途中引入錯誤

***looks_3*** pull request將完全解決該issue(s)

***looks_4*** pull request僅解決該issue(s)，沒有進行其他修改

>**t01**
>上述準則的英文版本：
>
>***looks_one*** The code linter has been run (`npm run lint`) and issues have all been resolved
>
>***looks_two*** The code has been thoroughly tested and no visible bugs have been introduced
>
>***looks_3*** The pull request will completely resolve the issue(s) mentioned
>
>***looks_4*** The pull request only resolves the issue(s) mentioned and nothing more

## 提交和後續審查
當您準備好時，請建立一個pull request並填寫pull request模板。如果您希望被歸屬於這個專案，也請記得在模板中填寫一些個人資料。

我們已設置多個 GitHub actions 來自動檢查您的pull request。如果有任何檢查未通過，請解決。當所有檢查都通過後，我們團隊的成員將審查您的程式。

如果pull request嚴重違反了本協作指南中的任何準則，則可能會立即被拒絕。

如果只有輕微問題，我們將在pull request的評論中留言需要修改的項目。請定期檢查您的pull request並完成任何所需的修改。當所有問題都得到解決後，pull request將合併到官方repository中。
