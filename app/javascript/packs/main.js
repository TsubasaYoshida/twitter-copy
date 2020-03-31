import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'

Vue.component('Tweets', {
  template: '<div>{{ tweet }}</div>'
});

new Vue({
  el: '#app',
  data: {
    tweet: ''
  },
  methods: {
    get_tweet: function(){
      axios
        .get('http://localhost:3000/tweets/1.json')
        .then(response => {
          console.log(response.data);
          this.tweet = response.data.body
        })
    }
  },
  mounted: function(){
    this.get_tweet()
  }
});
