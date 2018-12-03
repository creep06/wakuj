import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

new Vue({
	el: '#results_view',
	data: {
		results: {},
		interval: undefined,
		verdict: def_verdict,
		point: def_point,
		time: def_time,
		memory: def_memory
	},

	mounted: function() {
		var that = this
		this.interval = setInterval(function() {
			axios.get(`renew?id=${submission_id}.json`)
				.then(res => {
					that.results = res.data
				})
			if (that.interval != undefined && that.results.length === testcases_count) {
				clearInterval(that.interval)
				// db更新が間に合わない可能性があるからちょっと待つ
				// ページ開いた時点でjudge済みだったら待たない
				setTimeout(function() {
						axios.get(`srenew?id=${submission_id}.json`)
						.then(res2 => {
							console.log(res2.data.verdict)
							that.verdict = res2.data.verdict
							that.time = res2.data.time
							that.memory = res2.data.memory
							that.point = res2.data.point
						})}, that.verdict==='Pending' ? 1000 : 0)
			}
		}, 100)
	}
})
