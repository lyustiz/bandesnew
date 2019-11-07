<template>
    <v-card :loading="loading"> 

        <v-container grid-list-xl ver>
            <v-layout wrap='false' justify-space-between>
                <slot name="fields"></slot>
            </v-layout>
        </v-container>

        <v-card-actions>
            <v-spacer></v-spacer>
                <v-tooltip bottom>
                <v-btn 
                    slot="activator"  
                    color="red darken-3"  
                    dark  small fab 
                    @click="$emit('cerrarModal')">
                    <v-icon>reply</v-icon>
                </v-btn>
                <span>Cancelar</span>
            </v-tooltip>

            <v-tooltip bottom>
                <v-btn 
                    slot="activator"  
                    color="orange darken-3"  
                    dark  small fab 
                    @click="$emit('reset')">
                    <v-icon>settings_backup_restore</v-icon>
                </v-btn>
                <span>Resetear</span>
            </v-tooltip>

            <template v-if="action==='ins'">
                <v-tooltip bottom>
                    <v-btn 
                        slot="activator" 
                        :loading:="loading" 
                        :disabled="!valid" 
                        color="success"  
                        small fab  
                        @click="$emit('store')"
                    >
                    <v-icon>save</v-icon> 
                </v-btn>
                <span>Guardar</span>
                </v-tooltip >
            </template>

            <template v-else-if="action==='upd'">
                <v-tooltip bottom>
                    <v-btn 
                        slot="activator" 
                        :loading:="loading" 
                        :disabled="!valid" 
                        color="success"  
                        small fab  
                        @click="$emit('update')"
                    >
                    <v-icon>edit</v-icon> 
                </v-btn>
                <span>Editar</span>
                </v-tooltip >
            </template>
        </v-card-actions>
    </v-card>
</template>
<script>

    export default {
        props: ['action','valid','loading',],
        data(){
            return {
            }
        },
      }
</script>
