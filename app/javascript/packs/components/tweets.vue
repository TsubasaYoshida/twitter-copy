<template>
  <div>{{ tweet }}</div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function(){
      return {
        tweet: ''
      }
    },
    methods: {
      get_tweet: function(){
        axios
          .get('http://localhost:3000/tweets/1.json')
          .then(response => {
            this.tweet = response.data.body
          })
      }
    },
    mounted: function(){
      this.get_tweet()
    }
  }
</script>
