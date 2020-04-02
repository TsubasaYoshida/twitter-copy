<template>
  <div>
    <form class="col">
      <input placeholder="いまどうしてる？" type="text" v-model="tweet.body">
      <button v-on:click="createBook">ツイート</button>
    </form>
  </div>
</template>

<script>
  import axios from 'axios'
  import { csrfToken } from 'rails-ujs'

  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

  export default {
    data: function(){
      return {
        tweet: {
          body: '',
          user_id: 1
        }
      }
    },
    methods: {
      createBook: function(){
        if (!this.tweet.body) return
        axios
          .post('/tweets', {
            tweet: this.tweet
          })
          .then((response) => {
          }, (error) => {
            console.log(error)
          })
      }
    }
  }
</script>
