import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

const app = new Vue({
	el: '#results_view',
	data: {
		results: {},
		interval: undefined,
		verdict: 'Pending',
		point: 0,
		time: '-',
		memory: '-',
		image_path: '/images/Pending.gif'
	},

	methods: {
		sub_renew: function() {
			axios.get(`/submissions/srenew?id=${submission_id}.json`)
				.then(newresults => {
					app.verdict = newresults.data.verdict;
					if (app.verdict !== 'Pending') app.image_path = `/images/${app.verdict}.png`;
					app.time = newresults.data.time;
					app.memory = newresults.data.memory;
					app.point = newresults.data.point;
				});
		},

		try_kill_interval: function() {
			if (this.verdict === 'CE' || (this.interval !== undefined && this.results.length === testcases_count)) {
				clearInterval(app.interval);
				// db更新が間に合わない可能性があるからちょっと待つ
				setTimeout(this.sub_renew(), 1000);
			}
		}
	},

	beforeMount: function() {
		this.sub_renew();
	},

	mounted: function() {
		// ジャッジ終了までgetしまくる
		if (this.verdict === 'CE' || (this.interval !== undefined && this.results.length === testcases_count)) return;
		var that = this;
		this.interval = setInterval(function() {
			axios.get(`/submissions/renew?id=${submission_id}.json`)
				.then(res => {
					that.results = res.data;
				});
		}, 250);
		this.try_kill_interval();
	},

	updated: function() {
		this.try_kill_interval();
	}
});
