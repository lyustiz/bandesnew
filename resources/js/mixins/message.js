export default {
    computed:
    {
        msjTimeout(){ return this.$store.getters['msjTimeout'] }
    },
    methods: 
    {
        validResponse(respuesta){
            this.verMensaje(respuesta.data.msj)
            this.modal = false;
            this.servicios=respuesta     
            this.$emit('closeModal')    
        },
        verMensaje (message) 
        {
            this.mostrarBarraMsj(message, 'success')
        },

        verError (error) 
        {
            console.log(error.response)
            
            if(error.hasOwnProperty('response'))
            {
                if(error.response === undefined)
                {
                    this.mostrarBarraMsj( 'El servicio no Responde', 'error')
                    return
                }
            
                let status = error.response.status;
                let msj    = '';
    
                switch (status) 
                {
                    case 500:
                    msj = 'Error interno' 
                    break;
        
                    case 404:
                    msj = 'Servicio No disponible'
                    break;
                    
                    case 403:
                    msj = 'Sin autorizacion'
                    break;
        
                    case 401:
                        msj = 'Session invalida favor Ingresar nuevamente '
                        this.mostrarBarraMsj(msj, 'error')
                        setTimeout(() => {
                            axios.post('logout')
                            .then(respuesta =>{
                                if (respuesta.status==200){
                                    localStorage.removeItem("auth")
                                    window.location='/'
                                }
                            })
                            .catch(error =>{
                                this.mostrarBarraMsj( 'Error en LogOut', 'error')
                                localStorage.removeItem("auth")
                                window.location='/'
                            })
                        }, 2000);
                    break;
        
                    case 429:
                    for (var idx in error.response.data.errors) 
                    {
                        msj = msj + error.response.data.errors[idx];
                    }
                    msj = ( msj != '') ? msj :  'Servicio Ocupado favor Ingresar en unos Minutos'
                    break;
        
                    case 422:
                    for (var idx in error.response.data.errors) 
                    {
                        msj = msj + error.response.data.errors[idx];
                    }
                    break;
                    
                    case 400:
                    for (var idx in error.response.data) 
                    {
                        msj = msj + error.response.data[idx];
                    }
                    break;
        
                    default:
                    for (var idx in error.response.data) 
                    {
                        msj = msj + error.response.data[idx];
                    }
                    break;
                }
            
                this.mostrarBarraMsj( msj, 'error')
    
            }else
            {
                this.mostrarBarraMsj(error, 'error')  
            }
            
        },

        limpiarMsj () 
        {
            setTimeout( () => 
            {
                this.$store.commit('setMsjShow', false)
                this.$store.commit('setMsjText', '')
                this.$store.commit('setMsjSubText', '')
            }, this.msjTimeout)
        },

        mostrarBarraMsj (message, color) 
        {
            this.$store.commit('setMsjShow', true)
            this.$store.commit('setMsjColor', color || 'error')
    
            if (typeof message === 'string') 
            {
                this.$store.commit('setMsjText', message)
                this.limpiarMsj()
                return
            }
    
            this.$store.commit('setMsjText', message.message)
    
            if (message.response)
            {
                this.$store.commit('setMsjSubText',message.response.data.message)
            } 
            
            this.limpiarMsj()
        },
        cerrarModal(){
           this.$emit('closeModal')
           this.reset();
        },
    }
}
  