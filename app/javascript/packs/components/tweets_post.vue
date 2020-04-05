<template>
  <div>
    <form>
      <input placeholder="いまどうしてる？" type="text" v-model="tweet.body">
      <input type="button" v-on:click="createTweet" value="ツイート">
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
      createTweet: function(){
        if (!this.tweet.body) return
        axios
          .post('/tweets', {
            tweet: this.tweet
          })
          .then((response) => {
            this.tweet.body = ''
          }, (error) => {
            console.log(error)
          })
      }
    }
  }
</script>
