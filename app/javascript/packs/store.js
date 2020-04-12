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
    setTweets(state, tweets){
      state.tweets = tweets
    },
    setUserId(state, user_id){
      state.user_id = user_id
    },
  },
  actions: {
    fetchTweets(context){
      axios
        .get('tweets.json')
        .then(response => {
          context.commit('setTweets', response.data)
        })
    }
  }
})
