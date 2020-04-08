import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'

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
  actions: {}
})
