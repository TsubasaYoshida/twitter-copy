import Vue from 'vue/dist/vue.esm.js'
import Tweets from './components/tweets'

new Vue({
  el: '#app',
  components: {
    'my-tweets': Tweets
  }
})
