import { defineStore } from "pinia";

export const useAppStore = defineStore("app", {
  state: () => ({
    mode: localStorage.getItem("mode") || "dark",
    lang: localStorage.getItem("lang") || "en",
    docs: null,
  }),
  getters: {},
  actions: {
    toggleMode() {
      this.mode = this.mode === "dark" ? "light" : "dark";
      localStorage.setItem("mode", this.mode);
    },
    toggleLang(lang) {
      this.lang = lang;
      document.title =
        this.lang === "en"
          ? "Docs | Taipei City Dashboard"
          : "文件｜城市聯合儀表板";
    },
  },
});
