import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    tweets: [],
    user_id: '',
  },
  mutations: {
    set_tweets(state, tweets){
      state.tweets = tweets
    },
    set_user_id(state, user_id){
      state.user_id = user_id
    },
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
