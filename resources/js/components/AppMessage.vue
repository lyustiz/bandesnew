<template>
    <v-snackbar
            :timeout="timeoutMsj"
            :color="colorMsj"
            v-model="verMsj"
            :multi-line="false"
    >
        {{ txtMsj }}
        {{ subTxtMsj }}
        <v-btn dark flat @click.native="cerrar">
          <v-icon>close</v-icon>
        </v-btn>
    </v-snackbar>
</template>

<script>

  export default {
    computed:
    {
      verMsj()
      {
        return this.$store.getters['msjShow']
      },
      txtMsj()
      {
        return this.$store.getters['msjText']
      },
      subTxtMsj()
      {
        return this.$store.getters['msjSubtext']
      },
      colorMsj()
      {
        return this.$store.getters['msjColor']
      },
      timeoutMsj()
      {
        return this.$store.getters['msjTimeout']
      }
    },
    methods: {
      cerrar () {
        this.$store.commit('setMsjShow', false)
      }
    }
  }
</script>