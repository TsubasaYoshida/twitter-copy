import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    tweets: []
  },
  mutations: {
    set_tweets(state, tweets){
      state.tweets = tweets
    }
  },
  actions: {
    fetch_tweets(context){
      axios
        .get('tweets.json')
        .then(response => {
          context.commit('set_tweets', response.data)
        })
    }
  }
})
