// スタイリングはapp/assets/stylesheets/users.scssで😇
import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

const VueTables = require('vue-tables-2');
Vue.use(VueTables.ClientTable);

new Vue({
	el: '#users_table',
	data: {
		columns: [
			'user_name',
			'point',
			'solved',
			'submitted',
			'created_at'
		],
		data: getData('/users/getall.json'),
		options: {
			pagination: {nav: 'scroll', edge: true},
			orderBy: {ascending: false, column: 'point'},
			perPage: 20,
			perPageValues: [10, 20, 50, 100],
			texts: {
				count: '{count} 人中 {from} 〜 {to} 人目|全 {count} 人|全 1 人',
				first: '<<',
				last: '>>',
				filter: '検索:',
				filterPlaceholder: '検索',
				limit: '表示人数:',
				page: 'ページ:',
				noResults: 'ユーザーが見つかりませんでした',
				filterBy:'-',
				loading:'読み込み中...',
				defaultOption:'-',
				columns:'列'
			},
			headings: {
				user_name: 'ユーザー名',
				point: '合計得点',
				solved: '解いた問題数',
				submitted: '提出回数',
				created_at: '登録日時'
			},
			sortable: [
				'user_name', 'point', 'solved', 'submitted', 'created_at'
			]
		}
	}
});

function getData(str) {
	let data = [];
	axios.get(`${str}`)
		.then(result => {
			result.data.forEach(function(r) {
				data.push(r);
			});
		});
	return data;
}
