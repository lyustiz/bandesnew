import Vue  from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import message      from '../store/app/message'
import user         from '../store/app/user'
import appDataTable from '../store/app/appDataTable'

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    message,
    user,
    appDataTable
  },
  strict: debug
})
