import Vue from 'vue/dist/vue.esm.js'
import store from './store'
import Tweets from './components/Tweets'
import TweetPost from './components/TweetsPost'

new Vue({
  store,
  el: '#app',
  components: {
    Tweets,
    TweetPost
  }
})
