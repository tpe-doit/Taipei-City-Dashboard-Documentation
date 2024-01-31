export const components = [
	{
		id: 156,
		index: "maternity_hospitals",
		chart_config: {
			types: "PolarAreaChart",
			unit: "家",
			color: ["#FFADAD", "#E06666", "#C12525"],
			categories: [
				"北投區",
				"士林區",
				"內湖區",
				"南港區",
				"松山區",
				"信義區",
				"中山區",
				"大同區",
				"中正區",
				"萬華區",
				"大安區",
				"文山區",
			],
		},
		chart_data: [
			{
				name: "有婚後孕前健康檢查",
				data: [4, 6, 5, 2, 5, 4, 8, 1, 3, 5, 15, 4],
			},
			{
				name: "有初期孕婦唐氏症篩檢",
				data: [1, 5, 5, 2, 5, 1, 10, 1, 5, 3, 15, 4],
			},
			{
				name: "有中期孕婦唐氏症篩檢",
				data: [2, 6, 3, 2, 6, 3, 7, 1, 3, 3, 15, 4],
			},
		],
		name: "生育補助合約醫院",
		source: "衛生局",
	},
	{
		id: 34,
		index: "building_landuse",
		chart_config: {
			color: [
				"#7fff00",
				"#00ff00",
				"#ffff00",
				"#7fffff",
				"#00ff00",
				"#bf7fff",
				"#ff003f",
				"#e6e6e6",
				"#007fff",
				"#7fff00",
				"#7f3f00",
				"#b3b3b3",
				"#7fff00",
				"#00ff00",
				"#ff003f",
				"#007fff",
				"#ff8fad",
				"#ff3f00",
				"#00ff00",
				"#00ff00",
				"#00ff00",
				"#00ff00",
				"#00ff00",
			],
			types: "TreemapChart",
			unit: "km²",
		},
		chart_data: [
			{
				name: "",
				data: [
					{ x: "保護區", y: 68.95 },
					{ x: "其他", y: 54.98 },
					{ x: "住宅用地", y: 38.33 },
					{ x: "水域", y: 20.29 },
					{ x: "綠地", y: 12.99 },
					{ x: "文教用地", y: 11.64 },
					{ x: "商業用地", y: 9.29 },
					{ x: "交通用地", y: 7.97 },
					{ x: "機關用地", y: 5.98 },
					{ x: "農業區", y: 5.27 },
					{ x: "工業區", y: 4.01 },
					{ x: "設施", y: 2.07 },
					{ x: "風景區", y: 1.75 },
					{ x: "動物園用地", y: 1.64 },
					{ x: "專用區", y: 1.47 },
					{ x: "醫療用地", y: 0.67 },
					{ x: "娛樂區", y: 0.58 },
					{ x: "市場用地", y: 0.53 },
					{ x: "遊樂區", y: 0.52 },
					{ x: "體育場", y: 0.3 },
					{ x: "中正紀念堂", y: 0.25 },
					{ x: "保存區", y: 0.17 },
					{ x: "兒童遊樂場", y: 0.02 },
				],
			},
		],
		source: "都發局",
		name: "都市計畫用地類型",
	},
	{
		id: 82,
		index: "welfare_institutions",
		chart_config: {
			color: [
				"#F65658",
				"#F49F36",
				"#F5C860",
				"#9AC17C",
				"#4CB495",
				"#569C9A",
				"#60819C",
				"#2F8AB1",
			],
			types: "BarChart",
			unit: "間",
		},
		chart_data: [
			{
				name: "",
				data: [
					{ x: "身障機構", y: 191 },
					{ x: "銀髮族服務", y: 174 },
					{ x: "兒童與少年服務", y: 90 },
					{ x: "社區服務、NPO", y: 80 },
					{ x: "婦女服務", y: 21 },
					{ x: "貧困危機家庭服務", y: 17 },
					{ x: "保護性服務", y: 5 },
				],
			},
		],
		name: "社福機構",
		source: "社會局",
	},
	{
		id: 42,
		index: "building_age",
		chart_config: {
			color: ["#9c7a3e", "#b7e28e", "#7febd0", "#8ce8ff"],
			types: "ColumnChart",
			unit: "棟",
			categories: [
				"北投區",
				"士林區",
				"內湖區",
				"南港區",
				"松山區",
				"信義區",
				"中山區",
				"大同區",
				"中正區",
				"萬華區",
				"大安區",
				"文山區",
			],
		},
		chart_data: [
			{
				name: ">40年",
				data: [
					15742, 20453, 6060, 6410, 10855, 12653, 15154, 12984, 11563,
					17647, 20243, 12710,
				],
			},
			{
				name: "20-40年",
				data: [
					6312, 7805, 12366, 2857, 4194, 6702, 6043, 2500, 3174, 3731,
					7165, 8214,
				],
			},
			{
				name: "5-20年",
				data: [
					1963, 2335, 3357, 1351, 684, 1022, 1947, 1025, 1171, 716,
					1469, 2039,
				],
			},
			{
				name: "<5年",
				data: [48, 91, 71, 12, 6, 5, 49, 25, 33, 14, 38, 73],
			},
		],
		name: "全市屋齡分布",
		source: "都發局/消防局",
	},
	{
		id: 142,
		index: "youbike_weekend",
		chart_config: {
			types: "HeatmapChart",
			categories: [
				"北投區",
				"士林區",
				"內湖區",
				"南港區",
				"松山區",
				"信義區",
				"中山區",
				"大同區",
				"中正區",
				"萬華區",
				"大安區",
				"文山區",
			],
			color: [
				"#b9b929",
				"#87a11a",
				"#87a11a",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#568811",
				"#236e0c",
				"#236e0c",
				"#236e0c",
				"#236e0c",
				"#236e0c",
				"#236e0c",
				"#236e0c",
				"#666666",
			],
			unit: "千次",
		},
		chart_data: [
			{
				name: "北投區",
				data: [41, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			},
			{
				name: "士林區",
				data: [4, 63, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0],
			},
			{
				name: "內湖區",
				data: [0, 0, 40, 1, 1, 1, 3, 0, 0, 0, 0, 0],
			},
			{
				name: "南港區",
				data: [0, 0, 1, 30, 2, 5, 0, 0, 0, 0, 0, 0],
			},
			{
				name: "松山區",
				data: [0, 0, 1, 2, 48, 9, 9, 1, 1, 0, 7, 0],
			},
			{
				name: "信義區",
				data: [0, 0, 1, 5, 9, 88, 1, 0, 1, 0, 16, 0],
			},
			{
				name: "中山區",
				data: [0, 2, 3, 0, 9, 1, 83, 10, 6, 1, 6, 0],
			},
			{
				name: "大同區",
				data: [1, 2, 0, 0, 1, 0, 10, 36, 3, 4, 1, 0],
			},
			{
				name: "中正區",
				data: [0, 0, 0, 0, 1, 1, 6, 4, 51, 10, 21, 2],
			},
			{
				name: "萬華區",
				data: [0, 0, 0, 0, 0, 0, 1, 3, 10, 34, 1, 0],
			},
			{
				name: "大安區",
				data: [0, 0, 0, 0, 7, 17, 6, 1, 21, 2, 185, 4],
			},
			{
				name: "文山區",
				data: [0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 3, 29],
			},
		],
		name: "YouBike週末群像",
		source: "臺北大數據中心",
	},
	{
		id: 162,
		index: "permeable_paving",
		chart_config: {
			types: "DonutChart",
			unit: "m²",
			color: ["#80C69A", "#FFAD66", "#9EDBFF", "#FFCA9C", "#20E1FF"],
		},
		chart_data: [
			{
				name: "透水鋪面面積",
				data: [
					{
						x: "公園透水鋪面",
						y: 1708982.89,
					},
					{
						x: "學校透水鋪面",
						y: 581828.3,
					},
					{
						x: "PAC鋪面",
						y: 287656.08,
					},
					{
						x: "人行道透水鋪面",
						y: 158472.3,
					},
					{
						x: "停車場透水鋪面",
						y: 72610.9,
					},
				],
			},
		],
		name: "透水鋪面",
		source: "工務局",
	},
	{
		id: 107,
		index: "aed",
		chart_config: {
			types: "DistrictChart",
			color: ["#A25FAD"],
			unit: "台",
		},
		chart_data: [
			{
				name: "",
				data: [
					{ x: "北投區", y: 171 },
					{ x: "士林區", y: 180 },
					{ x: "內湖區", y: 178 },
					{ x: "南港區", y: 150 },
					{ x: "松山區", y: 203 },
					{ x: "信義區", y: 188 },
					{ x: "中山區", y: 267 },
					{ x: "大同區", y: 103 },
					{ x: "中正區", y: 245 },
					{ x: "萬華區", y: 117 },
					{ x: "大安區", y: 258 },
					{ x: "文山區", y: 219 },
				],
			},
		],
		name: "AED分布",
		source: "衛生局",
	},
];