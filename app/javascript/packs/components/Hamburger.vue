<template>
  <div>
    <button class="hamburger-button" type="button" name="button" @click="show">
      <span class="top"></span>
      <span class="middle"></span>
      <span class="bottom"></span>
    </button>
    <transition>
      <nav id="gnav" class="nav" v-if="gnav">
        <div class="nav__body">
          <ul class="nav__lst">
            <li class="nav__item"><a>Works</a></li>
            <li class="nav__item"><a>Blog</a></li>
            <li class="nav__item"><a>People</a></li>
            <li class="nav__item"><a>Recruit</a></li>
            <li class="nav__item"><a>Company</a></li>
            <li class="nav__item"><a>Contact</a></li>
          </ul>
        </div>
      </nav>
    </transition>
  </div>
</template>

<script>
  export default {
    data: function(){
      return {
        gnav: false
      }
    },
    methods: {
      show: function(e){
        let elm = e.currentTarget
        let className = elm.className
        if (className.indexOf('is-open') !== -1) {
          this.gnav = false
          elm.className = 'hamburger-button'
        } else {
          this.gnav = true
          elm.className += " is-open"
        }
      }
    }
  }
</script>

<style>
  .hamburger-button {
    display: block;
    width: 50px;
    height: 50px;
    background-color: transparent;
    border: none;
    position: relative;
    z-index: 100;
    appearance: none;
    cursor: pointer;
    outline: none;
  }

  .hamburger-button.is-open .top {
    transform: rotate(45deg);
  }

  .hamburger-button.is-open .middle {
    opacity: 0;
  }

  .hamburger-button.is-open .bottom {
    transform: rotate(-45deg);
  }

  .hamburger-button span {
    display: block;
    width: 20px;
    height: 1px;
    margin: auto;
    background-color: #000;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    transition: 0.5s ease;
  }

  .hamburger-button span.top {
    transform: translateY(-6px);
  }

  .hamburger-button span.bottom {
    transform: translateY(6px);
  }

  .nav {
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #d1dde3;
    overflow-y: scroll;
    z-index: 99;
  }

  .nav.v-enter, .nav.v-leave-to {
    opacity: 0;
  }

  .nav.v-enter-to, .nav.v-leave {
    opacity: 1;
  }

  .nav.v-enter-active, .nav.v-leave-active {
    transition: opacity 1s ease;
  }

  .nav__body {
    padding: 40px;
  }

  .nav__lst {
    list-style: none;
  }

  .nav__item {
    font-size: 24px;
    line-height: 1.5;
    font-weight: 700;
  }

  .nav__item ~ .nav__item {
    margin-top: 8px;
  }

  .nav__item a {
    color: #000;
    padding: 8px 0;
  }
</style>
