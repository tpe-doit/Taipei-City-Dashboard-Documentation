<script setup>
import { computed, onMounted, ref } from 'vue';
import axios from 'axios';
import { marked } from 'marked';
import hljs from 'highlight.js';
import { useAppStore } from '../store/appStore';

const props = defineProps(['docs', 'id']);
const appStore = useAppStore();

const doctext = ref('');

const parsedDoctext = computed(() => {
	const renderer = {
		blockquote(quote) {
			const no = quote[12] === '0' ? quote[13] : quote[12] + quote[13];

			if (quote[11] === "i") {
				quote = quote.slice(23);
				return `<blockquote class="info">
                    <h4>${appStore.lang === "en" ? "Information" : "資訊"} - ${no}</h4>
                    <p>${quote}
                    </blockquote>`;
			}
			else if (quote[11] === "w") {
				quote = quote.slice(23);
				return `<blockquote class="warning">
                    <h4>${appStore.lang === "en" ? "Warning" : "警告"} - ${no}</h4>
                    <p>${quote}
                    </blockquote>`;
			}
			else if (quote[11] === "t") {
				quote = quote.slice(23);
				return `<blockquote class="tip">
                    <h4>${appStore.lang === "en" ? "Tip" : "小撇步"} - ${no}</h4>
                    <p>${quote}
                    </blockquote>`;
			}
		},
		code(code, infostring) {
			const toBeCopied = code.replaceAll(`"`, `&quot;`);
			return `<pre><button class="${appStore.lang === 'en' ? '' : 'copy-ch'}" onclick="navigator.clipboard.writeText(\`${toBeCopied}\`)">content_paste</button><code class="language-${infostring}">${code}</code></pre>`;
		},
		heading(text, level) {
			if (level >= 4) {
				return `<h${level}>${text}</h${level}>`;
			}
			const headingId = text.toLowerCase().replaceAll(' ', '-');
			return `<h${level} id="${headingId}">${text} <a href="#${headingId}" class="hide-if-mobile">#</a></h${level}>`;
		},
		link(href, title, text) {
			if (href.includes('http')) {
				return `<a href="${href}" target='_blank'>${text}</a>`;
			}
			return `<a href="${href}">${text}</a>`;
		},
		paragraph(text) {
			const parsedText = text.replaceAll('<em><strong>', '<span>').replaceAll('</strong></em>', '</span>');
			return `<p>${parsedText}</p>`;
		}
	};
	marked.use({ renderer, mangle: false, headerIds: false });
	// eslint-disable-next-line no-misleading-character-class
	return marked.parse(doctext.value.replace(/^[\u200B\u200C\u200D\u200E\u200F\uFEFF]/, ""));
});

onMounted(() => {
	axios.get(`/articles/${props.docs}-${appStore.lang}/${props.id}.md`).then(rs => {
		doctext.value = rs.data;
		setTimeout(() => {
			hljs.highlightAll();
		}, 50);
	}).catch((err) => {
		axios.get(`/articles/${props.docs}-en/${props.id}.md`).then(rs => {
			doctext.value = rs.data;
			setTimeout(() => {
				hljs.highlightAll();
			}, 50);
		});
	});
})

</script>

<template>
	<div v-html="parsedDoctext" class="docpagecontent">
	</div>
</template>

<style lang="scss">
.docpagecontent {
	display: flex;
	flex-direction: column;

	h2 {
		margin-top: 0.5rem;
		margin-bottom: 1.5rem;
		padding-top: 1.5rem;
		border-top: dashed 1px var(--color-border);
		font-size: var(--font-xl);
		text-align: justify;
	}

	h3 {
		font-size: var(--font-l);
		margin-bottom: 1.5rem;
		text-align: justify;
		font-weight: 400;
	}

	h2,
	h3 {
		a {
			opacity: 0;
			transition: opacity 0.2s;
		}

		&:hover a {
			opacity: 1;

			&:hover {
				opacity: 0.7;
			}
		}
	}

	p {
		font-size: var(--font-m);
		margin-bottom: 1.5rem;
		text-align: justify;

		span {
			font-family: var(--font-icon);
			vertical-align: text-top;
		}
	}

	a {
		color: var(--color-highlight);
		transition: opacity 0.2s;

		&:hover {
			opacity: 0.7;
		}
	}

	img {
		width: 90%;
		margin-left: 5%;
		border-radius: 5px;

		@media screen and (max-width: 850px) {
			width: 100%;
			margin-left: 0;
		}
	}

	code {
		font-family: var(--font-code);
		background-color: var(--color-component-background);
		padding: 2px 4px;
		border-radius: 5px;
		color: var(--color-normal-text)
	}

	pre {
		position: relative;
		margin-bottom: 1.5rem;
		border-radius: 0.5rem;

		button {
			position: absolute;
			display: flex;
			align-items: center;
			right: 0.5rem;
			top: 0.5rem;
			font-family: var(--font-icon);
			font-size: var(--font-l);
			color: var(--color-complement-text);
			transition: color 0.2s, font-size 0.2s;

			&::before {
				font-family: "微軟正黑體", "Microsoft JhengHei", "Droid Sans", "Open Sans", "Helvetica";
				content: "Copied!";
				font-size: var(--font-s);
				margin: 4px 4px 0;
				opacity: 0;
				transition: opacity 0.2s;
				color: var(--color-normal-text);
			}

			&.copy-ch::before {
				content: "已複製！";
			}

			&:hover {
				color: var(--color-normal-text)
			}

			&:focus {
				font-size: 0;
				color: transparent;

				&::before {
					opacity: 1;
				}
			}
		}

		code,
		code span {
			font-family: var(--font-code) !important;
			background-color: var(--color-component-background) !important;
		}
	}

	blockquote {
		background-color: var(--color-border);
		margin-bottom: 1.5rem;
		padding: 1rem;
		border-radius: 0.5rem;

		&.info {
			border-left: 4px solid var(--color-highlight);

			h4:before {
				content: "info_outline";
				font-family: var(--font-icon);
				margin-right: 6px;
				color: var(--color-highlight)
			}
		}

		&.warning {
			border-left: 4px solid rgb(227, 42, 42);

			h4:before {
				content: "warning_amber";
				font-family: var(--font-icon);
				margin-right: 6px;
				color: rgb(227, 42, 42)
			}
		}

		&.tip {
			border-left: 4px solid rgb(29, 187, 29);

			h4:before {
				content: "lightbulb_outline";
				font-family: var(--font-icon);
				margin-right: 6px;
				color: rgb(29, 187, 29)
			}
		}

		h4 {
			display: flex;
			align-items: flex-start;
			margin-bottom: 0.5rem;
		}

		p {
			margin-bottom: 0;
			margin-top: 1rem;
		}
	}
}
</style>