<template>
  <div>
    <div v-for="tweet in $store.state.tweets">
      {{ tweet.body }}
      <span v-if="tweet.user_id === $store.state.user_id" @click="deleteTweet(tweet.id)">削除</span>
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
      fetchCurrentUser: function(){
        axios
          .get('current_user.json')
          .then(response => {
            this.$store.commit('set_user_id', response.data.id)
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
      this.fetchCurrentUser()
    }
  }
</script>
