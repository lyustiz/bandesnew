import Vue      from 'vue';
import Vuetify  from 'vuetify';
import router   from './router'
import store    from './store'

Vue.use(Vuetify);

import App from './layouts/App.vue'
Vue.component('app', App)

/** Config **/
Vue.prototype.$App = Object.freeze({
    titulo:   'Bandes',
    version:  '0.1',
    baseUrl: '/api/',
    ApiUrl:   '127.0.0.1:8000/api/v1',
    debug: true,
    theme:{ 
            headPpal:    'red darkness-3',
            textPpal:    'white--text',
            headForm:    'blue darken-3',
            textForm:    'white--text',
            headList:    'blue darken-3',
            textList:    'white--text',
            headModal:   'red darkness-1',
            textModal:   'white--text'

            }
    })

/** Plugins **/
import './plugins/axios'
import './plugins/components'
import messageMixin from './mixins/message'

Vue.mixin(messageMixin);
 
const app = new Vue({
    el: '#app',
    mixins:[messageMixin],
    store,
    router
});