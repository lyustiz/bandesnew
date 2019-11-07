import rules from './rules'
import formatData from './formatData'
import messageMixin from './message'

export default {
    mixins: [rules, formatData, messageMixin],
    created() {
        this.list();
    },
    data() {

        return {

            baseUrl: this.$App.baseUrl,
            loading: false,
            modal: false,
            selected: null,
            items: [],
            item: '',
            search: '',
            action: '',
            nbAction: '',
            dialog: false,
            clear: false,
        }
    },
    computed: {
        fullUrl() {
            return this.$App.baseUrl + this.resource;
        },
        fullUrlId() {
            return this.fullUrl + '/' + this.item['id_' + this.resource]
        }
    },
    methods: {
        editForm(item) {
            this.selected = item
            this.action = 'upd'
            this.showModal();
        },
        insertForm() {
            this.selected = null
            this.action = 'ins'
            this.showModal();
        },
        showModal() {
            this.modal = true;
        },
        closeModal() {
            this.modal = false;
            this.selected = null;
            this.action = null;
            this.list()
        },
        list() {
            axios.get(this.fullUrl)
                .then(respuesta => {
                    this.items = respuesta.data
                })
                .catch(error => {
                    this.verError(error)
                })
        },
        delItem() {
            axios.delete(this.fullUrlId).then(respuesta => {

                this.verMensaje(respuesta.data.msj)
                this.item = '';
                this.dialog = false;
                this.list();

            }).catch(error => {
                this.eliminar = error
            })
        },
        delConfirm(item) {
            this.item = item;
            this.dialog = true
        }
    }

}