<script setup>
import { onMounted, ref } from 'vue';
import { useI18n } from 'vue-i18n';
import { useAppStore } from '../store/appStore';

const { t } = useI18n();
const appStore = useAppStore();

const currentImg = ref(1);
const lastImg = 6;

onMounted(() => {
	setInterval(() => {
		if (currentImg.value === lastImg) {
			return currentImg.value = 1;
		}
		currentImg.value += 1;
		return;
	}, 2800);
});
</script>

<template>
	<div class="homepage">
		<div class="homepage-positioner">
			<div class="homepage-header">
				<div class="homepage-header-title">
					<h1>{{ t('dashboard') }}</h1>
					<div :style="{ width: 'fit-content' }">
						<h2>{{ t('dashboard-tagline') }}</h2>
					</div>

					<div>
						<a :href="appStore.lang === 'en' ? 'https://www.youtube.com/watch?v=kJsIsQ_3uLc' : 'https://www.youtube.com/watch?v=07FODlTV74g'"
							target="_blank" rel="noreferrer"><button class="gray">{{ t('about-us')
							}}<span>play_circle</span></button></a>
						<a href="https://dashboard-ver2-test.web.app/" target="_blank" rel="noreferrer"><button>{{ t('demo')
						}}</button></a>
					</div>
				</div>
				<div class="homepage-header-image">
					<img :src="`/images/home/home${currentImg}.png`">
				</div>
			</div>
			<hr />
			<div class="homepage-nav">
				<div class="homepage-nav-card">
					<h3>{{ t('front-end.name') }}{{ t('docs') }}</h3>
					<p>{{ t('last-updated') }}: 23/07/12</p>
					<h4>{{ t('front-end.desc') }}</h4>
					<div>
						<a href="https://github.com/tpe-doit/Taipei-City-Dashboard-FE" target="_blank"
							rel="noreferrer"><button class="github">{{ t('github') }}<img
									src="../assets/images/github-mark.svg" /></button></a>
						<router-link to="/front-end"><button>{{ t('get-started') }}<span>east</span></button></router-link>
					</div>
				</div>
				<div class="homepage-nav-card">
					<h3>{{ t('back-end.name') }}{{ t('docs') }}</h3>
					<p>{{ t('coming-soon') }}</p>
					<h4>{{ t('back-end.desc') }}</h4>
					<div>
						<!-- <a><button class="github">{{ t('github') }}<img
									src="../assets/images/github-mark.svg" /></button></a> -->
					</div>
				</div>
			</div>
			<br />
			<br />
			<br />
			<br />
			<!-- <hr />
			<div class="homepage-footer">
				<div></div>
			</div> -->
		</div>
	</div>
</template>

