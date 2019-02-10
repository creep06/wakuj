// スタイリングはapp/assets/stylesheets/problems.scssで😁
import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

const VueTables = require('vue-tables-2');
Vue.use(VueTables.ClientTable);

new Vue({
	el: '#problems_table',
	data: {
		columns: [
			'problem_name',
			'point',
			'solved_count',
			'success_rate'
		],
		data: getData('/problems/getall.json'),
		options: {
			filterByColumn: true,
			listColumns: {
				point: initPoints()
			},
			pagination: {nav: 'scroll', edge: true},
			orderBy: {column: 'point'},
			perPage: 20,
			perPageValues: [10, 20, 50, 100],
			texts: {
				count: '{count} 問中 {from} 〜 {to} 問目|全 {count} 問|全 1 問',
				first: '<<',
				last: '>>',
				filter: '検索:',
				filterPlaceholder: '検索',
				limit: '表示問題数:',
				page: 'ページ:',
				noResults: '問題が見つかりませんでした',
				filterBy:'-',
				loading:'読み込み中...',
				defaultOption:'-',
				columns:'列'
			},
			headings: {
				problem_name: '名前',
				point: '得点',
				solved_count: '解いた人数',
				success_rate: '正答率'
			},
			sortable: [
				'problem_name', 'point', 'solved_count', 'success_rate'
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


function initPoints() {
	let data = [];
	for (var i=1; i<=3; i++) {
		data.push({id: i*100, text: i*100});
	}
	return data;
}
