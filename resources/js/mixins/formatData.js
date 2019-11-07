export default {
    filters: {
        shortDate: value => value.substr(0, 10),
        formatDate: function (date) {

            if (!date) return null
            const [year, month, day] = date.split('-')
            return `${day}/${month}/${year}`
        },
        formatNumber: function (value) 
        {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        }
          
    },
    methods: {
        shortDate: value => value.substr(0, 10),
        formatDate (date) 
        { 
            if (!date) return null
            const [year, month, day] = date.split('-')
            return `${day}/${month}/${year}`
        },
        formatNumber: function (value) 
        {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        },     
        parseDate (date) {
            if (!date) return null
            const [month, day, year] = date.split('/')
            return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`
        },
        capitalize(value){
            return value.charAt(0).toUpperCase() + value.slice(1)
        },
        capitalizeSentence(value){
            return value.toLowerCase()
                    .split(' ')
                    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                    .join(' ');
        }

    }

}
