<template>
  <div>
    <form>
      <input placeholder="いまどうしてる？" type="text" v-model="tweet.body">
      <input type="button" v-bind:disabled="disabled" v-on:click="createTweet" value="ツイート">
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
          body: ''
        }
      }
    },
    computed: {
      disabled: function(){
        return this.tweet.body.length === 0
      }
    },
    methods: {
      createTweet: function(){
        axios
          .post('tweets', {
            tweet: this.tweet
          })
          .then(() => {
            this.tweet.body = ''
            this.$store.dispatch('fetchTweets')
          })
      }
    }
  }
</script>
