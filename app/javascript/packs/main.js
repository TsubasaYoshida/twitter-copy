import Vue from 'vue/dist/vue.esm.js'
import Tweets from './components/tweets'
import TweetPost from './components/tweets_post'

new Vue({
  el: '#app',
  components: {
    'my-tweets': Tweets,
    'my-tweet-post': TweetPost
  }
})
