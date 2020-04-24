import Vue from 'vue/dist/vue.esm.js'
import store from './store'
import FollowButton from './components/FollowButton'

new Vue({
  store,
  el: '#app',
  components: {
    FollowButton
  }
})
