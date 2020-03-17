console.log('  ============== ')
console.log('  Скрипт "Стандартный бот" запущен.')
console.log('  ============== ')

console.log('-------------------------------')
console.log('')

// ВСЕ НАСТРОЙКИ В ФАЙЛЕ /database/settings.! 

const { VK } = require('vk-io');
const vk = new VK();
const commands = [];
const request = require('prequest');
var wall_to_send = '';

const cars = [
	{
		name: 'Самокат',
		cost: 500,
		id: 1
	},
	{
		name: 'Велосипед',
		cost: 2500,
		id: 2
	},
	{
		name: 'Гироскутер',
		cost: 5000,
		id: 3
	},
	{
		name: 'Сигвей',
		cost: 7500,
		id: 4
	},
	{
		name: 'Мопед',
		cost: 25000,
		id: 5
	},
	{
		name: 'Мотоцикл',
		cost: 50000,
		id: 6
	},
	{
		name: 'ВАЗ 2109',
		cost: 75000,
		id: 7
	},
	{
		name: 'Квадроцикл',
		cost: 80000,
		id: 8
	},
	{
		name: 'Багги',
		cost: 135000,
		id: 9
	},
	{
		name: 'Вездеход',
		cost: 200000,
		id: 10
	},
	{
		name: 'Лада Xray',
		cost: 350000,
		id: 11
	},
	{
		name: 'Audi Q7',
		cost: 750000,
		id: 12
	},
	{
		name: 'BMW X6',
		cost: 1000000,
		id: 13
	},
	{
		name: 'Toyota FT-HS',
		cost: 1750000,
		id: 14
	},
	{
		name: 'BMW Z4 M',
		cost: 2500000,
		id: 15
	},
	{
		name: 'Subaru WRX STI',
		cost: 2750000,
		id: 16
	},
	{
		name: 'Lamborghini Veneno',
		cost: 3000000,
		id: 17
	},
	{
		name: 'Tesla Roadster',
		cost: 4500000,
		id: 18
	},
	{
		name: 'Yamaha YZF R6',
		cost: 5000000,
		id: 19
	},
	{
		name: 'Bugatti Chiron',
		cost: 6500000,
		id: 20
	},
	{
		name: 'Thrust SSC',
		cost: 35000000,
		id: 21
	},
	{
		name: 'Ferrari LaFerrari',
		cost: 39000000,
		id: 22
	},
	{
		name: 'Koenigsegg Regear',
		cost: 50000000,
		id: 23
	},
	{
		name: 'Tesla Semi',
		cost: 75000000,
		id: 24
	},
	{
		name: 'Venom GT',
		cost: 125000000,
		id: 25
	},
	{
		name: 'Rolls-Royce',
		cost: 200000000,
		id: 26
	}
];

const yachts = [
	{
		name: 'Ванна',
		cost: 10000,
		id: 1
	},
	{
		name: 'Nauticat 331',
		cost: 10000000,
		id: 2
	},
	{
		name: 'Nordhavn 56 MS',
		cost: 15000000,
		id: 3
	},
	{
		name: 'Princess 60',
		cost: 25000000,
		id: 4
	},
	{
		name: 'Azimut 70',
		cost: 35000000,
		id: 5
	},
	{
		name: 'Dominator 40M',
		cost: 50000000,
		id: 6
	},
	{
		name: 'Moonen 124',
		cost: 60000000,
		id: 7
	},
	{
		name: 'Wider 150',
		cost: 65000000,
		id: 8
	},
	{
		name: 'Palmer Johnson 42M SuperSport',
		cost: 80000000,
		id: 9
	},
	{
		name: 'Wider 165',
		cost: 85000000,
		id: 10
	},
	{
		name: 'Eclipse',
		cost: 150000000,
		id: 11
	},
	{
		name: 'Dubai',
		cost: 300000000,
		id: 12
	},
	{
		name: 'Streets of Monaco',
		cost: 750000000,
		id: 13
	}
];

const stranas = [ 

	{ 
	name: 'Не указана', 
	cost: 0, 
	id: 1 
	}, 
	{ 
	name: '🇺🇸США', 
	cost: 0, 
	id: 2 
	}, 
	
	{ 
	name: '🇷🇺Россия', 
	cost: 0, 
	id: 3 
	}, 
	
	{ 
	name: '🇰🇷Япония', 
	cost: 0, 
	id: 4 
	}, 
	
	{ 
	name: '🇺🇦Украина', 
	cost: 0, 
	id: 5 
	}, 
	{ 
	name: '🇰🇿Казахстан', 
	cost: 0, 
	id: 6 
	}, 
	{ 
	name: '🇧🇾Белоруссия', 
	cost: 0, 
	id: 7 
	}, 
	{ 
	name: '🇪🇸 Испания', 
	cost: 0, 
	id: 7 
	}, 
	{ 
	name: '🇫🇷 Франция', 
	cost: 0, 
	id: 7 
	} 
	];

const airplanes = [
	{
		name: 'Параплан',
		cost: 100000,
		id: 1
	},
	{
		name: 'АН-2',
		cost: 350000,
		id: 2
	},
	{
		name: 'Cessna-172E',
		cost: 700000,
		id: 3
	},
	{
		name: 'Supermarine Spitfire',
		cost: 1000000,
		id: 4
	},
	{
		name: 'BRM NG-5',
		cost: 1400000,
		id: 5
	},
	{
		name: 'Cessna T210',
		cost: 2600000,
		id: 6
	},
	{
		name: 'Beechcraft 1900D',
		cost: 5500000,
		id: 7
	},
	{
		name: 'Cessna 550',
		cost: 8000000,
		id: 8
	},
	{
		name: 'Hawker 4000',
		cost: 22400000,
		id: 9
	},
	{
		name: 'Learjet 31',
		cost: 45000000,
		id: 10
	},
	{
		name: 'Airbus A318',
		cost: 85000000,
		id: 11
	},
	{
		name: 'F-35A',
		cost: 160000000,
		id: 12
	},
	{
		name: 'Boeing 747-430 Custom',
		cost: 225000000,
		id: 13
	},
	{
		name: 'C-17A Globemaster III',
		cost: 350000000,
		id: 14
	},
	{
		name: 'F-22 Raptor',
		cost: 400000000,
		id: 15
	},
	{
		name: 'Airbus 380 Custom',
		cost: 600000000,
		id: 16
	},
	{
		name: 'B-2 Spirit Stealth Bomber',
		cost: 1359000000,
		id: 17
	}
];

const helicopters = [
	{
		name: 'Шарик с пропеллером',
		cost: 2,
		id: 1
	},
	{
		name: 'RotorWay Exec 162F',
		cost: 300000,
		id: 2
	},
	{
		name: 'Robinson R44',
		cost: 450000,
		id: 3
	},
	{
		name: 'Hiller UH-12C',
		cost: 1300000,
		id: 4
	},
	{
		name: 'AW119 Koala',
		cost: 2500000,
		id: 5
	},
	{
		name: 'MBB BK 117',
		cost: 4000000,
		id: 6
	},
	{
		name: 'Eurocopter EC130',
		cost: 7500000,
		id: 7
	},
	{
		name: 'Leonardo AW109 Power',
		cost: 10000000,
		id: 8
	},
	{
		name: 'Sikorsky S-76',
		cost: 15000000,
		id: 9
	},
	{
		name: 'Bell 429WLG',
		cost: 19000000,
		id: 10
	},
	{
		name: 'NHI NH90',
		cost: 35000000,
		id: 11
	},
	{
		name: 'Kazan Mi-35M',
		cost: 60000000,
		id: 12
	},
	{
		name: 'Bell V-22 Osprey',
		cost: 135000000,
		id: 13
	}
];

const homes = [
	{
		name: 'Коробка из-под холодильника',
		cost: 250,
		id: 1
	},
	{
		name: 'Подвал',
		cost: 3000,
		id: 2
	},
	{
		name: 'Палатка',
		cost: 3500,
		id: 3
	},
	{
		name: 'Домик на дереве',
		cost: 5000,
		id: 4
	},
	{
		name: 'Полуразрушенный дом',
		cost: 10000,
		id: 5
	},
	{
		name: 'Дом в лесу',
		cost: 25000,
		id: 6
	},
	{
		name: 'Деревянный дом',
		cost: 37500,
		id: 7
	},
	{
		name: 'Дача',
		cost: 125000,
		id: 8
	},
	{
		name: 'Кирпичный дом',
		cost: 80000,
		id: 9
	},
	{
		name: 'Коттедж',
		cost: 450000,
		id: 10
	},
	{
		name: 'Особняк',
		cost: 1250000,
		id: 11
	},
	{
		name: 'Дом на Рублёвке',
		cost: 5000000,
		id: 12
	},
	{
		name: 'Личный небоскрёб',
		cost: 7000000,
		id: 13
	},
	{
		name: 'Остров с особняком',
		cost: 12500000,
		id: 14
	},
	{
		name: 'Белый дом',
		cost: 20000000,
		id: 15
	}
];

const apartments = [
	{
		name: 'Чердак',
		cost: 15000,
		id: 1
	},
	{
		name: 'Квартира в общежитии',
		cost: 55000,
		id: 2
	},
	{
		name: 'Однокомнатная квартира',
		cost: 175000,
		id: 3
	},
	{
		name: 'Двухкомнатная квартира',
		cost: 260000,
		id: 4
	},
	{
		name: 'Четырехкомнатная квартира',
		cost: 500000,
		id: 5
	},
	{
		name: 'Квартира в центре Москвы',
		cost: 1600000,
		id: 6
	},
	{
		name: 'Двухуровневая квартира',
		cost: 4000000,
		id: 7
	},
	{
		name: 'Квартира с Евроремонтом',
		cost: 6000000,
		id: 8
	}
];

const phones = [
	{
		name: 'Nokia 108',
		cost: 250,
		id: 1
	},
	{
		name: 'Nokia 3310 (2017)',
		cost: 500,
		id: 2
	},
	{
		name: 'ASUS ZenFone 4',
		cost: 2000,
		id: 3
	},
	{
		name: 'BQ Aquaris X',
		cost: 10000,
		id: 4
	},
	{
		name: 'Sony Xperia XA',
		cost: 15000,
		id: 5
	},
	{
		name: 'Samsung Galaxy S8',
		cost: 30000,
		id: 6
	},
	{
		name: 'Xiaomi Mi Mix',
		cost: 50000,
		id: 7
	},
	{
		name: 'Torex FS1',
		cost: 75000,
		id: 8
	},
	{
		name: 'iPhone X',
		cost: 100000,
		id: 9
	},
	{
		name: 'Мегафон С1',
		cost: 250000,
		id: 10
	}
];

const farms = [
	{
		name: '6U Nvidia',
		cost: 20500000,
		id: 1
	},
	{
		name: 'AntminerS9',
		cost: 100000000,
		id: 2
	},
	{
		name: 'FM2018-BT200',
		cost: 900000000,
		id: 3
	},
	{
		name: 'Genesis Mining',
		cost: 9000000000,
		id: 4
	},
	{
		name: 'GigaWatt',
		cost: 800000000000,
		id: 5
	}
];

const businesses = [
	{
		name: 'Рекламное агенство',
		cost: 50000,
		earn: 400,
		id: 1,
		icon: '🥖'
	},
	{
		name: 'Сервер Mincraft',
		cost: 10000,
		earn: 700,
		id: 2,
		icon: '🏪'
	},
	{
		name: 'Сервер Minecraft PE',
		cost: 300000,
		earn: 2500,
		id: 3,
		icon: '🍷'
	},
	{
		name: 'Магазин(Магнит)',
		cost: 500000,
		earn: 3800,
		id: 4,
		icon: '🏫'
	},
	{
		name: 'Магазин(Ярмарка)',
		cost: 1500000,
		earn: 8000,
		id: 5,
		icon: '🏭'
	},
	{
		name: 'Шахта',
		cost: 25000000,
		earn: 70000,
		id: 6,
		icon: '⛏'
	},
	{
		name: 'Офис',
		cost: 80000000,
		earn: 220000,
		id: 7,
		icon: '🏢'
	},
	{
		name: 'GAME',
		cost: 150000000,
		earn: 300000,
		id: 8,
		icon: '🕹'
	},
	{
		name: 'Нефтевышка',
		cost: 500000000,
		earn: 700000,
		id: 9,
		icon: '🏜'
	},
	{
		name: 'Атомная электростанция',
		cost: 800000000,
		earn: 1000000,
		id: 10,
		icon: '💡'
	},
	{
		name: 'Авиокомпания',
		cost: 10000000000,
		earn: 2500000,
		id: 11,
		icon: '🍔'
	},
	{
		name: 'Межпланетный экспресс',
		cost: 250000000000,
		earn: 35000000,
		id: 12,
		icon: '🗺'
	},
	{
		name: 'Макдональдс',
		cost: 420000000000000,
		earn: 500000000,
		id: 13,
		icon: '🍔'
	}
];

	const odejda = [
		{
			name: 'Шмотки с Avito',
			cost: 3,
			id: 1
		},
		{
			name: 'Шмотки с AliExpress',
			cost: 1000,
			id: 2
		},
		{
			name: 'Demix',
			cost: 10000,
			id: 3
		},
		{
			name: 'Puma',
			cost: 300000,
			id: 4
		},
		{
			name: 'Reebok',
			cost: 300000,
			id: 5
		},
		{
			name: 'Nike',
			cost: 500000,
			id: 6
		},
		{
			name: 'Adidas',
			cost: 1000000,
			id: 7
		},
		{
			name: 'Armani',
			cost: 100000000,
			id: 8
		},
		{
			name: 'Маска Леси',
			cost: 250000000,
			id: 9
		},
		{
			name: 'Versace',
			cost: 500000000,
			id: 10
		},
		{
			name: 'Burberry',
			cost: 1000000000,
			id: 11
		},
		{
			name: 'Ralph Lauren',
			cost: 10000000000,
			id: 12
		},
		{
			name: 'Coco Chanel',
			cost: 15000000000,
			id: 13
		},
		{
			name: 'Prada',
			cost: 30000000000,
			id: 14
		},
		{
			name: 'Hermes',
			cost: 100000000000,
			id: 15
		},
		{
			name: 'Gucci',
			cost: 5000000000000,
			id: 16
		},
		{
			name: 'Маска ЛЬва',
			cost: 100000000000000,
			id: 17
		}
	];

const pets = [
	{
		name: 'Улитка',
		cost: 1000,
		id: 1
	},
	{
		name: 'Заяц',
		cost: 500000,
		id: 2
	},
	{
		name: 'Лиса',
		cost: 1250000000,
		id: 3
	},
	{
		name: 'Собака',
		cost: 5000000000,
		id: 4
	},
	{
		name: 'Пони',
		cost: 30000000000,
		id: 5
	},
		{
		name: 'Пантера',
		cost: 5000000000,
		id: 6
	},
	{
		name: 'Дракон',
		cost: 250000000000,
		id: 7
	}
];

const works = [
	{
		name: 'Дворник',
		requiredLevel: 1,
		min: 2000,
		max: 2500,
		id: 1
	},
	{
		name: 'Сантехник',
		requiredLevel: 3,
		min: 3750,
		max: 4000,
		id: 2
	},
	{
		name: 'Электрик',
		requiredLevel: 5,
		min: 4000,
		max: 4500,
		id: 3
	},
	{
		name: 'Слесарь',
		requiredLevel: 8,
		min: 5000,
		max: 5500,
		id: 4
	},
	{
		name: 'Юрист',
		requiredLevel: 10,
		min: 7500,
		max: 8000,
		id: 5
	},
	{
		name: 'Бухгалтер',
		requiredLevel: 14,
		min: 9000,
		max: 9489,
		id: 6
	},
	{
		name: 'Бармен',
		requiredLevel: 22,
		min: 10000,
		max: 12500,
		id: 7
	},
	{
		name: 'Администратор',
		requiredLevel: 25,
		min: 12500,
		max: 13500,
		id: 8
	},
	{
		name: 'Программист',
		requiredLevel: 49,
		min: 16000,
		max: 17500,
		id: 9
	}
];

const utils = {
	sp: (int) => {
		int = int.toString();
		return int.split('').reverse().join('').match(/[0-9]{1,3}/g).join('.').split('').reverse().join('');
	},
	rn: (int, fixed) => {
		if (int === null) return null;
		if (int === 0) return '0';
		fixed = (!fixed || fixed < 0) ? 0 : fixed;
		let b = (int).toPrecision(2).split('e'),
			k = b.length === 1 ? 0 : Math.floor(Math.min(b[1].slice(1), 14) / 3),
			c = k < 1 ? int.toFixed(0 + fixed) : (int / Math.pow(10, k * 3) ).toFixed(1 + fixed),
			d = c < 0 ? c : Math.abs(c),
			e = d + ['', 'тыс', 'млн', 'млрд', 'трлн'][k];

			e = e.replace(/e/g, '');
			e = e.replace(/\+/g, '');
			e = e.replace(/Infinity/g, 'ДОХЕРА');

		return e;
	},
	gi: (int) => {
		int = int.toString();

		let text = ``;
		for (let i = 0; i < int.length; i++)
		{
			text += `${int[i]}&#8419;`;
		}

		return text;
	},
	decl: (n, titles) => { return titles[(n % 10 === 1 && n % 100 !== 11) ? 0 : n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 10 || n % 100 >= 20) ? 1 : 2] },
	random: (x, y) => {
		return y ? Math.round(Math.random() * (y - x)) + x : Math.round(Math.random() * x);
	},
	pick: (array) => {
		return array[utils.random(array.length - 1)];
	},
	time: () => {
		return parseInt(new Date().getTime()/1000)
	}
}

const rotateText = {
	q: 'q',
	w: 'ʍ',
	e: 'ǝ',
	r: 'ɹ',
	t: 'ʇ',
	y: 'ʎ',
	u: 'u',
	i: 'ᴉ',
	o: 'o',
	p: 'p',
	a: 'ɐ',
	s: 's',
	d: 'd',
	f: 'ɟ',
	g: 'ƃ',
	h: 'ɥ',
	j: 'ɾ',
	k: 'ʞ',
	l: 'l',
	z: 'z',
	x: 'x',
	c: 'ɔ',
	v: 'ʌ',
	b: 'b',
	n: 'n',
	m: 'ɯ',

	й: 'ņ',
	ц: 'ǹ',
	у: 'ʎ',
	к: 'ʞ',
	е: 'ǝ',
	н: 'н',
	г: 'ɹ',
	ш: 'm',
	щ: 'm',
	з: 'ε',
	х: 'х',
	ъ: 'q',
	ф: 'ф',
	ы: 'ıq',
	в: 'ʚ',
	а: 'ɐ',
	п: 'u',
	р: 'd',
	о: 'о',
	л: 'v',
	д: 'ɓ',
	ж: 'ж',
	э: 'є',
	я: 'ʁ',
	ч: 'һ',
	с: 'ɔ',
	м: 'w',
	и: 'и',
	т: 'ɯ',
	ь: 'q',
	б: 'ƍ',
	ю: 'oı'
}

let btc = 6000;

let users = require('./database/users.json');
let config = require('./database/settings.json');
let buttons = [];

setTimeout(async () => {
	const rq = await request('https://api.cryptonator.com/api/ticker/btc-usd');

	if(!rq.ticker) return;
	if(!rq.ticker.price) return;

	btc = Math.floor(Number(rq.ticker.price));
}, 5);

setInterval(async () => {
	const rq = await request('https://api.cryptonator.com/api/ticker/btc-usd');

	if(!rq.ticker) return;
	if(!rq.ticker.price) return;

	btc = Math.floor(Number(rq.ticker.price));
}, 60000);

setInterval(async () => {
	await saveUsers();
	console.log('saved');
}, 30000);

setInterval(async () => {
	users.filter(x=> x.misc.farm !== 0).map(x=> {
		if(x.misc.farm === 1)
		{
			x.farm_btc += 2;
		}

		if(x.misc.farm === 2)
		{
			x.farm_btc += 10;
		}

		if(x.misc.farm === 3)
		{
			x.farm_btc += 100;
		}
		if(x.misc.farm === 4)
		{
			x.farm_btc += 3000;
		}
		if(x.misc.farm === 5)
		{
			x.farm_btc += 25000;
		}
	});
}, 3600000);

setInterval(async () => {
	users.map(user => {
		if(user.business)
		{
			const biz = businesses.find(x=> x.id === user.business);
			if(!biz) return;

			user.biz += biz.earn;
		}
	});
}, 3600000);

function clearTemp()
{
	users.map(user => {
		user.timers.hasWorked = false;
		user.timers.bonus = false;
	});
}

clearTemp();

async function saveUsers()
{
	require('fs').writeFileSync('./database/users.json', JSON.stringify(users, null, '\t'));
	return true;
}

vk.setOptions({ token: config.grouptoken, pollingGroupId: config.groupid });
const { updates, snippets } = vk;

