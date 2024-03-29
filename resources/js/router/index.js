import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import ControlPerceptivo from '~/router/routes/controlPerceptivo'
import Dicom from '~/router/routes/dicom'
import Facturero from '~/router/routes/facturero'
import Fas     from '~/router/routes/fas'
import General from '~/router/routes/general'
//router.addRoutes(routes: Array<RouteConfig>)

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        ...ControlPerceptivo,
        ...Dicom,
        ...Facturero,
        ...Fas,
        ...General,
    ]
})