<style scoped lang="scss">
.homepage {
	display: flex;
	justify-content: center;
	width: 100%;
	height: calc(100vh - 60px);
	max-height: calc(100vh - 60px);
	overflow-y: scroll;

	@media screen and (max-width: 850px) {
		height: calc(100% - 60px);
	}

	&-positioner {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 0 2rem;
		width: 100%;
		height: fit-content;

		@media screen and (min-width: 1200px) {
			width: 1200px
		}
	}

	hr {
		margin: 3rem 0;
		width: 100%;
		height: 0;
		border: none;
		border-top: 1px dashed var(--color-border);
	}

	&-header {
		display: grid;
		grid-template-columns: 3fr 400px;
		column-gap: 2rem;
		width: calc(100% - 3rem);
		margin-top: 3rem;
		padding-right: 3rem;

		@media screen and (max-width: 1000px) {
			grid-template-columns: 3fr 350px;
			margin-top: 1.5rem;
		}

		@media screen and (max-width: 900px) {
			width: 100%;
			grid-template-columns: 1fr;
			margin-top: 3rem;
			padding-right: 0;
		}

		&-title {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;


			h1 {
				font-size: 4rem;
				text-align: center;
				background: linear-gradient(75deg, var(--color-complement-text), var(--color-highlight) 70%, var(--color-complement-text), );
				background-clip: text;
				-webkit-background-clip: text;
				-webkit-text-fill-color: transparent;
				animation: title-gradient 10s linear none infinite;

				@media screen and (max-width: 550px) {
					font-size: 2.8rem;
				}
			}

			h2 {
				margin: 1rem auto 1.5rem;
				padding-right: 4px;
				border-right: .15em solid transparent;
				font-size: 1.8rem;
				font-weight: 400;
				text-align: center;
				color: #aeaeae;
				animation:
					typing 2.4s steps(40, end),
					blink-caret .8s step-end 8;
				overflow: hidden;
				white-space: nowrap;

				@media screen and (max-width: 550px) {
					font-size: 1.3rem;
					margin-top: 0.5rem;
				}
			}

			div {
				display: flex;
				justify-content: center;
			}
		}

		&-image {
			background-color: #282a2c;
			border-radius: 5px;

			@media screen and (max-width: 1000px) {
				margin: 3rem calc((100% - 350px) / 2) 0;
			}

			@media screen and (max-width: 550px) {
				margin: 3rem calc((100% - 300px) / 2) 0;
			}

			img {
				width: 400px;
				border-radius: 5px;

				@media screen and (max-width: 1000px) {
					width: 350px;
				}

				@media screen and (max-width: 550px) {
					width: 300px;
				}

				// animation-name: fadeout;
				// animation-duration: 2.8s;
				// animation-iteration-count: infinite;
			}
		}
	}


	&-nav {
		display: grid;
		grid-template-columns: 500px 500px;
		column-gap: 2rem;
		padding: 0 1rem;

		@media screen and (max-width: 1200px) {
			grid-template-columns: 450px 450px;
		}

		@media screen and (max-width: 1050px) {
			grid-template-columns: 400px 400px;
		}

		@media screen and (max-width: 900px) {
			grid-template-columns: 500px;
			row-gap: 2rem;
		}

		@media screen and (max-width: 550px) {
			grid-template-columns: 320px;
		}

		&-card {
			background-color: var(--color-component-background);
			border-radius: 5px;
			padding: var(--font-l);
			margin: 1rem 0;
			transition: box-shadow 0.2s;

			@media screen and (max-width: 900px) {
				margin: 0
			}

			&:hover {
				box-shadow: 0 0 5px var(--color-complement-text);
			}

			h3 {
				font-size: var(--font-xl);
			}

			p {
				font-size: 0.9rem;
				color: var(--color-complement-text)
			}

			h4 {
				margin: 1.5rem 0 2rem;
				font-size: var(--font-l);
				font-weight: 400;
			}



			div {
				display: flex;
				justify-content: flex-end;
			}


		}
	}

	span {
		margin-left: 4px;
		color: white;
		font-family: var(--font-icon);
	}

	button {
		display: flex;
		align-items: center;
		margin-left: 8px;
		padding: 6px;
		border-radius: 5px;
		background-color: var(--color-highlight);
		color: white;
		font-size: var(--font-m);
		transition: opacity 0.2s;

		&.gray {
			background-color: var(--color-complement-text);
		}

		&.github {
			border: 2px solid var(--color-normal-text);
			background-color: transparent;
			padding: 4px;
			color: var(--color-normal-text);

			img {
				margin-left: 4px;
				filter: var(--img-filter);
				height: var(--font-m);
			}
		}

		&:hover {
			opacity: 0.7;
		}
	}
}

@keyframes fadeout {
	0% {
		opacity: 0;
	}

	5% {
		opacity: 0;
	}

	15% {
		opacity: 1;
	}

	75% {
		opacity: 1;
	}

	85% {
		opacity: 0;
	}

	100% {
		opacity: 0;
	}
}

@keyframes title-gradient {
	0% {
		background-position: 0;
	}

	50% {
		background-position: 600px;
	}

	100% {
		background-position: 0;
	}
}

@keyframes typing {
	from {
		width: 0
	}

	to {
		width: 100%
	}
}

@keyframes blink-caret {

	from,
	to {
		border-color: transparent
	}

	50% {
		border-color: var(--color-highlight);
	}
}
</style>