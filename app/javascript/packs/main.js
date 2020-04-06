import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import Tweets from './components/tweets'
import TweetPost from './components/tweets_post'

Vue.use(Vuex)

new Vue({
  el: '#app',
  components: {
    'my-tweets': Tweets,
    'my-tweet-post': TweetPost
  }
})
