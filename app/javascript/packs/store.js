import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    body: ''
  },
  mutations: {
    set_body(state, body){
      state.body = body
    }
  },
  actions: {
    set_tweet_action(context){
      axios
        .get('http://localhost:3000/tweets/54.json')
        .then(response => {
          context.commit('set_body', response.data.body)
        })
    }
  }
})
