// スタイリングはapp/assets/stylesheets/submissions.scssで😉
import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

const VueTables = require('vue-tables-2');
Vue.use(VueTables.ClientTable);

new Vue({
	el: '#submissions_table',
	data: {
		columns: [
			'created_at',
			'problem_name',
			'user_name',
			'verdict',
			'point',
			'language',
			'time',
			'memory',
			'length'
		],
		data: getData('/submissions/getall.json'),
		options: {
			filterByColumn: true,
			listColumns: {
				problem_name: getData('/problems/getnames.json'),
				user_name: getData('/users/getnames.json'),
				verdict: initVerdicts(),
				point: initPoints(),
				language: initLanguages()
			},
			pagination: {nav: 'scroll', edge: true},
			orderBy: {ascending: false, column: 'created_at'},
			perPage: 20,
			perPageValues: [10, 20, 50, 100],
			texts: {
				count: '{count} 件中 {from} 〜 {to} 件目|全 {count} 件|全 1 件',
				first: '<<',
				last: '>>',
				filter: '検索:',
				filterPlaceholder: '名前、提出日時など',
				limit: '表示件数:',
				page: 'ページ:',
				noResults: '提出が見つかりませんでした',
				filterBy:'-',
				loading:'読み込み中...',
				defaultOption:'-',
				columns:'列'
			},
			headings: {
				created_at: '提出日時',
				problem_name: '問題',
				user_name: 'ユーザー',
				verdict: '判定',
				point: '得点',
				language: '言語',
				time: '実行時間',
				memory: 'メモリ',
				length: 'コード長'
			},
			sortable: [
				'created_at', 'problem_name', 'user_name', 'verdict', 'point', 'language', 'time', 'memory', 'length'
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


function initVerdicts() {
	return [
		{id: 'AC', text: 'Accepted'},
		{id: 'WA', text: 'Wrong Answer'},
		{id: 'TLE', text: 'Time Limit Exceeded'},
		{id: 'MLE', text: 'Memory Limit Exceeded'},
		{id: 'RE', text: 'Runtime Error'},
		{id: 'CE', text: 'Compilation Error'},
		{id: 'Pending', text: 'Pending'}
	];
}


function initPoints() {
	let data = [];
	for (var i=1; i<=3; i++) {
		data.push({id: i*100, text: i*100});
	}
	return data;
}


function initLanguages() {
	return [
		{id: 'C++', text: 'C++'},
		{id: 'Ruby', text: 'Ruby'},
		{id: 'Python3', text: 'Python3'}
	];
}
