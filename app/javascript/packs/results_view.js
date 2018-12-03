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

	mounted: function() {
		var that = this
		// とりあえず1回更新
		var sub_renew = function() {
			axios.get(`/submissions/srenew?id=${submission_id}.json`)
				.then(res2 => {
					that.verdict = res2.data.verdict
					that.time = res2.data.time
					that.memory = res2.data.memory
					that.point = res2.data.point
				})
		}
		sub_renew
		if (this.verdict != 'Pending') return 0
		// ジャッジ終了までgetしまくる
		this.interval = setInterval(function() {
			axios.get(`/submissions/renew?id=${submission_id}.json`)
				.then(res => {
					that.results = res.data
				})
			if (that.interval != undefined && that.results.length === testcases_count) {
				clearInterval(that.interval)
				// db更新が間に合わない可能性があるからちょっと待つ
				setTimeout(sub_renew, 1000)
			}
		}, 100)
	}
})
