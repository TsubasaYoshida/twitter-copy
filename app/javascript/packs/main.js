import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'

let Tweets = {
  template: '<div>{{ tweet }}</div>',
  data: function(){
    return {
      tweet: ''
    };
  },
  methods: {
    get_tweet: function(){
      axios
        .get('http://localhost:3000/tweets/1.json')
        .then(response => {
          this.tweet = response.data.body
        })
    }
  },
  mounted: function(){
    this.get_tweet()
  }
};

new Vue({
  el: '#app',
  components: {
    'my-tweets': Tweets
  }
});
