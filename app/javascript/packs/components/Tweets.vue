<template>
  <div>
    <div v-for="tweet in $store.state.tweets" class="tweet-item">
      <div class="tweet-item__body">{{ tweet.body }}</div>
      <div>
        <button v-if="deletable(tweet)" @click="deleteTweet(tweet)" class="tweet-item__delete">削除</button>
        <button v-else class="tweet-item__delete__disabled">削除</button>
      </div>
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
      deleteTweet: function(tweet){
        axios
          .delete('tweets/' + tweet.id)
          .then(() => {
            this.$store.dispatch('fetchTweets')
          })
      },
      deletable: function(tweet){
        return tweet.user_id === this.$store.state.user_id
      },
    },
    mounted: function(){
      this.fetchTweetsFirstAccess()
      this.fetchCurrentUser()
    }
  }
</script>

<style>
  .tweet-item {
    background-color: #FFF;
    padding: 24px;
    border: solid 1px #333;
  }

  .tweet-item:not(:first-child) {
    border-top: none;
  }

  .tweet-item__body {
    margin-bottom: 16px;
  }

  .tweet-item__delete {
    cursor: pointer;
    color: #FFF;
    background-color: #fc5c65;
    padding:  5px 8px;
    border-radius: 4px;
    border: none;
  }

  .tweet-item__delete__disabled {
    cursor: not-allowed;
    color: #FFF;
    background-color: #333;
    opacity: .5;
    padding: 5px 8px;
    border-radius: 4px;
    border: none;
  }
</style>
