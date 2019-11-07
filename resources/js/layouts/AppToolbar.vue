<template>
    <v-toolbar
      :clipped-left="$vuetify.breakpoint.mdAndUp" 
      :color="$App.theme.headPpal" 
      dark 
      fixed 
      app 
    >
        <v-btn 
        flat small
        @click="$router.push('/')"
        >
            <v-toolbar-title 
            class="sansserif" 
            v-text="$App.titulo"
            >
            </v-toolbar-title>
        </v-btn>

        {{$App.name}}
        <v-btn icon @click.stop="$emit('changeMiniVariant')">
            <v-icon 
            v-html="miniVariant ? 'chevron_right' : 'chevron_left'"
            >
            </v-icon>
        </v-btn> 

        <v-toolbar-side-icon 
        @click="$emit('changeDrawer')"
        >
        </v-toolbar-side-icon>
        
        <v-spacer></v-spacer>

        <app-user></app-user>

        <v-btn icon >
            <v-icon>help</v-icon>
        </v-btn>
        <v-btn icon >
            <v-icon>notification_important</v-icon>
        </v-btn>

        <v-form @submit.prevent="logout()">
            <v-btn icon type="submit">
                <v-icon >exit_to_app</v-icon>
            </v-btn>
        </v-form>   

    </v-toolbar>
</template>
<script>
    import AppUser from '~/layouts/AppUser'
    import formatData from '~/mixins/formatData'

    export default {
        components:{ 
            'app-user': AppUser,
        },
        mixins:[formatData],
        props: ['drawer','miniVariant'],
        data(){
            return {
            }
        },
        methods:{
            logout()
            {
                axios.post('logout')
                .then(respuesta =>{
                    // console.log(respuesta)
                    if (respuesta.status==200){
                        localStorage.removeItem("auth")
                        window.location = '/'
                    }
                })
                .catch(error =>{
                    this.test=error
                })
            }
        }
    }
</script>
<style>
    .serif {
        font-family: "Times New Roman", Times, serif;
    }
    .sansserif {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 1.875em; 
        font-weight: bold;
    }
</style>