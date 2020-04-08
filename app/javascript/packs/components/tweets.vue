<template>
  <div>{{this.$store.state.body}}</div>
</template>

<script>
  import axios from 'axios'

  export default {
    methods: {
      set_tweet: function(){
        axios
          .get('http://localhost:3000/tweets/6.json')
          .then(response => {
            this.$store.commit('set_body', response.data.body)
          })
      }
    },
    mounted: function(){
      this.set_tweet()
    }
  }
</script>
