// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "navbar"
// import "meatball"

import * as Vue from "vue";

const App = Vue.createApp({
    data(){
        return {
            text: 'Hello Vue'
        }
    },
})

App.mount("#app");