<template>
    
    <v-dialog
        
        transition="slide-x-reverse-transition"
        v-model="modal"        
        persistent :overlay="false"
        max-width="1500px"
    >
        <v-card>
            <v-toolbar :color="$App.theme.headModal"  height="45%">
                 <h3>{{title}}</h3>
                    <v-spacer></v-spacer>
                    <v-btn color="white" fab small @click="$emit('closeModal')">
                        <v-icon>close</v-icon>
                    </v-btn>
            </v-toolbar>

            <v-card-text>
                <slot></slot>
            </v-card-text>
        </v-card>
    </v-dialog>
</template>

<script>
export default {
    name: 'app-modal',
    props:['modal', 'title'], 
}

</script>
<style scope>
</style>
