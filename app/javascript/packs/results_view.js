import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

new Vue({
	el: '#results_view',
	data: {
		results: {}
	},

	beforeMount: function() {
		axios.get(`renew?id=${submission_id}.json`)
			.then(res => {
				this.results = res.data
			})
	}
})
