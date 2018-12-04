import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

new Vue({
	el: '#results_view',
	data: {
		results: {},
		interval: undefined,
		verdict: 'Pending',
		point: 0,
		time: '-',
		memory: '-'
	},

	methods: {
		sub_renew() {
			var that = this
			axios.get(`/submissions/srenew?id=${submission_id}.json`)
				.then(res2 => {
					that.verdict = res2.data.verdict;
					that.time = res2.data.time;
					that.memory = res2.data.memory;
					that.point = res2.data.point;
				});
		},

		try_kill_interval() {
			if (this.verdict === 'CE' || (this.interval != undefined && this.results.length === testcases_count)) {
				clearInterval(this.interval);
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
})
