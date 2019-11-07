import rules from './rules'
import formatData from './formatData'
import selectMixin from './select'
import messageMixin from './message'

export default {
    mixins: [rules, formatData, selectMixin, messageMixin],
    created() {
        this.fillSelects()
    },
    data() {
        return {
            valid: true,
            loading: true,
            calendar: false,
        }
    },
    props: {
        item: {
            type: Object,
            default: null
        },
        action: {
            type: String,
            default: null
        }

    },
    watch: {
        action(value) {
            this.mapForm()
        },
    },
    computed: {
        fullUrl() {
            return this.$App.baseUrl + this.resource;
        },
        fullUrlId() {
            return this.fullUrl + '/' + this.item['id_' + this.resource]
        },
    },
    methods: {
        mapForm() {
            if (this.item) {
                for (var key in this.item) {
                    if (this.form.hasOwnProperty(key)) {
                        if (key.includes('fe_') && this.item[key].length > 10) {
                            this.form[key] = this.item[key].substr(0, 10)
                        } else {
                            this.form[key] = this.item[key]
                        }
                    }
                }
            } else {
                this.reset()
            }

        },
        store() {
            if (this.$refs.form.validate()) {
                this.loading = true;
                axios.post(this.fullUrl, this.form)
                    .then(respuesta => {

                        this.validResponse(respuesta)

                    }).catch(error => {
                        this.verError(error);
                    })
            }
        },
        update() {
            if (this.$refs.form.validate()) {
                this.loading = true;
                axios.put(this.fullUrlId, this.form)
                    .then(respuesta => {
                        this.validResponse(respuesta)
                    }).catch(error => {
                        this.verError(error);
                    })
            }
        },
        reset() {
            this.$refs.form.reset();
        },
    }
}