<template>
  <button @click="follow">フォローする</button>
</template>

<script>
  import axios from 'axios'
  import { csrfToken } from 'rails-ujs'

  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

  export default {
    methods: {
      follow: function(){
        axios
          .post('/users/1/follow')
          .then(() => {
          })
      }
    }
  }
</script>