updates.startPolling();
updates.on('message', async (message) => {
	if(Number(message.senderId) <= 0) return;
	if(/\[club169479151\|(.*)\]/i.test(message.text)) message.text = message.text.replace(/\[club169479151\|(.*)\]/ig, '').trim();

	if(!users.find(x=> x.id === message.senderId))
	{
		const [user_info] = await vk.api.users.get({ user_id: message.senderId });
		const date = new Date();

		users.push({
			id: message.senderId,
			uid: users.length,
			balance: 5000,
			bank: 0,
			btc: 0,
			farm_btc: 0,
			bkbays: 0,
			warn: 0,
			kplati: 0,
			odejda: 0,
			strana: 0,
			pasport: false,
			pasprabota: `информация отсутствует`,
			givet: `информация отсутствует`,
			nick: `информация отсутствует`,
			dr: `информация отсутствует`,
			msg: 0,
			biz: 0,
			rating: 0,
			regDate: `${date.getDate()}.${date.getMonth()}.${date.getFullYear()}`,
			mention: true,
			ban: false,
			timers: {
				hasWorked: false,
				bonus: false
			},
			tag: user_info.first_name,
			work: 0,
			business: [],
			notifications: true,
			exp: 1,
			level: 1,
			referal: null,
			roulette: -1,
			roulette_bet: 0,
			transport: {
				car: 0,
				yacht: 0,
				airplane: 0,
				helicopter: 0
			},
			realty: {
				home: 0,
				apartment: 0
			},
			settings: {
				adm: 0,
			},
			pet: {
				lvl: 0,
				poterl: false
				},
			misc: {
				phone: 0,
				farm: 0,
				farm_count: 0
			},
			marriage: {
				partner: 0,
				requests: []
			}
		});
		console.log(` +1 игрок [Игроков: ${users.length}]`);
		console.log(``);
		saveUsers();
	}

	message.user = users.find(x=> x.id === message.senderId);

	const bot = (text, params) => {
		return message.send(`${message.user.mention ? `@id${message.user.id} (${message.user.tag})` : `${message.user.tag}`}, ${text}`, params);
	}

	if(message.user.ban) return bot(`ваш аккаунт заблокирован ⛔`);

	const command = commands.find(x=> x[0].test(message.text));
	if(!command) return;

	if(message.user.settings.firstmsg)
	{

		message.send(` Привет @id${message.user.id}(${message.user.tag})! Рад познакомится, если ты новенький(ая) напиши команду «Обучение», а если ты уже знаешь как играть/развиваться, так - сказать - професионал, напиши команду «Помощь». 📚 \n❓ | Твой игровой номер: №${message.user.uid}`);

		message.user.settings.firstmsg = false;


		saveUsers();
		return;

	}

	if(!command)

	{
		message.user.msg += 1;
		message.user.list_ban += 1;
		message.user.pechenka += 1;

if(message.user.pets.exp >= 24)
{
message.user.pets.exp = 1;
message.user.pets.level += 1;
	message.user.msg += 1;
}

	}

	message.args =  message.text.match(command[0]);
	await command[1](message, bot);

saveUsers(); 
message.user.msg += 1 
console.log(` Введена команда: ${message.text}.`) 
console.log(``)
});

 const cmd = {
                    hear: (p, f) => {
                        commands.push([p, f]);
                    }
                }

				cmd.hear(/^(?:помощь|команды|меню|help|commands|@wild_bot1 📚 Помощь|cmds|menu|начать|start)$/i, async (message, bot) => {
					await bot(`, мои команды:
					❓ Помощь [команда] - описание команды
					
					🎉Развлекательные:
					📺 Гиф [фраза]
					↪ Переверни [фраза]
					🔮 Шар [фраза]
					📊 Инфа [фраза]
					⚖ Выбери [фраза] или [фраза2]
					🚀 Игры:
					⠀⠀🔫 Рулетка - русская рулетка
					⠀⠀🎲 Кубик [1-6]
					⠀⠀🎰 Казино [сумма]
					⠀⠀📈 Трейд [вверх/вниз] [сумма]
					⠀⠀🥛 Стаканчик [1-3] [сумма]
					👔 Работа - список работ
					⠀🔨 Работать
					⠀❌ Уволиться
					💼 Бизнес:
					⠀⠀📈 Бизнес - статистика
					⠀⠀👷 Бизнес нанять [1-2] [кол-во]
					⠀⠀💵 Бизнес снять [1-2] [кол-во] - снять деньги со счёта
					⠀⠀✅ Бизнес улучшить [номер]
					
					🔥 Полезное:
					📠 Реши [пример]
					📊 Курс
					
					💡 Разное:
					📦 Кейсы
					🐌 Питомцы
					📔 Паспорт
					🇦🇲 Страны
					📒 Профиль
					💲 Баланс
					💰 Банк [сумма/снять сумма]
					👑 Рейтинг - ваш рейтинг
					✒ Ник [ник/вкл/выкл]
					🛍 Магазин
					💸 Продать [предмет]
					🔋 Ферма - биткоин ферма
					✉ Смс [id] [сообщение].
					　 ✉ Бсмс [id беседы] [сообщение].
					🤝 Передать [id] [сумма]
					🏆 Топ
					💎 Бонус - ежедневный бонус
					💞 Брак [id] - сделать предложение
					⠀ ⠀Браки - список предложений
					💔 Развод
					⌚ Дата [id] - дата регистрации Вк
					
					🆘 Репорт [фраза] - ошибки или пожелания`, {
					keyboard:JSON.stringify(
					{
					"inline": true,
					"buttons": [
					[{
					"action": {
					"type": "text",
					"payload": "{}",
					"label": "🔑 Бонус"
					},
					"color": "primary"
					},
					{
					"action": {
					"type": "text",
					"payload": "{}",
					"label": "🛍 Донат"
					},
					"color": "negative"
					}]
					]
					})
					})
				});
				
				cmd.hear(/^(?:донат|🛍 Донат)$/i, async (message, bot) => {
					return bot(`хотите купить донат?
				
					Права администратора:
					1) Выдать [айди] [сумма] - выдать деньги.
					2) Removerub [айди] - забрать все деньги у игрока.
					3) Выдатьopit - выдать опыт.
					4) Removeopit - забрать весь опыт.
					5) Выдатьrating - выдать рейтинг.
					6) Removerating - забрать весь рейтинг.
					7) Выдатьэнергию - выдать энергию.
					8) Забратьэнэргию - забрать энергию.
					9) ban - блокировка аккаунта.
					10) unban - разблокировка аккаунта.
					11) warn - предупреждение
					12) unwarn - снимает предупреждение
					
					• За донатом писать сюда: https://vk.com/id316269723
					`);
				});
				
				cmd.hear(/^(?:настройки|настройки бота)$/i, async (message, bot) => {
					if(message.user.settings.adm < 3) return;
					return bot(`⚙ Привет, если ты создатель бота «Стандартный». Это статься для тебя.
				
					🔻 Как выдавать администратора/привилегию и т.п.?
					🛑 Для выдачи администратора, напишите боту «Adm [ИД] [1-3]». Чтобы снять с пользователя все права администратора, ведите «Снять админа [ИД].
					• Уровни админа:
					1lvl - Супер Игрок.
					2lvl - Админ.
					3lvl - Создатель.
					
					🔻 Если все таки, реально баг или стоит не ваша ссылка, напишите кодеру.`);
				});
				
				
				
				
				cmd.hear(/^(?:wiki|вики)\s(.*)$/i, async (message, bot) => {
					let args = message.text.match(/^(?:wiki|вики)\s?(.*)/i);
					function isEmpty( str ) { if (str.trim() == '') return true; return false; }
						rq("https://ru.wikipedia.org/w/api.php?action=opensearch&search="+encodeURIComponent((args[1] ? args[1] : "ВКонтакте"))+"&meta=siteinfo&rvprop=content&format=json")
						.then((res) => {
							if(isEmpty(res[2][0])) {
								if(isEmpty(res[2][1])) {
									if(isEmpty(res[2][2])) return message.reply('Статья не полная, либо отсутствует.\n\nСсылка: ' + res[3][0]);
								} else {
									return message.reply(`Я нашёл то, что Вы попросили найти! \n\nСсылка: ${res[3][1]}`);
								}
							} else {
								return message.reply(`Я нашёл то, что Вы попросили найти!\n\nСсылка: ${res[3][0]}`);
							}
						});
				});
				
				cmd.hear(/^(?:помощь)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].toLowerCase();
				
					if(message.args[1] === 'переверни')
					{
						return message.send(`Команда "Переверни" пишет ваш текст вверх ногами (Поддерживаются цифры, буквы латинского и кириллического алфавита, а также некоторые символы)`);
					}
				
					if(message.args[1] === 'шар')
					{
						return message.send(`Команда "Шар" используя магию рандома выводит случайное сообщение.`);
					}
				
					if(message.args[1] === 'инфа')
					{
						return message.send(`Команда "Инфа" случайным образом присылает шанс чего-либо. Также можно использовать команды "Шанс" или "Вероятность"`);
					}
				
					if(message.args[1] === 'выбери')
					{
						return message.send(`Команда "Выбери" случайным образом выбирает один из двух предложенных вариантов.`);
					}
				
					if(message.args[1] === 'казино')
					{
						return message.send(`Команда "Казино" случайным образом умножает вашу ставку (Могут выпасть множители х0, х0.25, х0.5, x0.75, х1, х2, х5, х50). Чтобы поставить всю сумму введите "Казино все" или "Казино вабанк"`);
					}
				
					if(message.args[1] === 'кубик')
					{
						return message.send(`Команда "Кубик" сравнивает ваше число со случайным от 1 до 6, если вы угадали, то получаете вознаграждение. Также можно использовать "Куб"`);
					}
				
					if(message.args[1] === 'трейд')
					{
						return message.send(`Команда "Трейд" - симулятор бинарных опционов. Введите "Трейд вверх (сумма)" если думаете, что курс валюты будет увеличиваться, или "Трейд вниз (сумма)" если будет уменьшаться.`);
					}
				
					if(message.args[1] === 'стаканчик')
					{
						return message.send(`С помощью команды "Стаканчик" вы можете сыграть в аналог игры "Напёрстки". Чтобы играть введите "Стаканчик [1-3] [сумма]".`);
					}
				
					if(message.args[1] === 'работа')
					{
						return message.send(`С помощью команды "Работа" вы можете устроиться на одну из работ. Чтобы отрыть новые профессии, вам нужно отработать определённое кол-во игровых недель (Команда "Работать"). Для увольнения с работы введите "Уволиться".`);
					}
				
					if(message.args[1] === 'бизнес')
					{
						return message.send(`Владея бизнесом, вы можете зарабатывать немало денег:
						Бизнесы [номер] - купить бизнес
						Бизнес - ваш бизнес
						Бизнес снять - снять деньги со счёта бизнеса
						Продать бизнес - продажа бизнеса`);
					}
				
					if(message.args[1] === 'реши')
					{
						return message.send(`Команда "Реши" решает ваш пример (Реши 5 + 5).
						Команда умеет:
						Складывать (+)
						Вычитать (-)
						Умножать (*)
						Делить (/)`);
					}
				
					if(message.args[1] === 'курс')
					{
						return message.send(`С помощью команды "Курс" можно узнать курс Биткоина на данный момент.`);
					}
				
					if(message.args[1] === 'профиль')
					{
						return message.send(`Команда "Профиль" выводит вашу игровую статистику.`);
					}
				
					if(message.args[1] === 'баланс')
					{
						return message.send(`Команда "Баланс" выводит кол-во валюты на вашем аккаунте.`);
					}
				
					if(message.args[1] === 'банк')
					{
						return message.send(`При вводе команды "Банк" (без параметров) выводится ваша сумма на счёте. Для того чтобы положить на счёт деньги введите "Банк [сумма]" (Максимум 250.000.000.000$). Чтобы забрать деньги из банка введите "Банк снять/взять [сумма]".
						Сумма в банке увеличивается каждый час (больше сумма - больше прибыль).`);
					}
				
					if(message.args[1] === 'рейтинг')
					{
						return message.send(`Пустая команда "Рейтинг" (без параметров) выводит ваше кол-во рейтинга (также можно узнать в профиле). При указании параметра (любое число) вы купите данное кол-во единиц рейтинга (👑1 = 250.000.000$). Рейтинг влияет на ваше положение в топе.`);
					}
				
					if(message.args[1] === 'ник')
					{
						return message.send(`С помощью команды "Ник" можно выбрать себе ник длинною до 15 символов. Также, ник можно делать кликабельным/некликабельным в топе "Ник вкл" и "Ник выкл"`);
					}
				
					if(message.args[1] === 'магазин')
					{
						return message.send(`Команда "Магазин" выводит список категорий товаров, которые доступны для покупки.`);
					}
				
					if(message.args[1] === 'продать')
					{
						return message.send(`С помощью команды "Продать" вы можете продать любой предмет (Машину, дом, квартиру, телефон, яхту, самолет, вертолет, биткоин, ферму).`);
					}
				
					if(message.args[1] === 'передать')
					{
						return message.send(`Команда "Передать" переводит указанную вами сумму любому игроку (Передать ${message.user.uid} 1000).`);
					}
				
					if(message.args[1] === 'топ')
					{
						return message.send(`Команда "Топ" выводит 10 игроков с самым большим рейтингом.`);
					}
				
					if(message.args[1].includes('брак'))
					{
						return message.send(`Используя команды "Брак", "Браки", "развод", вы можете жениться/выходить замуж/разводиться.
						Брак [id] - сделать предложение
						Браки - список предложений
						Развод - ...`);
					}
				
					if(message.args[1] === 'дата')
					{
						return message.send(`Команда "Дата" выводит дату регистрации человека в боте. Можно использовать id человека.`);
					}
				
					if(message.args[1] === 'репорт')
					{
						return message.send(`С помощью команды "Репорт" вы можете отправить создателю бота любое сообщение. Также можно использовать "Реп", "Жалоба", "Rep".`);
					}
				});
				
				cmd.hear(/^(?:переверни)\s([^]+)$/i, async (message, bot) => {
					let text = ``;
					message.args[1].split('').map(x=> {
						if(rotateText[x])
						{
							text += rotateText[x];
						}
					});
				
					return bot(`держи : "${text.split('').reverse().join('')}"`)
				});
				
				cmd.hear(/^(?:шар)\s([^]+)$/i, async (message, bot) => {
					const phrase = utils.pick(['перспективы не очень хорошие', 'сейчас нельзя предсказать', 'пока не ясно', 'знаки говорят - "Да"', 'знаки говорят - "Нет"', 'можешь быть уверен в этом', 'мой ответ - "нет"', 'мой ответ - "да"', 'бесспорно', 'мне кажется - "Да"', 'мне кажется - "Нет"']);
					return bot(phrase);
				});
				
				cmd.hear(/^(?:setwall)\s(.*)$/i, async (message, bot) => {
					if(message.user.settings.adm < 3) return;
				
					message.args[1] = message.args[1].replace("wall", "");
					message.args[1] = message.args[1].split('_');
					wall_to_send = "wall" + message.args[1][0] + "_" + message.args[1][1];
					return bot(`обновлён пост для рассылки`);
				});
				
				cmd.hear(/^(?:textsend)\s([^]+)/i, async (message, bot) => {
				if(message.user.settings.adm < 3) return;
				
					await bot(`рассылка завершена`);
					users.map(user => {
						vk.api.messages.send({ user_id: user.id, message: message.args[1], attachment: wall_to_send }).then(() => {
							console.log(`SENDED ${user.id}`)
						}).catch((err) => {
							console.log(`NOOOOT ${user.id}`)
						});
					});
				
					for(var i = 1; i < 900; i++) {
						vk.api.messages.send({ peer_id: 2000000000 + i, message: message.args[1], attachment: wall_to_send }).then(() => {
							console.log(`CHAT SENDED ${user.id}`)
						}).catch((err) => {
							console.log(`CHAT NOOOOT ${user.id}`)
						});
					}
					/*message.args[1] = message.args[1].replace("wall", "");
					message.args[1] = message.args[1].split('_');
					wall_to_send = "wall" + message.args[1][0] + "_" + message.args[1][1];
					return bot(`обновлён пост для рассылки`);*/
				});
				
				cmd.hear(/^(?:инфа|шанс|вероятность)\s([^]+)$/i, async (message, bot) => {
					const phrase = utils.pick(['шанс этого', 'мне кажется около']);
					const percent = utils.random(100);
				
					return bot(`${phrase} ${percent}%`)
				});
				
				cmd.hear(/^(?:выбери)\s([^]+)\s(?:или)\s([^]+)$/i, async (message, bot) => {
					const first = message.args[1];
					const second = message.args[2];
				
					const phrase = utils.pick([`конечно ${utils.random(1, 2)} вариант`, `мне кажется, что ${utils.random(1, 2)} вариант лучше`]);
					return bot(`${phrase}`);
				});
				
				cmd.hear(/^(?:профиль|прф)$/i, async (message, bot) => {
					let text = ``;
				
					text += `🔥 Привилегия: [${message.user.settings.adm.toString().replace(/0/gi, "Игрок ✔").replace(/1/gi, "Супер Игрок").replace(/2/gi, "Админ 🔥").replace(/3/gi, "Создатель")}]\n`;
					text += `🔎 ID: ${message.user.uid}\n`;
					text += `💰 Денег: ${utils.sp(message.user.balance)}$\n`;
					if(message.user.bank) text += `💳 В банке: ${utils.sp(message.user.bank)}$\n`;
					if(message.user.btc) text += `🌐 Биткоинов: ${utils.sp(message.user.btc)}\n`;
					text += `👑 Рейтинг: ${utils.sp(message.user.rating)}\n`;
					if(message.user.work) text += `👔 Работа: ${works[message.user.work - 1].name}\n`;
					if(message.user.transport.strana) text += `♦ Страна: [${stranas[message.user.transport.strana - 1].name}]\n`;
					if(message.user.marriage.partner) text += `👬 Партнер: ${users[message.user.marriage.partner].tag}`;
					text += `📛 Варнов: [${utils.sp(message.user.warn)}/5]\n\n`;
				
					if(message.user.transport.car || message.user.transport.yacht || message.user.transport.airplane || message.user.transport.helicopter ||
						message.user.realty.home || message.user.realty.apartment ||
						message.user.misc.phone || message.user.misc.farm || message.user.business)
					{
						text += `\n🔑 Имущество:\n`;
				
						if(message.user.transport.car) text += `⠀🚗 Машина: ${cars[message.user.transport.car - 1].name}\n`;
						if(message.user.transport.yacht) text += `⠀🛥 Яхта: ${yachts[message.user.transport.yacht - 1].name}\n`;
						if(message.user.transport.airplane) text += `⠀🛩 Самолёт: ${airplanes[message.user.transport.airplane - 1].name}\n`;
						if(message.user.transport.helicopter) text += `⠀🚁 Вертолёт: ${helicopters[message.user.transport.helicopter - 1].name}\n`;
				
						if(message.user.realty.home) text += `⠀🏠 Дом: ${homes[message.user.realty.home - 1].name}\n`;
						if(message.user.odejda) text += ` 👘 Одежда: ${odejda[message.user.odejda - 1].name}\n`;
						if(message.user.realty.apartment) text += `⠀🌇 Квартира: ${apartments[message.user.realty.apartment - 1].name}\n`;
						if(message.user.business) text += `💼 Бизнес:⠀[${businesses[message.user.business - 1].icon} ${businesses[message.user.business - 1].name}]\n`;

						if(message.user.misc.phone) text += `⠀📱 Телефон: ${phones[message.user.misc.phone - 1].name}\n`;
						if(message.user.misc.farm) text += `⠀🔋 Ферма: ${farms[message.user.misc.farm - 1].name} (${message.user.misc.farm_count} шт.)\n`;					}
					

					text += `\n📗 Дата регистрации: ${message.user.regDate}`;
					return bot(`твой профиль:\n${text}`);
				});
				
				cmd.hear(/^(?:баланс)$/i, async (message, bot) => {
					let text = `на руках: ${utils.sp(message.user.balance)}$`;
				
					if(message.user.bank) text += `\n💳 В банке: ${utils.sp(message.user.bank)}$`;
					if(message.user.btc) text += `\n🌐 Биткоинов: ${utils.sp(message.user.btc)}฿`;
				
					return bot(text);
				});
				
				cmd.hear(/^(?:банк)$/i, async (message, bot) => {
					return bot(`на вашем банковском счёте находится ${utils.sp(message.user.bank)}$`);
				});
				
				cmd.hear(/^(?:банк)\s(?:снять)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
					message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
					message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
					message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё)/ig, message.user.bank);
				
					if(!Number(message.args[1])) return;
					message.args[1] = Math.floor(Number(message.args[1]));
				
					if(message.args[1] <= 0) return;
				
					if(message.args[1] > message.user.bank) return bot(`у вас нет данной суммы`);
					else if(message.args[1] <= message.user.bank)
					{
						message.user.balance += message.args[1];
						message.user.bank -= message.args[1];
				
						return bot(`вы сняли ${utils.sp(message.args[1])}$
				💳 Остаток на счёте: ${utils.sp(message.user.bank)}$
				💰 Ваш баланс: ${utils.sp(message.user.balance)}$`);
					}
				});
				
				cmd.hear(/^(?:банк)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
					message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
					message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
					message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
				
					if(!Number(message.args[1])) return;
					message.args[1] = Math.floor(Number(message.args[1]));
				
					if(message.args[1] <= 0) return;
					if(message.args[1] <= 49) return bot(`минимальная сумма вклада 50$`);
					if(message.user.bank + message.args[1] > 250000000000) return bot(`на счету в банке не может лежать одновременно больше 250.000.000.000$`);
				
					if(message.args[1] > message.user.balance) return bot(`у вас нет данной суммы`);
					else if(message.args[1] <= message.user.balance)
					{
						message.user.balance -= message.args[1];
						message.user.bank += message.args[1];
				
						return bot(`вы положили на свой банковский счёт ${utils.sp(message.args[1])}$`);
					}
				});
				
				cmd.hear(/^(?:уведомления)\s(выкл|вкл)$/i, async (message, bot) => {
					if(message.args[1].toLowerCase() === 'выкл')
					{
						message.user.notifications = false;
						return bot(`уведомления отключены! 🔕`);
					}
				
					if(message.args[1].toLowerCase() === 'вкл')
					{
						return bot(`уведомления включены! 🔔`);
					}
				});
				
				cmd.hear(/^(?:ban)\s([0-9]+)$/i, async (message, bot) => {
					message.user.foolder += 1;
					if(message.user.settings.adm < 3) return bot(`доступно с привилегии - Админ`);
					if(users[message.user.uid].settings.adm < users[message.args[1]].settings.adm) return message.send(`⚠ ➾Нельзя заблокировать этого игрока!`);
						{
									let user = users.find(x=> x.uid === Number(message.args[1]));
						if(!user) return bot(`неверный ID игрока`);
						if(user.uid === message.user.uid) return bot(`неверный ID`);
				
						user.ban = true;
						message.user.list_ban += 1;
						vk.api.messages.send({ 
							user_id: user.id, 
							attachment: 'photo-174226458_456239146',
							message: `
				[😵] >> [id${user.id}|${user.tag}], к сожалению, Вы забанены. 
				[💣] || Вас забанил: + @id${message.user.id}(ADMINISTRATOR) + 
				[⚠] || Вы забанены с ${new Date().getHours()}:${new Date().getMinutes()} - НАВЕЧНО
				
				🍀 Вы можете купить разбан в группе - [Bota]
				🎁 Зимние скидки % (скоро)` }); 
				
					return bot(`Вы смогли забанить пользователя (${user.tag}) - навечно.`);
				}
				});
			
				
				cmd.hear(/^(?:set)\s([0-9]+)\s(.*)\s(.*)$/i, async (message, bot) => {
					if(message.user.admin == false) return;
					message.args[3] = message.args[3].replace(/(\.|\,)/ig, '');
					message.args[3] = message.args[3].replace(/(к|k)/ig, '000');
					message.args[3] = message.args[3].replace(/(м|m)/ig, '000000');
				
					if(Number(message.args[3])) message.args[3] = Math.floor(Number(message.args[3]));
					if(message.args[3] == "true" || message.args[3] == "false") message.args[3] = message.args[3] == "true" ? true : false;
					if(message.args[2] == "admin" && bot_owner != message.user.id) return bot(`защищённое поле, недоступное вам для редактирования`);
				
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(!user) return bot(`неверный ID игрока`);
				
					if(user[message.args[2]] == null) return bot(`такого поля не существует`);
					user[message.args[2]] = message.args[3];
				
					return bot(`вы сменили поле ${message.args[2]} игроку ${user.tag} на значение ${message.args[3]}`);
				});
				
				cmd.hear(/^(?:разбан)\s([0-9]+)$/i, async (message, bot) => {
					if(message.user.settings.adm < 3) return;
				
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(!user) return bot(`неверный ID игрока`);
				
					user.ban = false;
				
					return bot(`вы разбанили игрока ${user.tag}`);
				});
				
				
				
				
				cmd.hear(/^(?:передать|pay)\s([0-9]+)\s(.*)$/i, async (message, bot) => {
					message.user.nalogy += (5000, 1000, 2133, 123, 932);
					message.args[2] = message.args[2].replace(/(\.|\,|\:)/ig, '');
					message.args[2] = message.args[2].replace(/(к|k)/ig, '000');
					message.args[2] = message.args[2].replace(/(м|m)/ig, '000000');
					message.args[2] = message.args[2].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
				
					if(!Number(message.args[2])) return;
					message.args[2] = Math.floor(Number(message.args[2]));
				
					if(message.args[2] <= 0) return;
				
					if(message.args[2] > message.user.balance) return bot(`недостаточно денег
				💰 Баланс: ${utils.sp(message.user.balance)}$`);
					else if(message.args[2] <= message.user.balance)
					{
						let user = users.find(x=> x.uid === Number(message.args[1]));
						if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`);
				
						if(user.uid === message.user.uid) return bot(`укажите ID игрока из его профиля. ${smileerror}`);
				
						message.user.balance -= message.args[2];
						user.balance += message.args[2];
				
						vk.api.call("messages.send", {
				chat_id: 1,
				message: `✔ Перевод успешно завершен:
				
				Игрок: @id${message.user.id}(${message.user.tag}) - (Перевел ${utils.sp(message.args[2])}) игроку @id${user.id} (ID: ${user.uid})`,
				random_id: Math.random()
				});
				
						await bot(`вы перевели ${user.tag} ${utils.sp(message.args[2])}$
						💰 Ваш баланс: ${utils.sp(message.user.balance)}$`);
						if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ]
				▶ Игрок ${message.user.tag} перевел вам ${utils.sp(message.args[2])}$!
				🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` });
					}
				});

				cmd.hear(/^(?:рейтинг)$/i, async (message, bot) => {
					return bot(`ваш рейтинг: ${utils.sp(message.user.rating)}👑`);
				});
				
				cmd.hear(/^(?:ник)\s(вкл|выкл)$/i, async (message, bot) => {
					if(message.args[1].toLowerCase() === 'вкл')
					{
						message.user.mention = true;
						return bot(`гиперссылка включена!`);
					}
				
					if(message.args[1].toLowerCase() === 'выкл')
					{
						message.user.mention = false;
						return bot(`гиперссылка отключена!`);
					}
				});
				
				cmd.hear(/^(?:ник)\s(.*)$/i, async (message, bot) => {
					if(message.args[1].length >= 16) return bot(`максимальная длина ника 15 символов`);
				
					message.user.tag = message.args[1];
					return bot(`вы теперь "${message.user.tag}"`);
				});
				
				cmd.hear(/^(?:магазин)$/i, async (message, bot) => {
					return bot(`разделы магазина:
				🚙 Транспорт:
				⠀⠀🚗 Машины
				⠀⠀🛥 Яхты
				⠀⠀🛩 Самолеты
				⠀⠀🚁 Вертолеты
				
				🏘 Недвижимость:
				⠀⠀🏠 Дома
				⠀⠀🌇 Квартиры
				
				📌 Остальное:
				  👘 Одежда
				⠀⠀📱 Телефоны
				⠀⠀⭐ Фермы
				⠀⠀👑 Рейтинг [кол-во] - $250 млн
				⠀⠀💼 Бизнесы
				⠀⠀🌐 Биткоин [кол-во]
				
				🔎 Для покупки используйте "[категория] [номер]".
				⠀ ⠀ Например: "${utils.pick(['Телефон 7', 'Машина 1', 'Ферма 2', 'Биткоин 100', 'Рейтинг 10'])}"`);
				});
				
				cmd.hear(/^(?:продать)\s(.*)\s?(.*)?$/i, async (message, bot) => {
					let options = {
						count: null
					}
				
					message.args[2] = message.args[1].split(' ')[1];
				
					if(!message.args[2]) options.count = 1;
					if(message.args[2])
					{
						message.args[2] = message.args[2].replace(/(\.|\,)/ig, '');
						message.args[2] = message.args[2].replace(/(к|k)/ig, '000');
						message.args[2] = message.args[2].replace(/(м|m)/ig, '000000');
				
						message.args[2] = Math.floor(Number(message.args[2]));
						if(message.args[2] <= 0) return;
				
						if(!message.args[2]) options.count = 1;
						else if(message.args[2]) options.count = message.args[2];
					}
				
					if(/машин/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.transport.car) return bot(`у вас нет машины`);
						let a = Math.floor(cars[message.user.transport.car - 1].cost * 0.85);
				
						message.user.balance += Math.floor(cars[message.user.transport.car - 1].cost * 0.85);
						message.user.transport.car = 0;
				
						return bot(`вы продали свою машину за ${utils.sp(a)}$`);
					}
				
					if(/яхт/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.transport.yacht) return bot(`у вас нет яхты`);
						let a = Math.floor(yachts[message.user.transport.yacht - 1].cost * 0.85);
				
						message.user.balance += Math.floor(yachts[message.user.transport.yacht - 1].cost * 0.85);
						message.user.transport.yacht = 0;
				
						return bot(`вы продали свою яхту за ${utils.sp(a)}$`);
					}
				
					if(/самол(е|ё|йо)т/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.transport.airplane) return bot(`у вас нет самолёта`);
						let a = Math.floor(airplanes[message.user.transport.airplane - 1].cost * 0.85);
				
						message.user.balance += Math.floor(airplanes[message.user.transport.airplane - 1].cost * 0.85);
						message.user.transport.airplane = 0;
				
						return bot(`вы продали свой самолёт за ${utils.sp(a)}$`);
					}
				
					if(/в(и|е|я)рт(а|о)л(е|ё|йо)т/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.transport.helicopter) return bot(`у вас нет самолёта`);
						let a = Math.floor(helicopters[message.user.transport.helicopter - 1].cost * 0.85);
				
						message.user.balance += Math.floor(helicopters[message.user.transport.helicopter - 1].cost * 0.85);
						message.user.transport.helicopter = 0;
				
						return bot(`вы продали свой вертолёт за ${utils.sp(a)}$`);
					}
				
					if(/дом/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.realty.home) return bot(`у вас нет дома`);
						let a = Math.floor(homes[message.user.realty.home - 1].cost * 0.85);
				
						message.user.balance += Math.floor(homes[message.user.realty.home - 1].cost * 0.85);
						message.user.realty.home = 0;
				
						return bot(`вы продали свой дом за ${utils.sp(a)}$`);
					}

					if(/одежду/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.odejda) return bot(`у вас нет одежды`);
						let a = Math.floor(odejda[message.user.odejda - 1].cost * 0.85);
				
						message.user.balance += Math.floor(odejda[message.user.odejda - 1].cost * 0.85);
						message.user.odejda = 0;
				
						return bot(`вы продали свою одежду за ${utils.sp(a)}$`);
					}
				
					if(/квартир/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.realty.apartment) return bot(`у вас нет квартиры`);
						let a = Math.floor(apartments[message.user.realty.apartment - 1].cost * 0.85);
				
						message.user.balance += Math.floor(apartments[message.user.realty.apartment - 1].cost * 0.85);
						message.user.realty.apartment = 0;
				
						return bot(`вы продали свою квартиру за ${utils.sp(a)}$`);
					}
				
					if(/телефон/i.test(message.args[1].toLowerCase()))
					{
						if(!message.user.misc.phone) return bot(`у вас нет телефона`);
						let a = Math.floor(phones[message.user.misc.phone - 1].cost * 0.85);
				
						message.user.balance += Math.floor(phones[message.user.misc.phone - 1].cost * 0.85);
						message.user.misc.phone = 0;
				
						return bot(`вы продали свой телефон за ${utils.sp(a)}$`);
					}
				
					if(/ферм/i.test(message.args[1].toLowerCase()))
					{
						if(message.user.misc.farm == 0) return bot(`у вас нет фермы`);
						if(options.count > message.user.misc.farm_count) return bot(`у вас нет столько ферм`);
						if(options.count <= 0) return bot(`вы не можете продать столько ферм`);
						let a = Math.floor(farms[message.user.misc.farm - 1].cost * options.count * 0.85);
				
						message.user.balance += a;
						message.user.misc.farm_count -= options.count;
						if(message.user.misc.farm_count == 0) message.user.misc.farm = 0;
				
						return bot(`вы продали свои фермы (${options.value} шт.) за ${utils.sp(a)}$`);
					}
				
					if(/рейтинг/i.test(message.args[1].toLowerCase()))
					{
						if(options.count > message.user.rating) return bot(`у вас нет рейтинга`);
						let a = (150000000 * options.count);
				
						message.user.balance += Math.floor(a);
						message.user.rating -= options.count;
				
						return bot(`вы продали ${options.count} ${utils.decl(options.count, ['рейтинг', 'рейтинга', 'рейтингов'])} за ${utils.sp(Math.floor(a))}`);
					}
				
					if(/бизнес/i.test(message.args[1].toLowerCase()))
					{
						if(message.user.business.length == 0) return bot(`у вас нет бизнеса`);
						if(options.count < 1 || options.count > 2) return bot(`используйте: Продать бизнес [1 или 2]`);
						if(message.user.business.length < options.count) return bot(`у вас нет этого бизнеса`);
						options.count--;
						let a = Math.floor(businesses[message.user.business[options.count].id - 1][message.user.business[options.count].upgrade - 1].cost * 0.85);
				
						message.user.balance += Math.floor(a);
						message.user.business.splice(options.count, 1);
				
						return bot(`вы продали свой бизнес за ${ utils.sp(a) }$`);
					}
				
					if(/биткоин/i.test(message.args[1].toLowerCase()))
					{
						if(options.count > message.user.btc) return bot(`недостаточно биткоинов`);
						let a = Math.floor(btc * options.count);
				
						message.user.balance += Math.floor(a);
						message.user.btc -= options.count;
				
						return bot(`вы продали ${options.count}₿ за ${utils.sp(a)}$`);
					}
				});
				
				cmd.hear(/^(?:машины|машина)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`машины:
				${message.user.transport.car === 1 ? '🔹' : '🔸'} 1. Самокат (500$)
				${message.user.transport.car === 2 ? '🔹' : '🔸'} 2. Велосипед (2.500$)
				${message.user.transport.car === 3 ? '🔹' : '🔸'} 3. Гироскутер (5.000$)
				${message.user.transport.car === 4 ? '🔹' : '🔸'} 4. Сегвей (7.500$)
				${message.user.transport.car === 5 ? '🔹' : '🔸'} 5. Мопед (25.000$)
				${message.user.transport.car === 6 ? '🔹' : '🔸'} 6. Мотоцикл (50.000$)
				${message.user.transport.car === 7 ? '🔹' : '🔸'} 7. ВАЗ 2109 (75.000$)
				${message.user.transport.car === 8 ? '🔹' : '🔸'} 8. Квадроцикл (80.000$)
				${message.user.transport.car === 9 ? '🔹' : '🔸'} 9. Багги (135.000$)
				${message.user.transport.car === 10 ? '🔹' : '🔸'} 10. Вездеход (200.000$)
				${message.user.transport.car === 11 ? '🔹' : '🔸'} 11. Лада Xray (350.000$)
				${message.user.transport.car === 12 ? '🔹' : '🔸'} 12. Audi Q7 (750.000$)
				${message.user.transport.car === 13 ? '🔹' : '🔸'} 13. BMW X6 (1.000.000$)
				${message.user.transport.car === 14 ? '🔹' : '🔸'} 14. Toyota FT-HS (1.750.000$)
				${message.user.transport.car === 15 ? '🔹' : '🔸'} 15. BMW Z4 M (2.500.000$)
				${message.user.transport.car === 16 ? '🔹' : '🔸'} 16. Subaru WRX STI (2.750.000$)
				${message.user.transport.car === 17 ? '🔹' : '🔸'} 17. Lamborghini Veneno (3.000.000$)
				${message.user.transport.car === 18 ? '🔹' : '🔸'} 18. Tesla Roadster (4.500.000$)
				${message.user.transport.car === 19 ? '🔹' : '🔸'} 19. Yamaha YZF R6 (5.000.000$)
				${message.user.transport.car === 20 ? '🔹' : '🔸'} 20. Bugatti Chiron (6.500.000$)
				${message.user.transport.car === 21 ? '🔹' : '🔸'} 21. Thrust SSC (35.000.000$)
				${message.user.transport.car === 22 ? '🔹' : '🔸'} 22. Ferrari LaFerrari (39.000.000$)
				${message.user.transport.car === 23 ? '🔹' : '🔸'} 23. Koenigsegg Regera (50.000.000$)
				${message.user.transport.car === 24 ? '🔹' : '🔸'} 24. Tesla Semi (75.000.000$)
				${message.user.transport.car === 25 ? '🔹' : '🔸'} 25. Venom GT (125.000.000$)
				${message.user.transport.car === 26 ? '🔹' : '🔸'} 26. Rolls-Royce (200.000.000$)
				
				Для покупки введите "Машина [номер]"`);
				
					const sell = cars.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.transport.car) return bot(`у вас уже есть машина (${cars[message.user.transport.car - 1].name}), введите "Продать машину"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.transport.car = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:яхты|яхта)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`яхты:
				${message.user.transport.yacht === 1 ? '🔹' : '🔸'} 1. Ванна (10.000$)
				${message.user.transport.yacht === 2 ? '🔹' : '🔸'} 2. Nauticat 331 (10.000.000$)
				${message.user.transport.yacht === 3 ? '🔹' : '🔸'} 3. Nordhavn 56 MS (15.000.000$)
				${message.user.transport.yacht === 4 ? '🔹' : '🔸'} 4. Princess 60 (25.000.000$)
				${message.user.transport.yacht === 5 ? '🔹' : '🔸'} 5. Azimut 70 (35.000.000$)
				${message.user.transport.yacht === 6 ? '🔹' : '🔸'} 6. Dominator 40M (50.000.000$)
				${message.user.transport.yacht === 7 ? '🔹' : '🔸'} 7. Moonen 124 (60.000.000$)
				${message.user.transport.yacht === 8 ? '🔹' : '🔸'} 8. Wider 150 (65.000.000$)
				${message.user.transport.yacht === 9 ? '🔹' : '🔸'} 9. Palmer Johnson 42M SuperSport (80.000.000$)
				${message.user.transport.yacht === 10 ? '🔹' : '🔸'} 10. Wider 165 (85.000.000$)
				${message.user.transport.yacht === 11 ? '🔹' : '🔸'} 11. Eclipse (150.000.000$)
				${message.user.transport.yacht === 12 ? '🔹' : '🔸'} 12. Dubai (300.000.000$)
				${message.user.transport.yacht === 13 ? '🔹' : '🔸'} 13. Streets of Monaco (750.000.000$)
				
				Для покупки введите "Яхта [номер]"`);
				
					const sell = yachts.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.transport.yacht) return bot(`у вас уже есть яхта (${yachts[message.user.transport.yacht - 1].name}), введите "Продать яхту"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.transport.yacht = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				
				
				cmd.hear(/^(?:самол(?:е|ё)т|самол(?:е|ё)ты)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`самолеты:
				${message.user.transport.airplane === 1 ? '🔹' : '🔸'} 1. Параплан (100.000$)
				${message.user.transport.airplane === 2 ? '🔹' : '🔸'} 2. АН-2 (350.000$)
				${message.user.transport.airplane === 3 ? '🔹' : '🔸'} 3. Cessna-172E (700.000$)
				${message.user.transport.airplane === 4 ? '🔹' : '🔸'} 4. Supermarine Spitfire (1.000.000$)
				${message.user.transport.airplane === 5 ? '🔹' : '🔸'} 5. BRM NG-5 (1.400.000$)
				${message.user.transport.airplane === 6 ? '🔹' : '🔸'} 6. Cessna T210 (2.600.000$)
				${message.user.transport.airplane === 7 ? '🔹' : '🔸'} 7. Beechcraft 1900D (5.500.000$)
				${message.user.transport.airplane === 8 ? '🔹' : '🔸'} 8. Cessna 550 (8.000.000$)
				${message.user.transport.airplane === 9 ? '🔹' : '🔸'} 9. Hawker 4000 (22.400.000$)
				${message.user.transport.airplane === 10 ? '🔹' : '🔸'} 10. Learjet 31 (45.000.000$)
				${message.user.transport.airplane === 11 ? '🔹' : '🔸'} 11. Airbus A318 (85.000.000$)
				${message.user.transport.airplane === 12 ? '🔹' : '🔸'} 12. F-35A (160.000.000$)
				${message.user.transport.airplane === 13 ? '🔹' : '🔸'} 13. Boeing 747-430 Custom (225.000.000$)
				${message.user.transport.airplane === 14 ? '🔹' : '🔸'} 14. C-17A Globemaster III (350.000.000$)
				${message.user.transport.airplane === 15 ? '🔹' : '🔸'} 15. F-22 Raptor (400.000.000$)
				${message.user.transport.airplane === 16 ? '🔹' : '🔸'} 16. Airbus 380 Custom (600.000.000$)
				${message.user.transport.airplane === 17 ? '🔹' : '🔸'} 17. B-2 Spirit Stealth Bomber (1.359.000.000$)
				
				Для покупки введите "Самолет [номер]"`);
				
					const sell = airplanes.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.transport.airplane) return bot(`у вас уже есть самолёт (${airplanes[message.user.transport.airplane - 1].name}), введите "Продать самолёт"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.transport.airplane = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:вертол(?:е|ё)т|вертол(?:е|ё)ты)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`вертолеты:
				${message.user.transport.helicopter === 1 ? '🔹' : '🔸'} 1. Шарик с пропеллером (2$)
				${message.user.transport.helicopter === 2 ? '🔹' : '🔸'} 2. RotorWay Exec 162F (300.000$)
				${message.user.transport.helicopter === 3 ? '🔹' : '🔸'} 3. Robinson R44 (450.000$)
				${message.user.transport.helicopter === 4 ? '🔹' : '🔸'} 4. Hiller UH-12C (1.300.000$)
				${message.user.transport.helicopter === 5 ? '🔹' : '🔸'} 5. AW119 Koala (2.500.000$)
				${message.user.transport.helicopter === 6 ? '🔹' : '🔸'} 6. MBB BK 117 (4.000.000$)
				${message.user.transport.helicopter === 7 ? '🔹' : '🔸'} 7. Eurocopter EC130 (7.500.000$)
				${message.user.transport.helicopter === 8 ? '🔹' : '🔸'} 8. Leonardo AW109 Power (10.000.000$)
				${message.user.transport.helicopter === 9 ? '🔹' : '🔸'} 9. Sikorsky S-76 (15.000.000$)
				${message.user.transport.helicopter === 10 ? '🔹' : '🔸'} 10. Bell 429WLG (19.000.000$)
				${message.user.transport.helicopter === 11 ? '🔹' : '🔸'} 11. NHI NH90 (35.000.000$)
				${message.user.transport.helicopter === 12 ? '🔹' : '🔸'} 12. Kazan Mi-35M (60.000.000$)
				${message.user.transport.helicopter === 13 ? '🔹' : '🔸'} 13. Bell V-22 Osprey (135.000.000$)
				
				Для покупки введите "Вертолет [номер]"`);
				
					const sell = helicopters.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.transport.helicopter) return bot(`у вас уже есть вертолёт (${homes[message.user.transport.helicopter - 1].name}), введите "Продать вертолёт"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.transport.helicopter = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:дом|дома)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`дома:
				${message.user.realty.home === 1 ? '🔹' : '🔸'} 1. Коробка из-под холодильника (250$)
				${message.user.realty.home === 2 ? '🔹' : '🔸'} 2. Подвал (3.000$)
				${message.user.realty.home === 3 ? '🔹' : '🔸'} 3. Палатка (3.500$)
				${message.user.realty.home === 4 ? '🔹' : '🔸'} 4. Домик на дереве (5.000$)
				${message.user.realty.home === 5 ? '🔹' : '🔸'} 5. Полуразрушенный дом (10.000$)
				${message.user.realty.home === 6 ? '🔹' : '🔸'} 6. Дом в лесу (25.000$)
				${message.user.realty.home === 7 ? '🔹' : '🔸'} 7. Деревянный дом (37.500$)
				${message.user.realty.home === 8 ? '🔹' : '🔸'} 8. Дача (125.000$)
				${message.user.realty.home === 9 ? '🔹' : '🔸'} 9. Кирпичный дом (80.000$)
				${message.user.realty.home === 10 ? '🔹' : '🔸'} 10. Коттедж (450.000$)
				${message.user.realty.home === 11 ? '🔹' : '🔸'} 11. Особняк (1.250.000$)
				${message.user.realty.home === 12 ? '🔹' : '🔸'} 12. Дом на Рублёвке (5.000.000$)
				${message.user.realty.home === 13 ? '🔹' : '🔸'} 13. Личный небоскрёб (7.000.000$)
				${message.user.realty.home === 14 ? '🔹' : '🔸'} 14. Остров с особняком (12.500.000$)
				${message.user.realty.home === 15 ? '🔹' : '🔸'} 15. Белый дом (20.000.000$)
				
				Для покупки введите "Дом [номер]"`);
				
					const sell = homes.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.realty.home) return bot(`у вас уже есть дом (${homes[message.user.realty.home - 1].name}), введите "Продать дом"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.realty.home = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:квартира|квартиры)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`квартиры:
				${message.user.realty.apartment === 1 ? '🔹' : '🔸'} 1. Чердак (15.000$)
				${message.user.realty.apartment === 2 ? '🔹' : '🔸'} 2. Квартира в общежитии (55.000$)
				${message.user.realty.apartment === 3 ? '🔹' : '🔸'} 3. Однокомнатная квартира (175.000$)
				${message.user.realty.apartment === 4 ? '🔹' : '🔸'} 4. Двухкомнатная квартира (260.000$)
				${message.user.realty.apartment === 5 ? '🔹' : '🔸'} 5. Четырехкомнатная квартира (500.000$)
				${message.user.realty.apartment === 6 ? '🔹' : '🔸'} 6. Квартира в центре Москвы (1.600.000$)
				${message.user.realty.apartment === 7 ? '🔹' : '🔸'} 7. Двухуровневая квартира (4.000.000$)
				${message.user.realty.apartment === 8 ? '🔹' : '🔸'} 8. Квартира с Евроремонтом (6.000.000$)
				
				Для покупки введите "Квартира [номер]"`);
				
					const sell = apartments.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.realty.apartment) return bot(`у вас уже есть квартира (${apartments[message.user.realty.apartment - 1].name}), введите "Продать квартиру"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.realty.apartment = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:телефон|телефоны)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`телефоны:
				${message.user.misc.phone === 1 ? '🔹' : '🔸'} 1. Nokia 108 (250$)
				${message.user.misc.phone === 2 ? '🔹' : '🔸'} 2. Nokia 3310 (2017) (500$)
				${message.user.misc.phone === 3 ? '🔹' : '🔸'} 3. ASUS ZenFone 4 (2.000$)
				${message.user.misc.phone === 4 ? '🔹' : '🔸'} 4. BQ Aquaris X (10.000$)
				${message.user.misc.phone === 5 ? '🔹' : '🔸'} 5. Sony Xperia XA (15.000$)
				${message.user.misc.phone === 6 ? '🔹' : '🔸'} 6. Samsung Galaxy S8 (30.000$)
				${message.user.misc.phone === 7 ? '🔹' : '🔸'} 7. Xiaomi Mi Mix (50.000$)
				${message.user.misc.phone === 8 ? '🔹' : '🔸'} 8. Torex FS1 (75.000$)
				${message.user.misc.phone === 9 ? '🔹' : '🔸'} 9. iPhone X (100.000$)
				${message.user.misc.phone === 10 ? '🔹' : '🔸'} 10. Мегафон С1 (250.000$)
				
				Для покупки введите "Телефон [номер]"`);
				
					const sell = phones.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.misc.phone) return bot(`у вас уже есть телефон (${phones[message.user.misc.phone - 1].name}), введите "Продать телефон"`);
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost)
					{
						message.user.balance -= sell.cost;
						message.user.misc.phone = sell.id;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
					}
				});
				
				cmd.hear(/^(?:фермы)\s?([0-9]+)?\s?(.*)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`Майнинг фермы:
				${message.user.misc.farm === 1 ? '🔹' : '🔸'} 1. 6U Nvidia 2₿/час (20.500.000$)
				${message.user.misc.farm === 2 ? '🔹' : '🔸'} 2. AntminerS9 10₿/час (100.000.000$)
				${message.user.misc.farm === 3 ? '🔹' : '🔸'} 3. FM2018-BT200 100₿/час (900.000.000$)
				${message.user.misc.farm === 4 ? '🔹' : '🔸'} 4. Genesis Mining 3000₿/час (9.000.000.000$)
				${message.user.misc.farm === 5 ? '🔹' : '🔸'} 5. GigaWatt 250000₿/час (800.000.000.000$)

				
				Для покупки введите "Фермы [номер] [количество]"`);
				
					const sell = farms.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					const count = Math.floor(message.args[2] ? Number(message.args[2]) : 1);
					if(count <= 0) return bot(`нельзя купить 0 ферм или меньше`);
					if(count + message.user.misc.farm_count > 2000) return bot(`вы не можете иметь больше 1000 ферм одновременно`);
					if(message.user.misc.farm != 0 && message.user.misc.farm != message.args[1]) return bot(`вы не можете купить ферму другого типа`);
				
					if(message.user.balance < sell.cost * count) return bot(`недостаточно денег`);
					else if(message.user.balance >= sell.cost * count)
					{
						message.user.balance -= sell.cost * count;
						message.user.misc.farm = sell.id;
						message.user.misc.farm_count += count;
				
						return bot(`вы купили "${sell.name}" (${count} шт.) за ${utils.sp(sell.cost * count)}$`);
					}
				});
				
				cmd.hear(/^(?:рейтинг)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
					message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
					message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
				
					if(!Number(message.args[1])) return;
					message.args[1] = Math.floor(Number(message.args[1]));
					if(message.user.settings.adm > 1) return bot(`Администрации запрещено покупать рейтинг`)
				
					if(message.args[1] <= 0) return;
				
					if(( message.args[1] * 250000000 ) > message.user.balance) return bot(`у вас недостаточно денег`);
					else if(( message.args[1] * 250000000 ) <= message.user.balance)
					{
						message.user.balance -= ( message.args[1] * 250000000 );
						message.user.rating += message.args[1];
				
						return bot(`вы повысили свой рейтинг на ${message.args[1]}👑 за ${message.args[1] * 250000000}$`);
					}
				});
				
				cmd.hear(/^(?:бизнесы)\s?([0-9]+)?$/i, async (message, bot) => {
					if(!message.args[1]) return bot(`бизнесы:
				${message.user.business === 1 ? '🎒' : '💼'} 1. Рекламное агенство - 50.000$
				⠀ ⠀ ⠀ Прибыль: 400$/час
				${message.user.business === 2 ? '🎒' : '💼'} 2. Сервер Minecraft - 100.000$
				⠀ ⠀ ⠀ Прибыль: 700$/час
				${message.user.business === 3 ? '🎒' : '💼'} 3. Сервер Minecraft PE(1.20.1) - 300.000$
				⠀ ⠀ ⠀ Прибыль: 2.500$/час
				${message.user.business === 4 ? '🎒' : '💼'} 4. Магазин(Магнит) - 500.000$
				⠀ ⠀ ⠀ Прибыль: 3.800$/час
				${message.user.business === 5 ? '🎒' : '💼'} 5. Магазин(Ярмарка) - 1.500.000$
				⠀ ⠀ ⠀ Прибыль: 8.000$/час
				${message.user.business === 6 ? '🎒' : '💼'} 6. Шахта - 25.000.000$
				⠀ ⠀ ⠀ Прибыль: 70.000$/час
				${message.user.business === 7 ? '🎒' : '💼'} 7. Офис - 80.000.000$
				⠀ ⠀ ⠀ Прибыль: 220.000$/час
				${message.user.business === 8 ? '🎒' : '💼'} 8. GAME - 150.000.000$
				⠀ ⠀ ⠀ Прибыль: 300.000$/час
				${message.user.business === 9 ? '🎒' : '💼'} 9. Нефтевышка - 500.000.000$
				⠀ ⠀ ⠀ Прибыль: 700.000$/час
				${message.user.business === 10 ? '🎒' : '💼'} 10. Атомная электростанция - 800.000.000$
				⠀ ⠀ ⠀ Прибыль: 1.000.000$/час
				${message.user.business === 11 ? '🎒' : '💼'} 11. Авиокомпания - 10.000.000.000$
				⠀ ⠀ ⠀ Прибыль: 2.500.000$/час
				${message.user.business === 12 ? '🎒' : '💼'} 12. Межпланетный экспресс - 250.000.000.000$
				⠀ ⠀ ⠀ Прибыль: 35.000.000$/час
				${message.user.business === 13 ? '🍔' : '💼'} 13. Макдональдс - 420.000.000.000.000$
				⠀ ⠀ ⠀ Прибыль: 500.000.000$/час
				Для покупки введите "Бизнесы [номер]"`);
				
					const sell = businesses.find(x=> x.id === Number(message.args[1]));
					if(!sell) return;
					if(message.user.business) return bot(`у вас уже есть бизнес (${businesses[message.user.business - 1].name}), введите "Продать бизнес"`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Бизнес"
						},
						"color": "primary"
						},
						{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Продать бизнес"
						},
						"color": "negative"
						}]
						]
						})
						})
				
					if(message.user.balance < sell.cost) return bot(`недостаточно денег`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "🔑 Бонус"
						},
						"color": "primary"
						}]
						]
						})
						})
					else if(message.user.balance >= message.args[1])
					{
						message.user.balance -= sell.cost;
						message.user.business = sell.id;
						message.user.bizlvl = 1;
				
						return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`,
						{
							keyboard:JSON.stringify(
							{
							"inline": true,
							"buttons": [
							[{
							"action": {
							"type": "text",
							"payload": "{}",
							"label": "Бизнес"
							},
							"color": "primary"
							}]
							]
							})
							})
					}
				});
				
				cmd.hear(/^(?:курс)$/i, async (message, bot) => {
					return bot(`курс валют на данный момент:
				💸Биткоин: ${utils.sp(btc)}$`);
				});
				
				cmd.hear(/^(?:биткоин)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
					message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
					message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
				
					if(!Number(message.args[1])) return;
					message.args[1] = Math.floor(Number(message.args[1]));
				
					if(message.args[1] <= 0) return;
				
					if(( message.args[1] * btc ) > message.user.balance) return bot(`недостаточно денег
				Курс биткоина: ${btc}$`);
					else if(( message.args[1] * btc ) <= message.user.balance)
					{
						message.user.balance -= ( message.args[1] * btc );
						message.user.btc += message.args[1];
				
						return bot(`вы купили ${utils.sp(message.args[1])}₿ за ${utils.sp(message.args[1] * btc)}$`);
					}
				});
				
				cmd.hear(/^(?:Топ|top)$/i, async (message, bot) => { 
					return bot(`🍩 Список топов »
					
					[ 👑 ] Топ рейтинг - Список топовых ребят, по рейтингу.
					[ 🌟 ] Топ опыт - Список топовых ребят, по опыту.
					[ ✉ ] Топ ранги - Список топ ребят, по сообщениям.`);
					});

					cmd.hear(/^(?:топ опыт)$/i, async (message, bot) => {
						message.user.foolder += 1; 
							let top = [];
						
							users.map(x=> {
								top.push({ balance: x.balance, opit: x.opit, tag: x.tag, id: x.id, mention: x.mention });
							});
						
							top.sort((a, b) => {
								return b.opit - a.opit;
							});
						
							let text = ``;
							const find = () => {
								let pos = 1000;
						
								for (let i = 0; i < top.length; i++)
								{
									if(top[i].id === message.senderId) return pos = i;
								}
						
								return pos;
							}
						
							for (let i = 0; i < 10; i++)
							{
								if(!top[i]) return;
								const user = top[i];
						
								text += `${i === 9 ? `&#128287;` : `${i + 1}&#8419;`} | @id${user.id} (${user.tag}) — 🌟${utils.sp(user.opit)}
								`;
							}
						
							return bot(`топ игроков:
								${text}
						—————————————————
						${utils.gi(find() + 1)} ${message.user.tag} — 🌟${utils.sp(message.user.opit)}\n\n\n
						
						`)
						await message.sendSticker(13294);
						});

						cmd.hear(/^(?:топ рейтинг)$/i, async (message, bot) => {
							let array = users.map(x=>x), balance = 0, bank = 0, btc = 0, rating = 0, ban = true;
						for(let i = 1; i < array.length; i++) {
						rating += array[i].rating
						}
							let top = [];
						
							users.map(x=> {
								top.push({ balance: x.balance, rating: x.rating, tag: x.tag, id: x.id, mention: x.mention });
							});
						
							top.sort((a, b) => {
								return b.rating - a.rating;
							});
						
							let text = ``;
							const find = () => {
								let pos = 1000;
						
								for (let i = 0; i < top.length; i++)
								{
									if(top[i].id === message.senderId) return pos = i;
								}
						
								return pos;
							}
						
							for (let i = 0; i < 10; i++)
							{
								if(!top[i]) return;
								const user = top[i];
						
								text += `${i === 9 ? `&#128287;` : `${i + 1}&#8419;`} | @id${user.id} (${user.tag}) — 👑${utils.sp(user.rating)} | $${utils.rn(user.balance)}
								`;
							}
						
							bot(`топ игроков:
								${text}
						—————————————————
						${utils.gi(find() + 1)} ${message.user.tag} — 👑${utils.sp(message.user.rating)} | $${utils.rn(message.user.balance)} \n 👑 Общее количество рейтинга: ${utils.sp(rating)}`);
						return message.sendSticker (9218);
						});

						cmd.hear(/^(?:топ ранги|топ сообщений|топ смс)$/i, async (message, bot) => {
							if(message.user.msg < 25) return bot(`❗ | Команда не работет, чтобы заработала, вам нужно иметь больше 25-и сообщений в боте!
						
						📶 Сообщений: ${message.user.msg}/50`)
							let top = [];
						
							users.map(x=> {
								top.push({ msg: x.msg, tag: x.tag, id: x.id, mention: x.mention });
							});
						
							top.sort((a, b) => {
								return b.msg - a.msg;
							});
						
							let text = ``;
							const find = () => {
								let pos = 1000;
						
								for (let i = 0; i < top.length; i++)
								{
									if(top[i].id === message.senderId) return pos = i;
								}
						
								return pos;
							}
						
							for (let i = 0; i < 10; i++)
							{
								if(!top[i]) return;
								const user = top[i];
						
								text += `${i === 9 ? `&#128287;` : `${i + 1}&#8419;`} | @id${user.id} (${user.tag}) — 🌎${utils.sp(user.msg)} 
								`;
							}
						
							bot(`топ игроков:
								${text}
						—————————————————
						${utils.gi(find() + 1)} ${message.user.tag} — 🌎${utils.sp(message.user.msg)}`);
						return message.sendSticker (9218);
						});
				
				cmd.hear(/^(?:бонус|@wild_bot1 🔑 Бонус|🔑 Бонус)$/i, async (message, bot) => {
					if(message.user.timers.bonus) return bot(`вы сможете получить бонус через 24 часа`);
					let prize = utils.pick([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
				
					setTimeout(() => {
						message.user.timers.bonus = false;
					}, 86400000);
				
					message.user.timers.bonus = true;
				
					if(prize === 1)
					{
						message.user.balance += 50000;
						return bot(`вы выиграли 50.000$`);
					}
				
					if(prize === 2)
					{
						message.user.btc += 1000;
						return bot(`вы выиграли 1.000₿`);
					}
				
					if(prize === 3)
					{
						message.user.rating += 5;
						return bot(`вы выиграли 5👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 4)
					{
						message.user.rating += 1;
						return bot(`вы выиграли 1👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 5)
					{
						message.user.rating += 10;
						return bot(`вы выиграли 10👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 6)
					{
						message.user.rating += 2;
						return bot(`вы выиграли 2👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
					if(prize === 7)
					{
						message.user.rating += 3;
						return bot(`вы выиграли 3👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
					if(prize === 8)
					{
						message.user.rating += 4;
						return bot(`вы выиграли 4👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
					if(prize === 9)
					{
						message.user.bank += 1000000;
						return bot(`вы выиграли 1.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
					if(prize === 10)
					{
						message.user.bank += 5000000;
						return bot(`вы выиграли 5.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				
					if(prize === 11)
					{
						message.user.bank += 10000000;
						return bot(`вы выиграли 10.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				
					if(prize === 12)
					{
						message.user.bank += 50000000;
						return bot(`вы выиграли 50.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				});
				
				cmd.hear(/^(?:брак)\s([0-9]+)$/i, async (message, bot) => {
					if(message.user.marriage.partner) return bot(`вы уже в браке с игроком ${users[message.user.marriage.partner].tag}`);
					if(Number(message.args[1]) === message.user.uid) return bot(`вы не можете жениться/выйти замуж за себя`);
				
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(!user) return bot(`неверный ID`);
				
					if(user.marriage.partner) return bot(`этот человек уже состоит в браке`);
				
					if(user.marriage.requests.find(x=> x == message.args[1])) return bot(`вы уже делали предложение этому игроку`);
				
					if(message.user.marriage.requests.find(x=> x == message.args[1]))
					{
						message.user.marriage.requests = [];
						message.user.marriage.partner = user.uid;
				
						user.marriage.requests = [];
						user.marriage.partner = message.user.uid;
				
						return bot(`вы вступили в брак с игроком "${user.tag}"`);
					}
				
					user.marriage.requests.push(message.user.uid);
					return bot(`вы сделали предложение игроку "${user.tag}"`);
				});
				
				cmd.hear(/^(?:браки)$/i, async (message, bot) => {
					if(message.user.marriage.partner) return bot(`вы уже состоите в браке`);
					return bot(`предложения:
						${message.user.marriage.requests.map(x=> `от игрока "${users[x].tag}" (ID: ${x})`).join('\n')}`);
				});
				
				cmd.hear(/^(?:развод)$/i, async (message, bot) => {
					if(!message.user.marriage.partner) return bot(`вы не состоите в браке`);
				
					let user = users.find(x=> x.uid === message.user.marriage.partner);
				
					message.user.marriage.partner = 0;
					user.marriage.partner = 0;
				
					return bot(`вы теперь свободный человек`);
				});
				
				cmd.hear(/^(?:дата)\s([0-9]+)$/i, async (message, bot) => {
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(!user) return bot(`неверный ID`);
				
					return bot(`дата регистрации ${user.tag}: ${user.regDate}`);
				});
				
			cmd.hear(/^репорт\s?([^]+)?/i, async (message, bot) => {
if(message.isChat) return bot(`команда работает только в ЛС.`); 
if(!message.args[1]) return message.send(`вы не написали жалобу | репорт [текст]`);

setTimeout(() => {
message.user.otpravka = false;
return;
}, 180000);

message.user.otpravka = true;

message.user.report_o = 1

vk.api.messages.send({ user_id: 531114362, forward_messages: message.id, message: `[РЕПОРТИК]\n\n[👤] Игровой ID: [id${message.user.id}| ${message.user.uid}] \n[🔈] Жалоба: ${message.args[1]} \n[✉] Для ответа напишите "Ответ ${message.user.uid} ваш текст"` 
})

for(i=0;i<200000;i++){
if(users[i]){
if(users[i].right >= 4) { 
vk.api.messages.send({ peer_id: users[i].id, forward_messages: message.id, message: `[РЕПОРТИК]\n👤 Игровой ID: [id${message.user.id}| ${message.user.uid}] \n🔈 Жалоба: ${message.args[1]} \n Для ответа: ответ ${message.user.uid} ваш текст`
}).then((res) => {}).catch((error) => {console.log('report error'); }); 
}
}
}

return bot("📄 Ваша жалоба зарегистрированна в системе, ожидайте ответа!");
});

cmd.hear(/^(?:ответ)\s([0-9]+)\s([^]+)$/i, async (message, bot) => {
const user = await users.find(x=> x.uid === Number(message.args[1]));
if(message.user.settings.adm < 2) return;
if(user.report_o === 0) return bot(`Игрок не отправлял репорт`);

if(!user) return;

vk.api.messages.send({ user_id: user.id, message: `✉ [id${user.id}| ${user.tag}], Администратор ответил на ваше обращение: \n
✉ Ответ: ${message.args[2]}.\n С уважением Администратор BOT: №${message.user.uid} ❤ ` });

message.user.ans += 1;
user.report_o = 0;

return message.send(`✉ Ваш ответ отправлен!\n\n ✉ Кол-во ответов: +${message.user.pechenka += 1}!`) 
});

cmd.hear(/^(?:уголь)$/i, async (message, bot) => { 

return bot(`у вас ${utils.sp(message.user.ugol)} угля. 🏵`);

});
				
				cmd.hear(/^(?:реши)\s([0-9]+)\s(\+|\-|\/|\*)\s([0-9]+)$/i, async (message, bot) => {
					const result = eval(`${message.args[1]}${message.args[2]}${message.args[3]}`);
					return bot(`${message.args[1]}${message.args[2]}${message.args[3]}=${result}`);
				});
				
				cmd.hear(/^(?:работа)\s([0-9]+)$/i, async (message, bot) => {
					if(message.user.work) return bot(`ваша профессия - ${works[message.user.work - 1].name}
					${message.user.timers.hasWorked ? `Вы уже работали в эти 10 минут` : ``}`);
				
					const work = works.find(x=> x.id === Number(message.args[1]));
					if(!work) return console.log(message.args[1]);
				
					if(work.requiredLevel > message.user.level) return bot(`вы не можете устроиться на эту работу!`);
					else if(work.requiredLevel <= message.user.level)
					{
						message.user.work = work.id;
						return bot(`вы устроились работать - ${work.name}
						👔 Введите команду "Работать"`);
					}
				});
				
				cmd.hear(/^(?:работа)$/i, async (message, bot) => {
					if(message.user.work) return bot(`ваша профессия - ${works[message.user.work - 1].name}
					${message.user.timers.hasWorked ? `Вы уже работали в эти 10 минут` : ``}`);
					return bot(`профессии:
					🔹 1. Дворник - зарплата ~12.500$
					🔹 2. Сантехник - зарплата ~22.500$
					🔹 3. Электрик - зарплата ~25.000$
					🔹 4. Слесарь - зарплата ~30.000$
					🔹 5. Юрист - зарплата ~45.000$
					🔹 6. Бухгалтер - зарплата ~55.000$
					🔹 7. Бармен - зарплата ~60.000$
					🔹 8. Администратор - зарплата ~75.000$
					🔹 9. Программист - зарплата ~100.000$
					Для трудоустройства введите "Работа [номер]`);
				});
				
				cmd.hear(/^(?:работать)$/i, async (message, bot) => {
					if(!message.user.work) return bot(`вы нигде не работаете 😩
					Для трудоустройства введите "Работа"`);
				
					if(message.user.timers.hasWorked) return bot(`рабочий день закончен.
					⏳ Вы сможете работать в ближайшие 10 минут`);
				
					setTimeout(() => {
						message.user.timers.hasWorked = false;
					}, 600000);
				
					message.user.timers.hasWorked = true;
				
					const work = works.find(x=> x.id === message.user.work);
					const earn = utils.random(work.min, work.max);
				
					message.user.balance += earn;
					message.user.exp += 1;
				
					return bot(`рабочий день закончен
					💵 Вы заработали ${utils.sp(earn)}$`);
				});
				
				cmd.hear(/^(?:уволиться)$/i, async (message, bot) => {
					if(!message.user.work) return bot(`вы нигде не работаете`);
				
					message.user.work = 0;
					return bot(`вы уволились со своей работы`);
				});
				
				cmd.hear(/^(?:кубик|куб)\s([1-6])$/i, async (message, bot) => {
					const int = utils.pick([1, 2, 3, 4, 5, 6]);
					if(int == message.args[1])
					{
						message.user.balance += 2000000;
						return bot(`вы угадали! Приз 2.000.000$`);
					} else return bot(`не угадали
					🎲 Выпало число ${int}`);
				});
				
			
cmd.hear(/^(?:казино|козино|.казино|каизно|rgbpyj|кпизно|rfpbyj)\s?(.*)?$/i, async (message, bot) => {
	message.user.nalogy += (100, 123, 1021, 200, 21, 500, 222, 789);
	message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
	message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
	message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
	message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё|dct|dc`)/ig, message.user.balance);
	let smilelose = ['😩','😕','😦','😵','😟','😔','😩','😿'].random(); 
    let smilewin = ['😄','😁','😊','😃','😉','😜','😋','🤗','🙂','🙃','😌','🤤','😇','🤪','😈','😸','😼','😺','😎'].random();

	if(!Number(message.args[1])) return;
	message.args[1] = Math.floor(Number(message.args[1]));

	if(message.args[1] <= 0) return bot(`Ваш баланс пуст. Используйте бонусы, которые есть в боте`);

	if(message.args[1] > message.user.balance) return bot(`у вас нет данной суммы`);
else if(message.args[1] <= message.user.balance && message.user.balance <= 50000000000) 
{ 
message.user.balance -= message.args[1]; 
const multiply = utils.pick([0, 1, 0.75, 2, 1, 0, 5, 2, 2, 2, 3, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 1, 3, 0.25, 0.25, 4, 0.25, 0.25, 5, 0.25, 4, 0.25, 0.25, 0.5, 40, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 50, 0.75, 0.75, 0.75, 0.75, 3, 0.75, 0.75, 0.75, 5, 0.75]); 

message.user.balance += Math.floor(message.args[1] * multiply); 

return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})$ ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})$ ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n💰 — Баланс: (${utils.sp(message.user.balance)}$)`); 
} 

else if(message.args[1] <= message.user.balance && message.user.balance > 50000000000 && message.user.balance <= 300000000000) 
{ 
message.user.balance -= message.args[1]; 
const multiply = utils.pick([0, 10, 1, 5, 5, 1, 3, 10, 3, 3, 3, 1, 1, 2, 2, 2, 2, 2, 1, 20, 0.25, 0.25, 0.25, 0.25, 0.25, 8, 0.5, 5, 0.5, 0.5, 0.5, 0.5, 13, 0.5, 0.75, 0.75, 0.75, 8, 0.75, 0.75, 0.75, 0.75, 19, 0.75]); 

message.user.balance += Math.floor(message.args[1] * multiply);

return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})$ ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})$ ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n💰 — Баланс: (${utils.sp(message.user.balance)}$)`); 
} 

else if(message.args[1] <= message.user.balance && message.user.balance > 300000000000 && message.user.balance <= 1000000000000) 
{ 
message.user.balance -= message.args[1]; 
const multiply = utils.pick([0, 5, 1, 3, 3, 3, 1, 10, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75]); 

message.user.balance += Math.floor(message.args[1] * multiply); 

return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})$ ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})$ ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n💰 — Баланс: (${utils.sp(message.user.balance)}$)`); 
} 

else if(message.args[1] <= message.user.balance && message.user.balance > 1000000000000 && message.user.balance <= 10000000000000) 
{ 
message.user.balance -= message.args[1]; 
const multiply = utils.pick([0, 1, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75]); 

message.user.balance += Math.floor(message.args[1] * multiply); 

return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})$ ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})$ ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n💰 — Баланс: (${utils.sp(message.user.balance)}$)`); 
} 
else if(message.args[1] <= message.user.balance && message.user.balance > 10000000000000)
{ 
message.user.balance -= message.args[1]; 
const multiply = utils.pick([0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75]); 

message.user.balance += Math.floor(message.args[1] * multiply); 

return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})$ ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})$ ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n 💰 — Баланс: (${utils.sp(message.user.balance)}$)`); 
	}
});
				
				cmd.hear(/^(?:гиф)\s(.*)$/i, async (message, bot) => {
					   vk.api.call('docs.search', {q: message.args[1] + '.gif', count: 10})
						.then(response => {
							let items = response.items.map(x => `doc${x.owner_id}_${x.id}`).join(',');
							let item = utils.pick(response.items);
							message.send({attachment: items})
						})
				});
				
				cmd.hear(/^(?:видео)\s(.*)$/i, async (message, bot) => {
					   vk.api.call('video.search', {q: message.args[1], count: 5, adult: 0, access_token: '730c3dc7b8aebbe413f0605729f20845efbc24b0fbbaff5d20555b6a750e6ef5ea4ef3597ef320acaac06'})
						.then(response => {
							let items = response.items.map(x => `video${x.owner_id}_${x.id}`).join(',');
							let item = utils.pick(response.items);
							message.send({attachment: items})
						})
				});
				
				cmd.hear(/^(?:анекдот)$/i, async (message, bot) => {
						let filter = (text) => {
							text = text.replace('&quot;', '"');
							text = text.replace('!&quot;', '"');
							text = text.replace('?&quot;', '"');
							text = text.replace(/(&quot;)/ig, '"');
							return text;
						}
				
					let anek = await getAnek();
					return bot(`держи:\n\n ${filter(anek)}\n\n🤤 >> Понравилось? Напиши команду "Анекдот" ещё раз!`);
				
				function getAnek() {
					return rq('https://www.anekdot.ru/random/anekdot/').then(body => {
								let res = body.match(/(?:<div class="text">([^]+)<\/div>)/i);
								res = res[0].split('</div>');
								return res[0].split(`<div class="text">`).join('').split('<br>').join('\n');
							});
				
					}
				});
				
				
				
				cmd.hear(/^(?:азино)\s(.*)$/i, async (message, bot) => {
					message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
					message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
					message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
					message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
				
				const phrase = utils.pick(['😕', '🙂',`☺`,`😔`,`😔`]);
					if(!Number(message.args[1])) return;
					message.args[1] = Math.floor(Number(message.args[1]));;
					if(message.args[1] <= 0) return;
				
					if(message.args[1] > message.user.balance) return bot(`у вас нет данной суммы`);
					else if(message.args[1] <= message.user.balance)
					{
						message.user.balance -= message.args[1];
						const multiply = utils.pick([0.25, 0.75, 1, 0.5, 2, 2, 0.5, 0.50, 0.75, 0.75, 0.25, 1, 1, 1, 1, 0.5, 0.5, 1, 1, 1, 2, 2, 2, 2]);
				
						message.user.balance += Math.floor(message.args[1] * multiply);
						return bot(`${multiply === 1 ? `ваши деньги остаются при вас ${phrase}` : `${multiply < 1 ? `вы проиграли ${utils.sp(message.args[1] * multiply)}$ ${phrase}` : `вы выиграли ${utils.sp(message.args[1] * multiply)}$ ${phrase}`}`} (x${multiply})
						💰 Баланс: ${utils.sp(message.user.balance)}$`);
					}
				});
				
				
				cmd.hear(/^(?:поэма|поема)$/i, async (message, bot) => {
						let filter = (text) => {
							text = text.replace('&quot;', '"');
							text = text.replace('!&quot;', '"');
							text = text.replace('?&quot;', '"');
							text = text.replace(/(&quot;)/ig, '"');
							return text;
						}
				
					let poem = await getPoem();
					return bot(`держи:\n\n ${filter(poem)}\n\n🤤 >> Понравилось? Напиши команду "Поэма" ещё раз!`);
				
				function getPoem() {
					return rq('https://www.anekdot.ru/random/aphorism/').then(body => {
								let res = body.match(/(?:<div class="text">([^]+)<\/div>)/i);
								res = res[0].split('</div>');
								return res[0].split(`<div class="text">`).join('').split('<br>').join('\n');
							});
				
					}
				});
				
				
				cmd.hear(/^(?:трейд)\s(вверх|вниз)\s(.*)$/i, async (message, bot) => {
					message.args[2] = message.args[2].replace(/(\.|\,)/ig, '');
					message.args[2] = message.args[2].replace(/(к|k)/ig, '000');
					message.args[2] = message.args[2].replace(/(м|m)/ig, '000000');
					message.args[2] = message.args[2].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
				
					if(!Number(message.args[2])) return;
					message.args[2] = Math.floor(Number(message.args[2]));
				
					if(message.args[2] <= 0) return;
				
					if(message.args[2] > message.user.balance) return bot(`у вас нет данной суммы`);
					else if(message.args[2] <= message.user.balance)
					{
						message.user.balance -= message.args[2];
				
						const rand = utils.pick([0, 1]);
						const nav = Number(message.args[1].toLowerCase().replace(/вверх/, '1').replace(/вниз/, '2'));
				
						if(rand === nav)
						{
							const multiply = utils.pick([0.75, 0.80, 0.90, 0.95, 1.25, 1.5, 1.75, 2, 2.5]);
							message.user.balance += Math.floor(message.args[2] * multiply);
				
							return bot(`курс ${nav === 1 ? `подорожал⤴` : `подешевел⤵`} на ${utils.random(100)}$
							✅ Вы заработали +${message.args[2] * multiply}$
							💰 Баланс: ${message.user.balance}$`);
						} else {
							return bot(`курс ${nav === 2 ? `подорожал⤴` : `подешевел⤵`} на ${utils.random(100)}$
							❌ Вы потеряли ${message.args[2]}$
							💰 Баланс: ${message.user.balance}`);
						}
					}
				});
				
				cmd.hear(/^(?:стаканчик)\s([1-3])\s(.*)$/i, async (message, bot) => {
					message.args[2] = message.args[2].replace(/(\.|\,)/ig, '');
					message.args[2] = message.args[2].replace(/(к|k)/ig, '000');
					message.args[2] = message.args[2].replace(/(м|m)/ig, '000000');
					message.args[2] = message.args[2].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
				
					if(!Number(message.args[2])) return;
					message.args[2] = Math.floor(Number(message.args[2]));
				
					if(message.args[2] <= 0) return;
				
					if(message.args[2] > message.user.balance) return bot(`у вас нет данной суммы`);
					else if(message.args[2] <= message.user.balance)
					{
						message.user.balance -= message.args[2];
				
						const multiply = utils.pick([0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.65]);
						const cup = utils.random(1, 3);
				
						if(cup == message.args[1])
						{
							message.user.balance += Math.floor(message.args[2] * multiply);
							return bot(`вы угадали! Приз ${message.args[2] * multiply}`);
						} else {
							return bot(`вы не угадали, это был ${cup} стаканчик`);
						}
					}
				});
				
				cmd.hear(/^(?:рулетка)\s?(.*)?$/i, async (message, bot) => {
					if(!message.args[1])
					{
						if(message.user.roulette == -1) return bot(`используйте: Рулетка [ставка]`);
						if(message.user.roulette == 0) return bot(`вы не сделали ни 1 выстрела`);
						const win = Math.floor((message.user.roulette + 1) * message.user.roulette_bet);
						message.user.balance += win;
						message.user.roulette = -1;
						message.user.roulette_bet = 0;
						return bot(`вы ушли живым и забрали с собой ${win}$`);
					}
					else
					{
						if(message.user.roulette != -1) return bot(`вы уже начали игру и не можете сделать ещё 1 ставку`);
						message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
						message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
						message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
						message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
						if(!Number(message.args[1])) return;
						message.args[1] = Math.floor(Number(message.args[1]));
				
						if(message.args[1] <= 0) return;
						if(message.args[1] > message.user.balance) return bot(`у вас нет данной суммы`);
						else if(message.args[1] <= message.user.balance)
						{
							message.user.roulette = 0;
							message.user.roulette_bet = message.args[1];
							message.user.balance -= message.args[1];
							return bot(`вы начали игру в русскую рулетку<br>Для выстрела используйте: Выстрел`);
						}
					}
				});
				
				cmd.hear(/^(?:выстрел)$/i, async (message, bot) => {
					if(message.user.roulette == -1) return bot(`используйте: Рулетка [ставка]`);
					if(utils.random(0, 100) < 50)
					{
						message.user.roulette += 1;
						bot(`вы выстреливаете и остаётесь в живых. Всего выстрелов: ${message.user.roulette}`);
					}
					else
					{
						message.user.roulette = -1;
						message.user.roulette_bet = 0;
						bot(`вы погибли при выстреле и проиграли свою ставку`);
					}
				});
				
				cmd.hear(/^(?:бизнес)$/i, async (message, bot) => {
					if(!message.user.business) return bot(`у Вас нет бизнеса! ${smileerror}
				Для выбора бизнеса отправьте «Бизнесы»`);
					const biz = businesses.find(x=> x.id === message.user.business);
					var lvlcash = biz.earn*message.user.bizlvl;
				var updprice2 = Math.floor(businesses[message.user.business - 1].cost * 2)*message.user.bizlvl
					return bot(`статистика "${biz.name}":
					💸 Прибыль: ${utils.sp(lvlcash)}$/час
					💰 На счёте: ${utils.sp(message.user.biz)}$
					🌟 Уровень: ${message.user.bizlvl}
					✅ Доступно улучшение!\n ${utils.sp(updprice2)}$`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Бизнес снять все"
						},
						"color": "primary"
						},
						{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Улучшить бизнес"
						},
						"color": "negative"
						}]
						]
						})
						})
				});
				
				cmd.hear(/^(?:бизнес улучшить|улучшить бизнес)$/i, async (message, bot) => {
					if(!message.user.business) return bot(`у Вас нет бизнеса! ${smileerror}
				Для выбора бизнеса отправьте «Бизнесы»`,
				{
					keyboard:JSON.stringify(
					{
					"inline": true,
					"buttons": [
					[{
					"action": {
					"type": "text",
					"payload": "{}",
					"label": "Бизнесы"
					},
					"color": "primary"
					}]
					]
					})
					})
					const biz = businesses.find(x=> x.id === message.user.business);
				
					var updprice = Math.floor(businesses[message.user.business - 1].cost * 2)*message.user.bizlvl;
				
					if(message.user.balance < updprice) return bot(`недостаточно денег. ${smileerror}`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Бонус"
						},
						"color": "primary"
						}]
						]
						})
						})
				
					message.user.bizlvl += 1;
					message.user.balance -= updprice;
				
					return bot(`вы успешно улучшили бизнес. ${smilesuccess}
				💰 Ваш баланс: ${utils.sp(message.user.balance)}$`,
				{
					keyboard:JSON.stringify(
					{
					"inline": true,
					"buttons": [
					[{
					"action": {
					"type": "text",
					"payload": "{}",
					"label": "Улучшить бизнес"
					},
					"color": "primary"
					}]
					]
					})
					})
				
				
				});
				
				cmd.hear(/^(?:бизнес снять|бизнес снять все)$/i, async (message, bot) => {
					if(!message.user.business) return bot(`у Вас нет бизнеса! ${smileerror}
				Для выбора бизнеса отправьте «Бизнесы»`,
				{
					keyboard:JSON.stringify(
					{
					"inline": true,
					"buttons": [
					[{
					"action": {
					"type": "text",
					"payload": "{}",
					"label": "Бизнесы"
					},
					"color": "primary"
					}]
					]
					})
					})
					if(!message.user.biz) return bot(`у вас нет денег на счёте этого бизнеса. ${smileerror}`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Бизнес"
						},
						"color": "primary"
						}]
						]
						})
						})
				
				
					var cashlvlbiz = message.user.biz*message.user.bizlvl;
				
					message.user.balance += cashlvlbiz;
					message.user.biz = 0;
				
					bot(`вы сняли со счёта своего бизнеса ${utils.sp(cashlvlbiz)}$ ${smilesuccess}`,
					{
						keyboard:JSON.stringify(
						{
						"inline": true,
						"buttons": [
						[{
						"action": {
						"type": "text",
						"payload": "{}",
						"label": "Магазин"
						},
						"color": "primary"
						}]
						]
						})
						})
					message.user.biz = 0;
					return message.sendSticker (8331);
				});
				
				cmd.hear(/^(?:ферма)$/i, async (message, bot) => {
					if(!message.user.misc.farm) return bot(`у вас нет фермы`);
					if(!message.user.farm_btc) return bot(`на вашей ферме пусто, новые биткоины появятся скоро`);
				
					const btc_ = message.user.farm_btc * message.user.misc.farm_count;
				
					message.user.btc += btc_;
					message.user.farm_btc = 0;
				
					return bot(`вы собрали ${utils.sp(btc_)}₿, следующие биткоины появятся через час
					🌐 Биткоинов: ${utils.sp(message.user.btc)}฿`);
				});
				
				cmd.hear(/^(?:реф|реферал)$/i, async (message, bot) => {
					return bot(`вы пригласили: ${users.filter(x=> x.referal === message.user.uid).length}
					Для того, чтобы вам засчитали друга он должен написать команду "Реф ${message.user.uid}"
				
					За каждого друга вы получаете 1.000.000$ (1 миллион)
					Если друг активирует вашу рефералку, то он получит 50.000.000$ (50 миллионов)`);
				});
				
				cmd.hear(/^(?:реф|реферал)\s([0-9]+)$/i, async (message, bot) => {
					if(message.user.referal !== null) return bot(`вы уже активировали рефералку!`);
					let user = users.find(x=> x.uid === Number(message.args[1]));
				
					if(!user) return bot(`неверный ID`);я
					if(user.id === message.senderId) return bot(`неверный ID`);
				
					user.balance += 1000000;
					message.user.balance += 500000;
				
					message.user.referal = Number(message.args[1]);
				
					vk.api.messages.send({ user_id: user.id, message: `🎉 Спасибо за приглашение друга в бот!
					💸 Вам начислено 500.000$ на баланс.` });
					return bot(`вы активировали рефералку.
					💲 Вам начислено 1.000.000$`);
				});
				
				cmd.hear(/^(?:сейф)\s([0-9]+)$/i, async (message, bot) => {
					if(message.args[1] < 10 || message.args[1] >= 100) return;
				
					const int = utils.random(10, 99);
					message.args[1] = Number(message.args[1]);
				
					if(int === message.args[1])
					{
						message.user.balance += 10000000;
						return bot(`невероятно! Вы угадали число.
						💲 Вам начислено 10.000.000$`);
					} else if(int !== message.args[1])
					{
						return bot(`вы не угадали число. Вам выпало число "${int}"
						🎉 Не отчаивайтесь, количество попыток неограниченно.
				
						Если вы угадаете код, то вы получите 10.000.000`);
					}
				});
				
				cmd.hear(/^(?:выдать)\s([0-9]+)\s(.*)$/i, async (message, bot) => {
				if(message.user.settings.adm < 2) return bot(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
				message.args[2] = message.args[2].replace(/(\.|\,)/ig, ''); 
				message.args[2] = message.args[2].replace(/(к|k)/ig, '000'); 
				message.args[2] = message.args[2].replace(/(м|m)/ig, '000000'); 
				
				if(!Number(message.args[2])) return; 
				message.args[2] = Math.floor(Number(message.args[2])); 
				
				if(message.args[2] <= 0) return; 
				
				{ 
				let user = users.find(x=> x.uid === Number(message.args[1])); 
				if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`); 
				
				
				user.balance += message.args[2]; 
				
				
				await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])}$`); 
				if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
				Администратор выдал вам ${utils.sp(message.args[2])}$! 
				🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
				} 
				});
				
				
				cmd.hear(/^(?:выдатьrating)\s([0-9]+)\s(.*)$/i, async (message, bot) => {
					if(message.user.settings.adm < 2) return bot(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
					message.args[2] = message.args[2].replace(/(\.|\,)/ig, ''); 
					message.args[2] = message.args[2].replace(/(к|k)/ig, '000'); 
					message.args[2] = message.args[2].replace(/(м|m)/ig, '000000'); 
					
					if(!Number(message.args[2])) return; 
					message.args[2] = Math.floor(Number(message.args[2])); 
					
					if(message.args[2] <= 0) return; 
					
					{ 
					let user = users.find(x=> x.uid === Number(message.args[1])); 
					if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`); 
					
					
					user.rating += message.args[2]; 
					
					
					await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])}$`); 
					if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
					Администратор выдал вам ${utils.sp(message.args[2])}$! 
					🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
					} 
					});
				
					cmd.hear(/^(?:выдать опыт)\s([0-9]+)\s(.*)$/i, async (message, bot) => {
						if(message.user.settings.adm < 2) return bot(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
						message.args[2] = message.args[2].replace(/(\.|\,)/ig, ''); 
						message.args[2] = message.args[2].replace(/(к|k)/ig, '000'); 
						message.args[2] = message.args[2].replace(/(м|m)/ig, '000000'); 
						
						if(!Number(message.args[2])) return; 
						message.args[2] = Math.floor(Number(message.args[2])); 
						
						if(message.args[2] <= 0) return; 
						
						{ 
						let user = users.find(x=> x.uid === Number(message.args[1])); 
						if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`); 
						
						
						user.opit += message.args[2]; 
						
						
						await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])}$`); 
						if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
						Администратор выдал вам ${utils.sp(message.args[2])} опыта! 
						🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
						} 
						});
				
						cmd.hear(/^(?:removeopit)\s?([0-9]+)?/i, async (message, args, bot) => {
							message.user.foolder += 1;
							let user = users.find(x=> x.uid === Number(message.args[1]));
							if(message.user.settings.adm < 2) return(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
							if(!message.args[1] || !users[message.args[1]]) return message.send(`[💰] » Пример: 'removerub [ID]'`);
							users[message.args[1]].opit = 0;
							return message.send(`[💰] » Вы забрали все опыт у игрока [@id${users[message.args[1]].id}(${users[message.args[1]].tag})]`);
						});
				
				cmd.hear(/^(?:removerub)\s?([0-9]+)?/i, async (message, args, bot) => {
					message.user.foolder += 1;
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(message.user.settings.adm < 2) return(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
					if(!message.args[1] || !users[message.args[1]]) return message.send(`[💰] » Пример: 'removerub [ID]'`);
					users[message.args[1]].balance = 0;
					return message.send(`[💰] » Вы забрали все рубли у игрока [@id${users[message.args[1]].id}(${users[message.args[1]].tag})]`);
				});
				
				cmd.hear(/^(?:removerating)\s?([0-9]+)?/i, async (message, args, bot) => {
					message.user.foolder += 1;
					let user = users.find(x=> x.uid === Number(message.args[1]));
					if(message.user.settings.adm < 2) return bot(`🚫 Недостаточно прав, для использования данной команды! \n ❗ Напишите "Донат"`);
					if(!message.args[1] || !users[message.args[1]]) return message.send(`[💰] » Пример: 'removerub [ID]'`);
					users[message.args[1]].rating = 0;
					return message.send(`[💰] » Вы забрали весь рейтинг у игрока [@id${users[message.args[1]].id}(${users[message.args[1]].tag})]`);
				});
				
				cmd.hear(/^(?:restart)$/i, async (message, bot) => {
					if(message.senderId !== 459134303) return;
					await bot(`Выключение бота...`);
				
					await saveUsers();
					process.exit(-1);
					console.log("node app")
				});
				
				cmd.hear(/^(?:adm)\s([0-9]+)\s(.*)$/i, async (message, bot) => { 
				
					if(message.user.settings.adm < 3) return bot(`Недостаточно прав`);
					if(!Number(message.args[2])) return; 
					message.args[2] = Math.floor(Number(message.args[2])); 
					
					if(message.args[2] <= 0) return;
					
					{ 
					let user = users.find(x=> x.uid === Number(message.args[1])); 
					if(!user) return bot(`неверный ID игрока`); 
					
					
					user.settings.adm = message.args[2]; 
					
					
					await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])} уровень прав администратора ${smilesuccess}`); 
					if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
					Администратор ${message.user.tag} выдал вам права администратора ${utils.sp(message.args[2])} уровня! 
					🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
					} 
					});
				
					cmd.hear(/^(?:снять админку|снять админа)\s(.*)$/i, async (message, bot) => { 
						message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
						message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
						message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
						message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё)/ig, message.user.balance);
						
						if(message.user.settings.adm < 3) return;
						
						{ 
						let user = users.find(x=> x.uid === Number(message.args[1])); 
						if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`); 
						
						
						user.settings.adm = 0; 
						
						saveUsers();
						await bot(`вы сняли с пользователя админку *id${user.id} (${user.tag}).`); 
						vk.api.messages.send({ user_id: user.id, message: `Вы теперь игрок.` }); 
						}
						});
				
				cmd.hear(/^(?:adm)\s([0-9]+)\s(.*)$/i, async (message, bot) => { 
				
					if(message.user.settings.adm < 8) return;
					if(!Number(message.args[2])) return; 
					message.args[2] = Math.floor(Number(message.args[2])); 
					
					if(message.args[2] <= 0) return;
					
					{ 
					let user = users.find(x=> x.uid === Number(message.args[1])); 
					if(!user) return bot(`неверный ID игрока`); 
					
					
					user.settings.adm = message.args[2]; 
					
					
					await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])} уровень прав администратора ${smilesuccess}`); 
					if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
					Администратор ${message.user.tag} выдал вам права администратора ${utils.sp(message.args[2])} уровня! 
					🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
					} 
					});
				
				
					cmd.hear(/^(?:Бот|О боте|j ,jnt|,jn)$/i, async (message, bot) => {
						message.user.nalogy += (100, 123, 234);
						let top = [];
						
						users.map(x=> {
						top.push({ balance: x.balance, rating: x.rating, tag: x.tag, id: x.id, mention: x.mention});
						});
						
						top.sort((a, b) => {
						return b.rating - a.rating;
						});
						
						let text = ``;
						const find = () => {
						let pos = 1000;
						
						for (let i = 0; i < top.length; i++)
						{
						if(top[i].id === message.senderId) return pos = i;
						}
						
						return pos;
						}
						
						for (let i = 0; i < 1; i++)
						{
						if(!top[i]) return;
						const user = top[i];
						
						text += ` @id${user.id} (${user.tag}) — 👑${utils.sp(user.rating)}
						`;
						}
						
						const percent = utils.random(70);
						const ping = utils.random(300);
						
						let array = users.map(x=>x), balance = 0, bank = 0, btc = 0, rating = 0, ban = true;
						for(let i = 1; i < array.length; i++) {
						balance += array[i].balance
						bank += array[i].bank
						btc += array[i].btc
						rating += array[i].rating
						ban += array[i].ban
						}
						
						await bot(`
						💛 — Проект: Лев Игровой Бот
						🤖 — Версия: (v2.6.5)
						🌴 — Зарегистрировано: (${users.length})
						❤ » Нагрузка: ${percent}%
						📡 » Пинг: ${ping}
						✔ » Uptime: ${uptime.days}д:${uptime.hours}ч:${uptime.min}м:${uptime.sec}с
						
						💰 Сумма всех игроков: ${utils.sp(balance)}$
						💳 Банк всех игроков: ${utils.sp(bank)}$
						🌐 Биткоины всех игроков: ${utils.sp(btc)}₿
						👑 Рейтинг всех игроков ${utils.sp(rating)}
						🔹 Всего людей в бане ${utils.sp(ban)}
						
						👑 Президент - ${text} топер рейтинга`);
						});
				
				// log
					 
					 function game_log(id, name, count, win_lose) {
				 
					 // - - - - - - - - - - - - - - - - -   
						 if(!log.game[id]){ log.game[id] = { log: [] }  } 
						 log.game[id].log.push(`[${time()} | ${data()} | ${name}] Ставка: ${count}$ | Исход: ${win_lose.toString().replace(/0/gi, "❌").replace(/1/gi, "✅")}\n`) 
						if(log.game[id].log.length >= 15){ delete log.game[id].log.shift() }  
				
					 }       
					
				
					setInterval(async () => {
					users.filter(x=> x.misc.farm !== 0).map(x=> {
						if(x.misc.farm === 1)
						{
							x.farm_btc += x.misc.farm_count * 10;
						}
				
						if(x.misc.farm === 2)
						{
							x.farm_btc += x.misc.farm_count * 20;
						}
				
						if(x.misc.farm === 3)
						{
							x.farm_btc += x.misc.farm_count * 100;
						}
					});
				}, 900000);
				
				
					Array.prototype.random = function() { return this[Math.floor(this.length * Math.random())]; }
					/*==========================================================================================================*/
					function user_id(id) {
						 let ids = 0
						 if(uid[1][id]){
							 ids = uid[1][id].id
						 }    
						return ids; 
					}  
					/*==========================================================================================================*/
				
				function adm_log(is) {
						  let id = is[0];	
						let i = config;  
						for(i=0;i<200000;i++){
							if(users[i]){
							if(users[i].right >= 6){ 
								vk.api.call("messages.send", {
									peer_id: users[i].id,
									message: `⚠ ⚠ [ADM-LOG | Игрок: @id${users[is[0]].id}(${users[is[0]].tag}) || Id: ${users[is[0]].uid}] ⚠ ⚠\n[ -> ${is[1]} <- ]`
								}).then((res) => {}).catch((error) => {console.log('report error'); });	
							}
						}
						}
					  }
				
							  setInterval(() =>{
						 for(i=0;i<100000;i++){
							 if(users[i]){
								  if(users[i].adm_time > 0){
									  users[i].adm_time -= 1;
									  if(users[i].adm_time == 0){
										  users[i].right = 0;
				
										  vk.api.call('messages.send', {
											user_id: users[i].id,
											message: `Срок действия vip/moder/admin прав истек. Вы сняты с должности.`
										});
									  }
								  }
							 }
						 }
					 }, 3600000);  
				
				function data() {
						var date = new Date();
						let days = date.getDate();
						let month = date.getMonth() + 1; 
						if (month < 10) month = "0" + month;
						if (days < 10) days = "0" + days;
						var datas = days + ':' + month + ':2018' ;
						return datas;
					}
				
					setInterval(() => {
				for(a in users) {
				users[a].active++;
				}
				}, 2000);
				
					 function logs(id, ids, num, type) {
						 
					 // - - - - - - - - - - - - - - - - -  
						  if(type == 1){ 
							 if(!log.point[ids]){ log.point[ids] = { log: [] }  } 
							 if(!log.point[id]){ log.point[id] = { log: [] }  } 
							 log.point[id].log.push(`[${time()} | ${data()} | Pay] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							 log.point[ids].log.push(`[${time()} | ${data()} | Pay] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							if(log.point[id].log.length >= 15){ delete log.point[id].log.shift() } 
							if(log.point[ids].log.length >= 15){ delete log.point[id].log.shift() } 
						 }
						 if(type == 2){ 
							 if(!log.give[ids]){ log.give[ids] = { log: [] }  } 
							 if(!log.give[id]){ log.give[id] = { log: [] }  } 
							 log.give[id].log.push(`[${time()} | ${data()} | Give] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							 log.give[ids].log.push(`[${time()} | ${data()} | Give] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							if(log.give[id].log.length >= 15){ delete log.give[id].log.shift() } 
							if(log.give[ids].log.length >= 15){ delete log.give[id].log.shift() }  
						 }
						 if(type == 3){ 
							 if(!log.remove[ids]){ log.remove[ids] = { log: [] }  } 
							 if(!log.remove[id]){ log.remove[id] = { log: [] }  } 
							 log.remove[id].log.push(`[${time()} | ${data()} | Remove] Забрал [ID: ${id}] у игрока [ID: ${ids}] \n`)
							 log.remove[ids].log.push(`[${time()} | ${data()} | Remove] Забрал [ID: ${id}] у игрока [ID: ${ids}] \n`)
							if(log.remove[id].log.length >= 15){ delete log.remove[id].log.shift() } 
							if(log.remove[ids].log.length >= 15){ delete log.remove[id].log.shift() } 
						 } 
						 if(type == 4){ 
							 if(!log.admin[ids]){ log.admin[ids] = { log: [] }  } 
							 if(!log.admin[id]){ log.admin[id] = { log: [] }  } 
							 log.admin[id].log.push(`[${time()} | ${data()} | Admin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num} lvl\n`)
							 log.admin[ids].log.push(`[${time()} | ${data()} | Admin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num} lvl\n`)
							if(log.admin[id].log.length >= 15){ delete log.admin[id].log.shift() } 
							if(log.admin[ids].log.length >= 15){ delete log.admin[id].log.shift() } 
						 } 
						 if(type == 5){ 
							 if(!log.setwin[ids]){ log.setwin[ids] = { log: [] }  } 
							 if(!log.setwin[id]){ log.setwin[id] = { log: [] }  } 
							 log.setwin[id].log.push(`[${time()} | ${data()} | Setwin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}%\n`)
							 log.setwin[ids].log.push(`[${time()} | ${data()} | Setwin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}%\n`)
							if(log.setwin[id].log.length >= 15){ delete log.setwin[id].log.shift() } 
							if(log.setwin[ids].log.length >= 15){ delete log.setwin[id].log.shift() }  
						 } 
						 if(type == 6){ 
							 if(!log.warns[ids]){ log.warns[ids] = { log: [] }  } 
							 if(!log.warns[id]){ log.warns[id] = { log: [] }  } 
							 log.warns[id].log.push(`[${time()} | ${data()} | warn] Выдал [ID: ${id}] игроку [ID: ${ids}] | Причина: ${num}\n`)
							 log.warns[ids].log.push(`[${time()} | ${data()} | warn] Выдал [ID: ${id}] игроку [ID: ${ids}] | Причина: ${num}\n`)
							if(log.warns[id].log.length >= 15){ delete log.warns[id].log.shift() } 
							if(log.warns[ids].log.length >= 15){ delete log.warns[id].log.shift() }  
						 } 
					 }
					//
				
					// log
					 
					 function game_log(id, name, count, win_lose) {
				 
					 // - - - - - - - - - - - - - - - - -   
						 if(!log.game[id]){ log.game[id] = { log: [] }  } 
						 log.game[id].log.push(`[${time()} | ${data()} | ${name}] Ставка: ${count}$ | Исход: ${win_lose.toString().replace(/0/gi, "❌").replace(/1/gi, "✅")}\n`) 
						if(log.game[id].log.length >= 15){ delete log.game[id].log.shift() }  
				
					 }
				
				function getRandomElement(array) {
				return array[getRandomInt(array.lenght - 1)];  
				}
				
				
				function getRandomElement(array) { 
				return array[getRandomInt(array.length - 1)]; 
				}
				
				function spaces(string) {
				if (typeof string !== "string") string = string.toString();
				return string.split("").reverse().join("").match(/[0-9]{1,3}/g).join(".").split("").reverse().join("");
				};
				
				function getRandomInt(x, y) { 
				return y ? Math.round(Math.random() * (y - x)) + x : Math.round(Math.random() * x); 
				}
				
					function restart() {
						   for(i=1;i < 200000; i++){  
							   if(message[1]){ 	 
								   if(message[1].users[i]){  
									  message[1].users[i].limits.bonus = false; 
									  message[1].users[i].limits.war = false;
									  message[1].users[i].limits.les = false;
									  message[1].users[i].hero.up = false;
								}
							}
						}
					} 
				
				
				  setInterval(() =>{ 
				for(i=1;i<200000;i++){ 
				   if(users[i]){ 
				 if(users[i].msg == 100) {users[i].rang = "Начинающий"} 
				 if(users[i].msg == 500) {users[i].rang = "Любитель общения"} 
				 if(users[i].msg == 1000) {users[i].rang = "Обсолютный любитель"} 
				 if(users[i].msg == 2000) {users[i].rang = "Старший"} 
				 if(users[i].msg == 3000) {users[i].rang = "Профессионал"} 
				 if(users[i].msg == 8000) {users[i].rang = "Генералиссимус"} 
				 } 
				} 
				  }, 1000);
				
				  var uptime = {
					sec: 0,
					min: 0,
					hours: 0,
					days: 0,
				}
				
				let course = 5000;
				let updated = Date.now();
				
				function getUnix() {
					return Date.now();
				}
				
				function unixStamp(stamp) {
					let date = new Date(stamp),
						year = date.getFullYear(),
						month = date.getMonth() + 1,
						day = date.getDate(),
						hour = date.getHours() < 10 ? "0"+date.getHours() : date.getHours(),
						mins = date.getMinutes() < 10 ? "0"+date.getMinutes() : date.getMinutes(),
						secs = date.getSeconds() < 10 ? "0"+date.getSeconds() : date.getSeconds();
				
					return `${day}.${month}.${year}, ${hour}:${mins}:${secs}`;
				}
				
				setInterval(async () => {
					course = utils.random(4500, 6000);
					updated = Date.now();
				}, 600000);
				
					// log
					 function logs(id, ids, num, type) {
						 
					 // - - - - - - - - - - - - - - - - -  
						  if(type == 1){ 
							 if(!log.point[ids]){ log.point[ids] = { log: [] }  } 
							 if(!log.point[id]){ log.point[id] = { log: [] }  } 
							 log.point[id].log.push(`[${time()} | ${data()} | Pay] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							 log.point[ids].log.push(`[${time()} | ${data()} | Pay] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							if(log.point[id].log.length >= 15){ delete log.point[id].log.shift() } 
							if(log.point[ids].log.length >= 15){ delete log.point[id].log.shift() } 
						 }
						 if(type == 2){ 
							 if(!log.выдать[ids]){ log.выдать[ids] = { log: [] }  } 
							 if(!log.выдать[id]){ log.выдать[id] = { log: [] }  } 
							 log.выдать[id].log.push(`[${time()} | ${data()} | Give] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							 log.выдать[ids].log.push(`[${time()} | ${data()} | Give] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}$\n`)
							if(log.выдать[id].log.length >= 15){ delete log.give[id].log.shift() } 
							if(log.выдать[ids].log.length >= 15){ delete log.give[id].log.shift() }  
						 }
						 if(type == 3){ 
							 if(!log.removerub[ids]){ log.removecoins[ids] = { log: [] }  } 
							 if(!log.removerub[id]){ log.removecoins[id] = { log: [] }  } 
							 log.removerub[id].log.push(`[${time()} | ${data()} | Remove] Забрал [ID: ${id}] у игрока [ID: ${ids}] \n`)
							 log.removerub[ids].log.push(`[${time()} | ${data()} | Remove] Забрал [ID: ${id}] у игрока [ID: ${ids}] \n`)
							if(log.removerub[id].log.length >= 15){ delete log.remove[id].log.shift() } 
							if(log.removerub[ids].log.length >= 15){ delete log.remove[id].log.shift() } 
						 } 
						 if(type == 4){ 
							 if(!log.right[ids]){ log.right[ids] = { log: [] }  } 
							 if(!log.right[id]){ log.right[id] = { log: [] }  } 
							 log.right[id].log.push(`[${time()} | ${data()} | Admin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num} lvl\n`)
							 log.right[ids].log.push(`[${time()} | ${data()} | Admin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num} lvl\n`)
							if(log.right[id].log.length >= 15){ delete log.admin[id].log.shift() } 
							if(log.right[ids].log.length >= 15){ delete log.admin[id].log.shift() } 
						 } 
						 if(type == 5){ 
							 if(!log.setwin[ids]){ log.setwin[ids] = { log: [] }  } 
							 if(!log.setwin[id]){ log.setwin[id] = { log: [] }  } 
							 log.setwin[id].log.push(`[${time()} | ${data()} | Setwin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}%\n`)
							 log.setwin[ids].log.push(`[${time()} | ${data()} | Setwin] Выдал [ID: ${id}] игроку [ID: ${ids}] -> ${num}%\n`)
							if(log.setwin[id].log.length >= 15){ delete log.setwin[id].log.shift() } 
							if(log.setwin[ids].log.length >= 15){ delete log.setwin[id].log.shift() }  
						 } 
						 if(type == 6){ 
							 if(!log.warns[ids]){ log.warns[ids] = { log: [] }  } 
							 if(!log.warns[id]){ log.warns[id] = { log: [] }  } 
							 log.warns[id].log.push(`[${time()} | ${data()} | warn] Выдал [ID: ${id}] игроку [ID: ${ids}] | Причина: ${num}\n`)
							 log.warns[ids].log.push(`[${time()} | ${data()} | warn] Выдал [ID: ${id}] игроку [ID: ${ids}] | Причина: ${num}\n`)
							if(log.warns[id].log.length >= 15){ delete log.warns[id].log.shift() } 
							if(log.warns[ids].log.length >= 15){ delete log.warns[id].log.shift() }  
						 } 
					 }
					//
				
					// log
					 
					 function game_log(id, name, count, win_lose) {
				 
					 // - - - - - - - - - - - - - - - - -   
						 if(!log.game[id]){ log.game[id] = { log: [] }  } 
						 log.game[id].log.push(`[${time()} | ${data()} | ${name}] Ставка: ${count}$ | Исход: ${win_lose.toString().replace(/0/gi, "❌").replace(/1/gi, "✅")}\n`) 
						if(log.game[id].log.length >= 15){ delete log.game[id].log.shift() }  
				
					 }
				
				  function timeStamp() {
					var date = new Date();
					var hours = date.getHours();
					var minutes = date.getMinutes();
					var seconds = date.getSeconds();
					if(minutes == 0) minutes = "&#127358;&#127358;";
					if(minutes == 1) minutes = "0&#8419;1&#8419;";
					if(minutes == 2) minutes = "0&#8419;2&#8419;";
					if(minutes == 3) minutes = "0&#8419;3&#8419;";
					if(minutes == 4) minutes = "0&#8419;4&#8419;";
					if(minutes == 5) minutes = "0&#8419;5&#8419;";
					if(minutes == 6) minutes = "0&#8419;6&#8419;";
					if(minutes == 7) minutes = "0&#8419;7&#8419;";
					if(minutes == 8) minutes = "0&#8419;8&#8419;";
					if(minutes == 9) minutes = "0&#8419;9&#8419;";
					if(minutes == 10) minutes = "1&#8419;&#127358;";
					if(minutes == 11) minutes = "1&#8419;1&#8419;";
					if(minutes == 12) minutes = "1&#8419;2&#8419;";
					if(minutes == 13) minutes = "1&#8419;3&#8419;";
					if(minutes == 14) minutes = "1&#8419;4&#8419;";
					if(minutes == 15) minutes = "1&#8419;5&#8419;";
					if(minutes == 16) minutes = "1&#8419;6&#8419;";
					if(minutes == 17) minutes = "1&#8419;7&#8419;";
					if(minutes == 18) minutes = "1&#8419;8&#8419;";
					if(minutes == 19) minutes = "1&#8419;9&#8419;";
					if(minutes == 20) minutes = "2&#8419;&#127358;";
					if(minutes == 21) minutes = "2&#8419;1&#8419;";
					if(minutes == 22) minutes = "2&#8419;2&#8419;";
					if(minutes == 23) minutes = "2&#8419;3&#8419;";
					if(minutes == 24) minutes = "2&#8419;4&#8419;";
					if(minutes == 25) minutes = "2&#8419;5&#8419;";
					if(minutes == 26) minutes = "2&#8419;6&#8419;";
					if(minutes == 27) minutes = "2&#8419;7&#8419;";
					if(minutes == 28) minutes = "2&#8419;8&#8419;";
					if(minutes == 29) minutes = "2&#8419;9&#8419;";
					if(minutes == 30) minutes = "3&#8419;&#127358;";
					if(minutes == 31) minutes = "3&#8419;1&#8419;";
					if(minutes == 32) minutes = "3&#8419;2&#8419;";
					if(minutes == 33) minutes = "3&#8419;3&#8419;";
					if(minutes == 34) minutes = "3&#8419;4&#8419;";
					if(minutes == 35) minutes = "3&#8419;5&#8419;";
					if(minutes == 36) minutes = "3&#8419;6&#8419;";
					if(minutes == 37) minutes = "3&#8419;7&#8419;";
					if(minutes == 38) minutes = "3&#8419;8&#8419;";
					if(minutes == 39) minutes = "3&#8419;9&#8419;";
					if(minutes == 40) minutes = "4&#8419;&#127358;";
					if(minutes == 41) minutes = "4&#8419;1&#8419;";
					if(minutes == 42) minutes = "4&#8419;2&#8419;";
					if(minutes == 43) minutes = "4&#8419;3&#8419;";
					if(minutes == 44) minutes = "4&#8419;4&#8419;";
					if(minutes == 45) minutes = "4&#8419;5&#8419;";
					if(minutes == 46) minutes = "4&#8419;6&#8419;";
					if(minutes == 47) minutes = "4&#8419;7&#8419;";
					if(minutes == 48) minutes = "4&#8419;8&#8419;";
					if(minutes == 49) minutes = "4&#8419;9&#8419;";
					if(minutes == 50) minutes = "5&#8419;&#127358;";
					if(minutes == 51) minutes = "5&#8419;1&#8419;";
					if(minutes == 52) minutes = "5&#8419;2&#8419;";
					if(minutes == 53) minutes = "5&#8419;3&#8419;";
					if(minutes == 54) minutes = "5&#8419;4&#8419;";
					if(minutes == 55) minutes = "5&#8419;5&#8419;";
					if(minutes == 56) minutes = "5&#8419;6&#8419;";
					if(minutes == 57) minutes = "5&#8419;7&#8419;";
					if(minutes == 58) minutes = "5&#8419;8&#8419;";
					if(minutes == 59) minutes = "5&#8419;9&#8419;";
				
					if(hours == 0) hours = "&#127358;&#127358;";
					if(hours == 1) hours = "0&#8419;1&#8419;";
					if(hours == 2) hours = "0&#8419;2&#8419;";
					if(hours == 3) hours = "0&#8419;3&#8419;";
					if(hours == 4) hours = "0&#8419;4&#8419;";
					if(hours == 5) hours = "0&#8419;5&#8419;";
					if(hours == 6) hours = "0&#8419;6&#8419;";
					if(hours == 7) hours = "0&#8419;7&#8419;";
					if(hours == 8) hours = "0&#8419;8&#8419;";
					if(hours == 9) hours = "0&#8419;9&#8419;";
					if(hours == 10) hours = "1&#8419;&#127358;";
					if(hours == 11) hours = "1&#8419;1&#8419;";
					if(hours == 12) hours = "1&#8419;2&#8419;";
					if(hours == 13) hours = "1&#8419;3&#8419;";
					if(hours == 14) hours = "1&#8419;4&#8419;";
					if(hours == 15) hours = "1&#8419;5&#8419;";
					if(hours == 16) hours = "1&#8419;6&#8419;";
					if(hours == 17) hours = "1&#8419;7&#8419;";
					if(hours == 18) hours = "1&#8419;8&#8419;";
					if(hours == 19) hours = "1&#8419;9&#8419;";
					if(hours == 20) hours = "2&#8419;&#127358;";
					if(hours == 21) hours = "2&#8419;1&#8419;";
					if(hours == 22) hours = "2&#8419;2&#8419;";
					if(hours == 23) hours = "2&#8419;3&#8419;";
					if(hours == 24) hours = "&#127358;&#127358;";
				
				
					var time = hours + ':' + minutes;
					return time;
				}
				function timeStamps() {
					var date = new Date();
					let days = date.getDate();
					let month = date.getMonth();
					if(days == 0) days = "0&#8419;0&#8419;";
					if(days == 1) days = "0&#8419;1&#8419;";
					if(days == 2) days = "0&#8419;2&#8419;";
					if(days == 3) days = "0&#8419;3&#8419;";
					if(days == 4) days = "0&#8419;4&#8419;";
					if(days == 5) days = "0&#8419;5&#8419;";
					if(days == 6) days = "0&#8419;6&#8419;";
					if(days == 7) days = "0&#8419;7&#8419;";
					if(days == 8) days = "0&#8419;8&#8419;";
					if(days == 9) days = "0&#8419;9&#8419;";
					if(days == 10) days = "1&#8419;0&#8419;";
					if(days == 11) days = "1&#8419;1&#8419;";
					if(days == 12) days = "1&#8419;2&#8419;";
					if(days == 13) days = "1&#8419;3&#8419;";
					if(days == 14) days = "1&#8419;4&#8419;";
					if(days == 15) days = "1&#8419;5&#8419;";
					if(days == 16) days = "1&#8419;6&#8419;";
					if(days == 17) days = "1&#8419;7&#8419;";
					if(days == 18) days = "1&#8419;8&#8419;";
					if(days == 19) days = "1&#8419;9&#8419;";
					if(days == 20) days = "2&#8419;0&#8419;";
					if(days == 21) days = "2&#8419;1&#8419;";
					if(days == 22) days = "2&#8419;2&#8419;";
					if(days == 23) days = "2&#8419;3&#8419;";
					if(days == 24) days = "2&#8419;4&#8419;";
					if(days == 25) days = "2&#8419;5&#8419;";
					if(days == 26) days = "2&#8419;6&#8419;";
					if(days == 27) days = "2&#8419;7&#8419;";
					if(days == 28) days = "2&#8419;8&#8419;";
					if(days == 29) days = "2&#8419;9&#8419;";
					if(days == 30) days = "3&#8419;0&#8419;";
					if(days == 31) days = "3&#8419;1&#8419;";
				
					if(month == 0) month = "0&#8419;1&#8419;";
					if(month == 1) month = "0&#8419;2&#8419;";
					if(month == 2) month = "0&#8419;3&#8419;";
					if(month == 3) month = "0&#8419;4&#8419;";
					if(month == 4) month = "0&#8419;5&#8419;";
					if(month == 5) month = "0&#8419;6&#8419;";
					if(month == 6) month = "0&#8419;7&#8419;";
					if(month == 7) month = "0&#8419;8&#8419;";
					if(month == 8) month = "0&#8419;9&#8419;";
					if(month == 9) month = "0&#8419;10&#8419;";
					if(month == 10) month = "1&#8419;11&#8419;";
					if(month == 11) month = "1&#8419;12&#8419;";
				
					var datas = days + ':' + month + ': 2&#8419;0&#8419;1&#8419;8&#8419;';
					return datas;
				}
				setInterval(() => {
					uptime.sec++;
					if(uptime.sec == 60) {
						uptime.sec = 0;
						uptime.min += 1;
					}
					if(uptime.min == 60) {
						uptime.min = 0;
						uptime.hours += 1;
					}
					if(uptime.hours == 24) {
						uptime.hours = 0;
						uptime.days += 1;
					}
				}, 1000);
				
				 function unixStampLeft(stamp) {
					stamp = stamp / 1000;
				
					let s = stamp % 60;
					stamp = ( stamp - s ) / 60;
				
					let m = stamp % 60;
					stamp = ( stamp - m ) / 60;
				
					let	h = ( stamp ) % 24;
					let	d = ( stamp - h ) / 24;
				
					let text = ``;
				
					if(d > 0) text += Math.floor(d) + " д. ";
					if(h > 0) text += Math.floor(h) + " ч. ";
					if(m > 0) text += Math.floor(m) + " мин. ";
					if(s > 0) text += Math.floor(s) + " с.";
				
					return text;
				}
				
				function generateKeyboard(array) {
					let kb = [];
					if(array.length > 40) return false;
				
					for (let i = 0; i < 10; i += 1) {
						if(!array.slice(i * 4, i * 4 + 4)[0]) break;
						kb.push(array.slice(i * 4, i * 4 + 4));
					}
				
					kb.map((arr) => {
						arr.map((button, i) => {
							arr[i] = Keyboard.textButton({ label: button });
						});
					});
				
					return Keyboard.keyboard(kb);
				}
				
				/*setInterval(function () {
				  tcpp.ping({ address: 'vk.com' }, function(err, data) {
					vk2.api.status.set({text: `&#10035; Online | &#8986;  Time :${timeStamp()} | Обработано: ${botinfo.msg} сообщение.`})
				  });
				},60000);*/
				
				  //------------------------------------------------------------------------------------\\ 

				  cmd.hear(/^(?:eval)\s([^]+)$/i, async (message, bot) => {
					if(message.senderId !== 459134303| message.senderId !== 459134303) return;
				
					try {
						const result = eval(message.args[1]);
				
						if(typeof(result) === 'string')
						{
							return bot(`string: ${result}`);
						} else if(typeof(result) === 'Готово')
						{
							return bot(`number: ${result}`);
						} else {
							return bot(`${typeof(result)}: ${JSON.stringify(result, null, '&#12288;\t')}`);
						}
					} catch (e) {
						console.error(e);
						return bot(`ошибка:
						${e.toString()}`);
					}
				});

				cmd.hear(/^(?:Подарок)$/i, async (message, bot) => {
					if(message.user.bonustime > getUnix()) return bot(`Вы уже брали подарок, до следующего осталось : ${unixStampLeft(message.user.bonustime - Date.now())}`);
					let prize = utils.pick([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
				
					if(prize === 1)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.balance += 500000;
						return bot(`в подарке вы нашли 500.000$`);
					}
				
					if(prize === 2)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.btc += 20000;
						return bot(`в подарке вы нашли 20.000₿`);
					}
				
					if(prize === 3)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.rating += 5;
						return bot(`вв подарке вы нашли 50👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 4)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.rating += 199;
						return bot(`в подарке вы нашли 199👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 5)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.rating += 100;
						return bot(`в подарке вы нашли 100👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
				
					if(prize === 6)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.rating += 20;
						return bot(`в подарке вы нашли 20👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
					if(prize === 7)
					message.user.bonustime = getUnix() + 43200000;
					{
						message.user.rating += 30;
						return bot(`в подарке вы нашли 30👑!\n👑 Рейтинг: ${utils.sp(message.user.rating)}`);
					}
					if(prize === 8)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.btc += 10000;
						return bot(`в подарке вы нашли 10000btc👑!\n👑 Биткоинов: ${utils.sp(message.user.btc)}`);
					}
					if(prize === 9)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.bank += 100000000;
						return bot(`в подарке вы нашли 100.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
					if(prize === 10)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.bank += 50000000;
						return bot(`в подарке вы нашли 50.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				
					if(prize === 11)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.bank += 100000000;
						return bot(`в подарке вы нашли 100.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				
					if(prize === 12)
					{
						message.user.bonustime = getUnix() + 43200000;
						message.user.bank += 500000000;
						return bot(`в подарок вы нашли 500.000.000$ на свой банковский счёт!\n💳 В банке: ${utils.sp(message.user.bank)}$`);
					}
				});

				cmd.hear(/^(?:получить паспорт|заявка на паспорт)\s?([^]+)?/i, async (message, args, bot) => {
					if(message.user.pasport += true) return message.send(`Вы получили паспорт`);
				});
				
				cmd.hear(/^(?:паспорт|паспарт)$/i, async (message, bot) => {	
					let user = message.user 
					if(message.user.pasport == false) return message.send(`» 👤 Система получения вашего паспорта, достигшего 14+ лет:
					=================
					
					❓» 1. Как вас зовут ?
					- Чтобы заполнить данную анкету, ведите “Имя в паспорте (имя)”.
					❓» 2. Дата вашего рождения, чтобы заполнить данную анкету, впишите “Дата Рождения (Ваша дата рождения)”.
					❓ » 3. Ваш суженный, или суженная, с кем вы находитесь в данный момент в браке? Чтобы заполнить данную анкету, вас нужно вести “В браке с (имя)”.
					❓4. » Место жительства, чтобы заполнить данную анкету, впишите “Место жительства (желаемое место жительства)”.
					❓5. » Место работы, чтобы заполнить место работы, нужно написать “Работаю в (желаемое место работы)”.
					
					====================
					❗Чтобы получить паспорт, нужно отправить заявку на рассмотрение, ведите команду “Заявка на паспорт” или “Получить паспорт”.
					🛑Информацию о вашем паспорте, вы можете посмотреть, написав “Паспорт”.`)
					if(message.user.pasport == true){
					return message.send(`ваш паспорт:
						💬Имя: ${message.user.nick}
						👶Дата рождения: ${message.user.dr}
						👨‍❤‍👨В браке с: ${message.user.brakpasport}
						🌐Место жительства: ${message.user.givet}
						🏢Место работы: ${message.user.pasprabota}
						==========================================`);
				}
					});
				
				cmd.hear(/^(?:имя в паспорте)\s(.*)$/i, async (message, bot) => {
					if(message.args[1].length >= 16) return bot(`максимальная длина имени в паспорте 15 символов`);
				
					message.user.nick = message.args[1];
					return bot(`Теперь ваш ник: "${message.user.nick}"`);
							});
				
				cmd.hear(/^(?:дата рождения)\s(.*)$/i, async (message, bot) => {
				
					message.user.dr = message.args[1];
					return bot(`Вы успешно установили дату в паспорте: "${message.user.dr}"`);
							});
				
				cmd.hear(/^(?:в браке с)\s(.*)$/i, async (message, bot) => {
				
					message.user.brakpasport = message.args[1];
					return bot(`Вы успешно установили брак в паспорте с: "${message.user.brakpasport}"`);
							});
				
				cmd.hear(/^(?:место жительства)\s(.*)$/i, async (message, bot) => {
				
					message.user.givet = message.args[1];
					return bot(`Вы успешно установили место жительства в паспорте : "${message.user.givet}"`);
							});

							cmd.hear(/^(?:Смс)\s([0-9]+)\s([^]+)$/i, async (message, bot) => { 
								if(message.user.phone) return bot(`У вас нету телефона, для отправки сообщения по набронному игровогу айди. \n\n | Чтобы купить телефон, напишите "телефоны".`)
								if(message.user.smstime > getUnix()) return bot(`Лимит на отправку сообщений: ${unixStampLeft(message.user.smstime - Date.now())}`);
							message.user.foolder += 1;
						
						const user = await users.find(x=> x.uid === Number(message.args[1])); 
						if(!user) return bot(`такого игрока не существует. Вероятно, вы ошиблись.`); 
						
						vk.api.messages.send({ user_id: user.id, message: `Вам пришло сообщение!` }); 
						
						vk.api.messages.send({ user_id: user.id, message: `Сообщение открывается...` }); 
						
						vk.api.messages.send({ user_id: user.id, message: `
						<- &#4448;Игрок: ID: [id${message.user.id}| ${message.user.uid}] &#4448; 📞
						
						✉ Карта: [SIM1] 
						✉ Время получения: ${new Date().getHours()}:${new Date().getMinutes()}
						✉ Сообщение: ❜${message.args[2]}❜\n\n | Чтобы отправить ответное сообщение, ведите "Смс [id] [сообщение]` }); 
						
						message.user.smstime = getUnix() + 60000;
						message.user.balance -= 201;
							return message.send(`Сообщение успешно отправлено! С вас списано - 201$`);
						});

						cmd.hear(/^(?:питомцы)\s?([0-9]+)?$/i, async (message, bot) => {
							if(!message.args[1]) return bot(`питомцы:
						🐌 1. Улитка (1.000$)
						🐰 2. Заяц (500.000$)
						🦊 3. Лиса (1.250.000.000$)
						🐶 4. Собака (5.000.000.000$)
						🐼 5. Пони (30.000.000.000$)
						🐅 6. Пантера (50.000.000.000$)
						😈 7. Дракон (250.000.000.000$)
						
						🚩Для покупки введите "Питомцы [номер]"`,
						{
							keyboard:JSON.stringify(
							{
							"inline": true,
							"buttons": [
							[{
							"action": {
							"type": "text",
							"payload": "{}",
							"label": "Бизнесы"
							},
							"color": "primary"
							},
							{
							"action": {
							"type": "text",
							"payload": "{}",
							"label": "Питомец поход"
							},
							"color": "negative"
							}]
							]
							})
							})
						
							const sell = pets.find(x=> x.id === Number(message.args[1]));
							if(!sell) return;
							if(message.user.misc.pet) return bot(`у Вас уже есть питомец. `);
						
							if(message.user.balance < sell.cost) return bot(`вам нужно ${utils.sp(sell.cost)}$ для покупки. `);
							else if(message.user.balance >= sell.cost)
							{
								message.user.balance -= sell.cost;
								message.user.misc.pet = sell.id;
								message.user.pet.lvl += 1;
						
								return bot(`вы успешно купили себе питомца, отправляйте его в поход и прокачивайте его уровень. `);
							}
						});
						
						cmd.hear(/^(?:питомец поход)$/i, async (message, bot) => {
							if(message.user.misc.pet < 1) return bot(`у Вас нет питомца. `);
							else {
								if(message.user.poxod > getUnix()) return bot(`вы сможете отправить питомца в поход через 60 минут. Ваш питомец довольно сильно устал!: ${unixStampLeft(message.user.poxod - Date.now())}`);
												
								let cashfind = utils.random(332326,28721329);
								message.user.balance += cashfind;
								message.user.timers.poxod = true;
						
								message.user.poxod = getUnix() + 3600000;
						
								bot(`ваш питомец нашёл в походе ${utils.sp(cashfind)}$. Улучшайте своего питомца!`);
						}
						
						});
						
						cmd.hear(/^(?:питомец)$/i, async (message, bot) => {
							message.user.msgbalance += 1;
							if(message.user.misc.pet < 1) return message.send(`У вас нету питомца, посмотреть питомцев написав команду 'Питомцы'`)
							return bot(`\n🐧 Ваш питомец: ${pets[message.user.misc.pet - 1].name} \n\n | Ходите вместе с ним в поход, команда "Питомец поход".`);
						});

						cmd.hear(/^(?:Страны)$/i, async (message, bot) => { 
							return bot(`Список стран: 
							
							1.❓Не указана 
							2.🇺🇸США 
							3.🇷🇺Россия 
							4.🇰🇷Япония 
							5.🇺🇦Украина 
							6.🇰🇿Казахстан 
							7.🇧🇾Белоруссия 
							8. 🇪🇸 Испания
							9. 🇫🇷 Франция
							
							Для выбора страны проживания введите:Страна [номер]`); 
							});
							
							cmd.hear(/^(?:Страна 9)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 9; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							});  
							
							cmd.hear(/^(?:Страна 8)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 8; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							});  
							
							cmd.hear(/^(?:Страна 7)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 7; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							cmd.hear(/^(?:Страна 6)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 6; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							cmd.hear(/^(?:Страна 5)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 5; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							cmd.hear(/^(?:Страна 4)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 4; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							cmd.hear(/^(?:Страна 3)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 3; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							
							cmd.hear(/^(?:Страна 1)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 1; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан.‼`); 
							} 
							}); 
							
							cmd.hear(/^(?:Страна 2)$/i, async (message, bot) => { 
							let prize = utils.pick([1]); 
							
							if(prize === 1) 
							{ 
							message.user.transport.strana = 2; 
							return bot(`‼Вы успешно сменили страну проживания.‼Напоминаем:за оскорбление наций будет выдан бан‼`); 
							} 
							});
							
cmd.hear(/^(?:Кейсы)$/i, async (message, bot) => {
	return message.send(` кейсы:

	1⃣ Большой Кейс: 50.000.000.000$
	📜 Информация: "кейс инфо 1"
	🛒 Купить: "кейс 1 [кол-во]"
	
	2⃣ Платинум Кейс: 3.000.000.000.000$
	📜 Информация: "кейс инфо 2"
	🛒 Купить: "кейс 2 [кол-во]"
	
	📦 Большой Кейс (${message.user.kbkays} шт.)
-📜 Открыть: «кейс открыть 1»

    📦 Платинум Кейс (${message.user.kplati} шт.)
-📜 Открыть: «кейс открыть 2»
	`,
	{
		keyboard:JSON.stringify(
		{
		"inline": true,
		"buttons": [
		[{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейс инфо 1"
		},
		"color": "primary"
		},
		{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейс инфо 2"
		},
		"color": "negative"
		}]
		]
		})
		})
});

cmd.hear(/^(?:Кейс инфо 1)$/i, async (message, bot) => {
	return message.send(`  из "Большой Кейса" может выпасть:

	1⃣ Опыт.
	2⃣ Игровая валюта.
	3⃣ Рейтинг.
	
	🛒 Купить: "кейс 1" `);
});

cmd.hear(/^(?:Кейс инфо 2)$/i, async (message, bot) => {
	return message.send(`из "Платинум Кейса" может выпасть:

	1⃣ Опыт.
	2⃣ Игровая валюта.
	3⃣ Рейтинг.
	4⃣  McDonalds
	5⃣ Рандомный дом
	6⃣ Привилегия "Супер игрок" навсегда
	
	🛒 Купить: "кейс 2" `);
});

	cmd.hear(/^(?:выдатькейс 1)\s([0-9]+)\s(.*)$/i, async (message, bot) => { 
				message.args[2] = message.args[2].replace(/(\.|\,)/ig, ''); 
				message.args[2] = message.args[2].replace(/(к|k)/ig, '000'); 
				message.args[2] = message.args[2].replace(/(м|m)/ig, '000000'); 
				
				if(message.user.settings.adm < 2) return bot(`Вы не админ`);
				if(!Number(message.args[2])) return; 
				message.args[2] = Math.floor(Number(message.args[2])); 
				
				if(message.args[2] <= 0) return; 
				
				{ 
				let user = users.find(x=> x.uid === Number(message.args[1])); 
				if(!user) return bot(`укажите ID игрока из его профиля. ${smileerror}`); 
				
				
				user.kbkays += message.args[2]; 
				
				
				await bot(`вы выдали игроку ${user.tag} ${utils.sp(message.args[2])}$`); 
				if(user.notifications) vk.api.messages.send({ user_id: user.id, message: `[УВЕДОМЛЕНИЕ] 
				Администратор[@id${message.user.id}(${message.user.tag})] выдал вам ${utils.sp(message.args[2])}$! 
				🔕 Введите "Уведомления выкл", если не хотите получать подобные сообщения` }); 
				} 
				});

cmd.hear(/^(?:Бкейс|кейс открыть 1)$/i, async (message, bot) => {
message.user.foolder += 1; 
	if(message.user.kbkays < 1) return message.send(`💵 >> У вас нету Большого Кейса, чтобы купить напишите "Кейс 1"`);
    message.user.kbkays -= 1; 

	let prize = utils.pick([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);

	setTimeout(() => {
		message.user.bkaystime = false;
	}, 86400000);

	message.user.bkaystime = true;


	if(prize === 1)
	{
		message.user.balance += 500000000;
		message.user.balance += 100000000;
		return bot(`Открыв Большой Кейс, вы получили 500.000.000$ \n Вы получили +100.000.000$${smilesuccess}`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 2)
	{
		message.user.btc += 1000000;
		return bot(`Открыв Большой Кейс, вы получили 1.000.000₿ ${smilesuccess}`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 3)
	{
		message.user.rating += 100;
		return bot(`Открыв Большой Кейс, вы получили 100👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 4)
	{
		message.user.rating += 53;
		return bot(`Открыв Большой Кейс, вы получили 53👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 5)
	{
		message.user.rating += 99;
		return bot(`Открыв Большой Кейс, вы получили 99👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 6)
	{
		message.user.rating += 33;
		return bot(`Открыв Большой Кейс, вы получили 33👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}
	if(prize === 7)
	{
		message.user.rating += 333;
		return bot(`Открыв Большой Кейс, вы получили 333👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}
	if(prize === 8)
	{
		message.user.rating += 777;
		return bot(`Открыв Большой Кейс, вы получили 777👑`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}
	if(prize === 9)
	{
		message.user.bank += 100000000;
		return bot(`Открыв Большой Кейс, вы получили на банковский счет 100.000.000$ ${smilesuccess}`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}
	if(prize === 10)
	{
		message.user.bank += 500000000;
		return bot(`Открыв Большой Кейс, вы получили на банковский счет 500.000.000$ ${smilesuccess}`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 11)
	{
		message.user.bank += 10000000;
		return bot(`Открыв Большой Кейс, вы получили на банковский счет 10.000.000$ ${smilesuccess}`,
		{
			keyboard:JSON.stringify(
			{
			"inline": true,
			"buttons": [
			[{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейсы"
			},
			"color": "primary"
			},
			{
			"action": {
			"type": "text",
			"payload": "{}",
			"label": "Кейс открыть 1"
			},
			"color": "negative"
			}]
			]
			})
			})
	}

	if(prize === 12)
	{
		message.user.bank += 50000000;
		return bot(`вы выиграли 50.000.000$ на свой банковский счёт ${smilesuccess}\n\n\n\
`,
{
	keyboard:JSON.stringify(
	{
	"inline": true,
	"buttons": [
	[{
	"action": {
	"type": "text",
	"payload": "{}",
	"label": "Кейсы"
	},
	"color": "primary"
	},
	{
	"action": {
	"type": "text",
	"payload": "{}",
	"label": "Кейс открыть 1"
	},
	"color": "negative"
	}]
	]
	})
	})
	}
});

 cmd.hear(/^(?:Купить большой кейс|кейс 1|Большой кейс|Купить кейс 1)$/i, async (message, bot) => {
 	if(message.user.balance < 50000000000) return message.send(`⚠ Большой кейс стоит ${utils.sp(50000000000)}$`); 
    message.user.balance -= 50000000000; 
    message.user.kbkays += 1;
	return bot(`вы успешно купили "Большой Кейс" (${message.user.kbkays} шт.)`,
	{
		keyboard:JSON.stringify(
		{
		"inline": true,
		"buttons": [
		[{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейсы"
		},
		"color": "primary"
		},
		{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейс открыть 1"
		},
		"color": "negative"
		}]
		]
		})
		})
});

cmd.hear(/^(?:Кейс 2)$/i, async (message, bot) => {
	if(message.user.balance < 3000000000000) return message.send(`⚠ Большой кейс стоит ${utils.sp(3000000000000)}$`); 
   message.user.balance -= 3000000000000; 
   message.user.kplati += 1;
   return bot(`вы успешно купили "Плантиум Кейс" (${message.user.kplati} шт.)`,
   {
	   keyboard:JSON.stringify(
	   {
	   "inline": true,
	   "buttons": [
	   [{
	   "action": {
	   "type": "text",
	   "payload": "{}",
	   "label": "Кейсы"
	   },
	   "color": "primary"
	   },
	   {
	   "action": {
	   "type": "text",
	   "payload": "{}",
	   "label": "Кейс открыть 2"
	   },
	   "color": "negative"
	   }]
	   ]
	   })
	   })
});

cmd.hear(/^(?:кейс открыть 2)$/i, async (message, bot) => {
	message.user.foolder += 1; 
		if(message.user.kplati < 1) return message.send(`💵 >> У вас нету Плантиум кейса Кейса, чтобы купить напишите "Кейс 2"`);
		message.user.kplati -= 1; 
	
		let prize = utils.pick([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
	
		if(prize === 1)
		{
			message.user.balance += 500000000;
			message.user.balance += 100000000;
			return bot(`Открыв Большой Кейс, вы получили 500.000.000$ \n Вы получили +100.000.000$${smilesuccess}`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 2)
		{
			message.user.btc += 1000000;
			return bot(`Открыв Большой Кейс, вы получили 1.000.000₿ ${smilesuccess}`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 3)
		{
			message.user.rating += 100;
			return bot(`Открыв Большой Кейс, вы получили 100👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 4)
		{
			message.user.rating += 53;
			return bot(`Открыв Большой Кейс, вы получили 53👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 5)
		{
			message.user.rating += 99;
			return bot(`Открыв Большой Кейс, вы получили 99👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 6)
		{
			message.user.rating += 33;
			return bot(`Открыв Большой Кейс, вы получили 33👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
		if(prize === 7)
		{
			message.user.rating += 333;
			return bot(`Открыв Большой Кейс, вы получили 333👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
		if(prize === 8)
		{
			message.user.rating += 777;
			return bot(`Открыв Большой Кейс, вы получили 777👑`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
		if(prize === 9)
		{
			message.user.bank += 100000000;
			return bot(`Открыв Большой Кейс, вы получили на банковский счет 100.000.000$ ${smilesuccess}`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
		if(prize === 10)
		{
			message.user.bank += 500000000;
			return bot(`Открыв Большой Кейс, вы получили на банковский счет 500.000.000$ ${smilesuccess}`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 11)
		{
			message.user.bank += 10000000;
			return bot(`Открыв Большой Кейс, вы получили на банковский счет 10.000.000$ ${smilesuccess}`,
			{
				keyboard:JSON.stringify(
				{
				"inline": true,
				"buttons": [
				[{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейсы"
				},
				"color": "primary"
				},
				{
				"action": {
				"type": "text",
				"payload": "{}",
				"label": "Кейс открыть 2"
				},
				"color": "negative"
				}]
				]
				})
				})
		}
	
		if(prize === 12)
		{
			message.user.bank += 50000000;
			return bot(`вы выиграли 50.000.000$ на свой банковский счёт ${smilesuccess}\n\n\n\
	`,
	{
		keyboard:JSON.stringify(
		{
		"inline": true,
		"buttons": [
		[{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейсы"
		},
		"color": "primary"
		},
		{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Кейс открыть 2"
		},
		"color": "negative"
		}]
		]
		})
		})
		}
	});

	cmd.hear(/^(?:одежда|одежды)\s?([0-9]+)?$/i, async (message, bot) => {
		if(!message.args[1]) return bot(`одежда:
		${message.user.odejda === 1 ? '👘' : '👘'} 1. Шмотки с Avito (3$)
		${message.user.odejda === 2 ? '👘' : '👘'} 2. Шмотки с AliExpress (1.000$)
		${message.user.odejda === 3 ? '👘' : '👘'} 3. Demix (10.000$)
		${message.user.odejda === 4 ? '👘' : '👘'} 4. Puma (300.000$)
		${message.user.odejda === 5 ? '👘' : '👘'} 5. Reebok (300.000$)
		${message.user.odejda === 6 ? '👘' : '👘'} 6. Nike (500.000$)
		${message.user.odejda === 7 ? '👘' : '👘'} 7. Adidas (1.000.000$)
		${message.user.odejda === 8 ? '👘' : '👘'} 8. Armani (100.000.000$)
		${message.user.odejda === 9 ? '👘' : '👘'} 9. Маска Леси (250.000.000$)
		${message.user.odejda === 10 ? '👘' : '👘'} 10. Versace (500.000.000$)
		${message.user.odejda === 11 ? '👘' : '👘'} 11. Burberry (1.000.000.000$)
		${message.user.odejda === 12 ? '👘' : '👘'} 12. Ralph Lauren (10.000.000.000$)
		${message.user.odejda === 13 ? '👘' : '👘'} 13. Coco Chanel (15.000.000.000$)
		${message.user.odejda === 14 ? '👘' : '👘'} 14. Prada (30.000.000.000$)
		${message.user.odejda === 15 ? '👘' : '👘'} 15. Hermes (100.000.000.000$)
		${message.user.odejda === 16 ? '👘' : '👘'} 16. Gucci (5.000.000.000.000$)
		${message.user.odejda === 17 ? '👘' : '👘'} 17. Маска Льва (100.000.000.000.000$)
		
		🛒 Для покупки введите "Одежда [номер]"`, { attachment: "photo-1162895311_457239813"});
		
		const sell = odejda.find(x=> x.id === Number(message.args[1]));
		if(!sell) return;
		if(message.user.odejda) return bot(`у вас уже есть одежда (${odejda[message.user.odejda - 1].name}), введите "Продать одежду"`,
		{
		keyboard:JSON.stringify(
		{
		"inline": true,
		"buttons": [
		[{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "Продать одежду"
		},
		"color": "primary"
		}]
		]
		})
		})
		
		if(message.user.balance < sell.cost) return bot(`недостаточно денег`,
		{
		keyboard:JSON.stringify(
		{
		"inline": true,
		"buttons": [
		[{
		"action": {
		"type": "text",
		"payload": "{}",
		"label": "🤑 Бонус"
		},
		"color": "primary"
		}]
		]
		})
		})
		else if(message.user.balance >= sell.cost)
		{
		message.user.balance -= sell.cost;
		message.user.odejda = sell.id;
		
		return bot(`вы купили "${sell.name}" за ${utils.sp(sell.cost)}$`);
		}
		});

		cmd.hear(/^(?:warn)\s?([0-9]+)?\s([^]+)?/i, async (message, args, bot) => { 
			let user = users.find(x=> x.uid === Number(message.args[1])); 
			if(!message.args[1] || !message.args[2]) return message.send(`🔸 » Пример команды: warn [ID] [ПРИЧИНА]`); 
			if(!Number(message.args[1])) return message.send(`🔸 » Число должно быть цифрового вида.`); 
			if(message.user.settings.adm < 2) return message.send(`🔸 » Вы не администратор`); 
			if(!users[message.args[1]]) return message.send(`❎ » Такого игрока нет!`); 
			
			users[message.args[1]].warn += 1; 
			users[message.args[1]].warn_p = `${message.args[2]}` 
			
			let text = `✅ » ${user.tag} Вам выдали варн по причине: [${message.args[2]}]\n\n < Если вы не согласны с предупреждением, вы можете написать в репорт "Репорт Админ [id${message.user.id}| ${message.user.tag}] выдал мне предупреждение без причины" - или ваш текст.` 
			if(users[message.args[1]].warn == 5){ 
			users[message.args[1]].warn = 0; 
			user.ban = true; 
			text += `\n🔸 » У вас 5 предупреждения.\n🔸 » Ваш аккаунт заблокирован.` 
			} 
			vk.api.call('messages.send', { 
			peer_id: users[message.args[1]].id, 
			message: text 
			}); 
			return message.send(`✅ » Вы выдали предупреждение игроку [${users[message.args[1]].tag}].`); 
			});
			
			cmd.hear(/^(?:Unwarn)\s?([0-9]+)?/i, async (message, args, bot) => { 
			let user = users.find(x=> x.uid === Number(message.args[1])); 
			if(!message.args[1]) return message.send(`🔸 » Пример команды: unwarn [ID]`); 
			if(!Number(message.args[1])) return message.send(`🔸 » Число должно быть цифрового вида.`); 
			if(message.user.settings.adm < 2) return message.send(`🔸 » Вы не СОздатель`); 
			if(!users[message.args[1]]) return message.send(`❎ » Такого игрока нет!`); 
			
			users[message.args[1]].warn = 0; 
			users[message.args[1]].warn_p = `Нету`; 
			
			vk.api.call('messages.send', { 
			peer_id: users[message.args[1]].id, 
			message: `✅ » Администратор снял Вам все предупреждения`
			}); 
			return message.send(`✅ » Вы сняли все предупреждения игроку [${users[message.args[1]].tag}].`); 
			});

			cmd.hear(/^(?:Азарт)\s?(.*)?$/i, async (message, bot) => {
				message.user.nalogy += (100, 123, 1021, 200, 21, 500, 222, 789);
				message.args[1] = message.args[1].replace(/(\.|\,)/ig, '');
				message.args[1] = message.args[1].replace(/(к|k)/ig, '000');
				message.args[1] = message.args[1].replace(/(м|m)/ig, '000000');
				message.args[1] = message.args[1].replace(/(вабанк|вобанк|все|всё|dct|dc`)/ig, message.user.rating);
				let smilelose = ['😩','😕','😦','😵','😟','😔','😩','😿'].random(); 
				let smilewin = ['😄','😁','😊','😃','😉','😜','😋','🤗','🙂','🙃','😌','🤤','😇','🤪','😈','😸','😼','😺','😎'].random();
			
				if(!Number(message.args[1])) return;
				message.args[1] = Math.floor(Number(message.args[1]));
			
				if(message.args[1] <= 0) return bot(`Ваш рейтинг пуст. Используйте бонусы, которые есть в боте`);
			
				if(message.args[1] > message.user.rating) return bot(`у вас нет данной суммы`);
			else if(message.args[1] <= message.user.rating && message.user.rating <= 50000000000) 
			{ 
			message.user.rating -= message.args[1]; 
			const multiply = utils.pick([0, 1, 0.75, 2, 1, 0, 5, 2, 2, 2, 3, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 1, 3, 0.25, 0.25, 4, 0.25, 0.25, 5, 0.25, 4, 0.25, 0.25, 0.5, 40, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 50, 0.75, 0.75, 0.75, 0.75, 3, 0.75, 0.75, 0.75, 5, 0.75]); 
			
			message.user.rating += Math.floor(message.args[1] * multiply); 
			return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})👑 ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})👑 ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n👑 — Рейтинг: (${utils.sp(message.user.rating)})`); 
			} 
			
			else if(message.args[1] <= message.user.rating && message.user.rating > 50000000000 && message.user.rating <= 300000000000) 
			{ 
			message.user.rating -= message.args[1]; 
			const multiply = utils.pick([0, 10, 1, 5, 5, 1, 3, 10, 3, 3, 3, 1, 1, 2, 2, 2, 2, 2, 1, 20, 0.25, 0.25, 0.25, 0.25, 0.25, 8, 0.5, 5, 0.5, 0.5, 0.5, 0.5, 13, 0.5, 0.75, 0.75, 0.75, 8, 0.75, 0.75, 0.75, 0.75, 19, 0.75]); 
			
			message.user.rating += Math.floor(message.args[1] * multiply);
			
			return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})👑 ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})👑 ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n👑 — Рейтинг: (${utils.sp(message.user.rating)})`); 
			} 
			
			else if(message.args[1] <= message.user.rating && message.user.rating > 300000000000 && message.user.rating <= 1000000000000) 
			{ 
			message.user.rating -= message.args[1]; 
			const multiply = utils.pick([0, 5, 1, 3, 3, 3, 1, 10, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75]); 
			
			message.user.rating += Math.floor(message.args[1] * multiply); 
			
			return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})👑 ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})👑 ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n👑 — Рейтинг: (${utils.sp(message.user.rating)})`); 
			} 
			
			else if(message.args[1] <= message.user.rating && message.user.rating > 1000000000000 && message.user.rating <= 10000000000000) 
			{ 
			message.user.rating -= message.args[1]; 
			const multiply = utils.pick([0, 1, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75]); 
			
			message.user.rating += Math.floor(message.args[1] * multiply); 
			
			return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})👑 ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})👑 ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n👑 — Рейтинг: (${utils.sp(message.user.rating)})`); 
			} 
			else if(message.args[1] <= message.user.rating && message.user.rating > 10000000000000)
			{ 
			message.user.rating -= message.args[1]; 
			const multiply = utils.pick([0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0.25, 0.25, 0.25, 0.25, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.75, 0.75, 0.75, 0.75]); 
			
			message.user.rating += Math.floor(message.args[1] * multiply); 
			
			return bot(`${multiply === 1 ? `\n❎ — Ваши деньги остаются у вас.` : `${multiply < 1 ? `📉 — Вы проиграли (${utils.sp(message.args[1] - message.args[1] * multiply)})👑 ${smilelose}\n` : `📈— Вы выиграли (${utils.sp(message.args[1] * multiply - message.args[1])})👑 ${smilewin}\n`}`} ➕ — Умножение (x${multiply}) \n👑 — Рейтинг: (${utils.sp(message.user.rating)})`); 
				}
			});

			cmd.hear(/^(?:промо вкл)$/i, async (message, bot) => { 
				if(message.user.settings.adm < 3) return; 
				
				clearPromo();
				return bot(`промокод включен! ${smilesuccess}`);
				
				});
				
				cmd.hear(/^(?:промо тип btc)$/i, async (message, bot) => { 
				if(message.user.settings.adm < 3) return;
				config.promotip = "btc"; 
				saveConfig();
				return bot(`тип промокода: Bitcoin. ${smilesuccess}`);
				
				});
				
				cmd.hear(/^(?:промо тип баланс)$/i, async (message, bot) => { 
				if(message.user.settings.adm < 3) return;
				config.promotip = "balance"; 
				saveConfig();
				return bot(`тип промокода: Баланс. ${smilesuccess}`);
				
				});

				cmd.hear(/^(?:промо)\s([0-9]+)$/i, async (message, bot) => { 
					if(message.user.settings.adm < 3) return;
					config.promovalue = Number(message.args[1]); 
					saveConfig();
					return bot(`сумма промокода: ${config.promovalue}. ${smilesuccess}`);
					
					});
					
					cmd.hear(/^(?:промо лимит)\s([0-9]+)$/i, async (message, bot) => { 
					if(message.user.settings.adm < 3) return;
					config.promolimit = Number(message.args[1]); 
					saveConfig();
					return bot(`лимит использований промокода: ${config.promolimit}. ${smilesuccess}`);
					
					});
					
					cmd.hear(/^(?:промо бабки|промо)$/i, async (message, bot) => {
					if(message.isChat) return bot(`что бы получить бонус с промокода вы должны отправить этот промокод боту в личку.`);
					if(message.user.promo) return bot(`вы уже активировали промокод. ${smileerror}`);
					else 
					{
					
						if(promo >= config.promolimit) return bot(`у этого промокода ЗАКОНЧИЛИСЬ ИСПОЛЬЗОВАНИЯ, включи уведомления в группе о новых записях что бы узнавать ОДНИМ ИЗ ПЕРВЫХ о новых промокодах. 📢`);
						if(config.promotip === "btc") message.user.btc += config.promovalue;
						if(config.promotip === "balance") message.user.balance += config.promovalue;
						message.user.promo = true;
						promo += 1;
						ostalos = config.promolimit-promo;
						return bot(`зачислено +${utils.sp(config.promovalue)}${config.promotip.toString().replace(/btc/gi, "฿").replace(/balance/gi, "$")} ✅
					📢 Осталось ${ostalos} использований.`);
					
					}
					
					});