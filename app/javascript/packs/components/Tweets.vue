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
      fetchTweetsFirstAccess: function(){
        axios
          .get('tweets.json')
          .then(response => {
            this.$store.commit('setTweets', response.data)
          })
      },
      fetchCurrentUser: function(){
        axios
          .get('current_user.json')
          .then(response => {
            this.$store.commit('setUserId', response.data.id)
          })
      },
      deleteTweet: function(id){
        axios
          .delete('tweets/' + id)
          .then(() => {
            this.$store.dispatch('fetchTweets')
          })
      },
    },
    mounted: function(){
      this.fetchTweetsFirstAccess()
      this.fetchCurrentUser()
    }
  }
</script>
