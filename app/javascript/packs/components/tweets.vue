<template>
  <div>
    <div v-for="tweet in this.$store.state.tweets">
      {{ tweet.body }}
      <span @click="deleteTweet(tweet.id)">削除</span>
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
      },
      deleteTweet: function(id){
        axios
          .delete('tweets/' + id)
          .then(() => {
            this.$store.dispatch('fetch_tweets')
          })
      },
    },
    mounted: function(){
      this.fetch_tweets_first()
    }
  }
</script>
