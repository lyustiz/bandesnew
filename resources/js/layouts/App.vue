<template>
  <v-app>

      <app-nav
        :clipped="clipped"
        :drawer="drawer"
        :miniVariant="miniVariant"
        v-on:changeClipped="clipped = !clipped"
        v-on:changeDrawer="drawer = !drawer"
        v-on:changeMiniVariant="miniVariant = !miniVariant"
      >
      </app-nav>

      <app-toolbar
        :drawer="drawer"
        :miniVariant="miniVariant"
        v-on:changeDrawer="drawer = !drawer"
        v-on:changeMiniVariant="miniVariant = !miniVariant"
      >
      </app-toolbar>

    <v-content>
        <v-container fluid>
            <router-view></router-view>
        </v-container>
    </v-content>
    
     <app-msj></app-msj>
     
    <v-footer :fixed="fixed" app>
        <span>&copy; Bandes  {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
    import AppNav from '~/layouts/AppNav'
    import AppToolbar from '~/layouts/AppToolbar'

    export default {
        components:{ 
            'app-nav': AppNav,
            'app-toolbar': AppToolbar,
        },
        created(){
            document.title = this.$App.titulo
            this.$store.commit('setUser')
        },
        data () {
            return {
                clipped: true,
                drawer: true,
                fixed: false, 
                miniVariant: false,
            }
        },
        watch:{
            $route (to, from){
                if(this.$route.name != null){
                    this.drawer = false
                }else{
                    this.drawer = true
                }
            }
        },
    }

</script>
<style>
    .v-list__tile--active {
        color:#f44336 !important; 
    }
    .v-btn--floating {
        padding: 10px !important;
    }
    .v-btn--floating .v-btn__content {
        flex: 1 0 auto;
    }
</style>
