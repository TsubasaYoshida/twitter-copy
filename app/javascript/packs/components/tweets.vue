<template>
  <div>
    <div v-for="tweet in this.$store.state.tweets">
      {{ tweet.body }}
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    methods: {
      fetch_tweets_first: function(){
        axios
          .get('tweets.json')
          .then(response => {
            this.$store.commit('set_tweets', response.data)
          })
      }
    },
    mounted: function(){
      this.fetch_tweets_first()
    }
  }
</script>
