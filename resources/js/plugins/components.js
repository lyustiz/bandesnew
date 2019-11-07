import Vue from 'vue';
import Login from '~/components/AppLogin'
import AppMessage from '~/components/AppMessage'
import AppModal from '~/components/AppModal'
import AppForm from '~/components/AppForm'
import AppDataTable from '~/components/AppDataTable'
import AppIconButtom from '~/components/AppIconButtom'
import AppAutocomplete from '~/components/AppAutocomplete'
import AppSteeper from '../components/AppSteeper'

Vue.component('app-login', Login);
Vue.component('app-modal', AppModal);
Vue.component('app-msj', AppMessage);
Vue.component('app-form', AppForm);
Vue.component('app-data-table', AppDataTable);
Vue.component('app-icon-buttom', AppIconButtom);
Vue.component('app-auto-complete', AppAutocomplete);
Vue.component('app-steeper', AppSteeper);