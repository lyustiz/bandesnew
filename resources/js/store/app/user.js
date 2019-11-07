export default 
{
    state(){
        return{
            user: null
        }
    },

    getters: 
    {
        getUser: state => state.user,
    },

    mutations: 
    {
        setUser (state)
        {
            state.user 	= JSON.parse(localStorage.getItem("user"))
        },
    }
}
