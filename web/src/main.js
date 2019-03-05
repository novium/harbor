// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'

import { ApolloClient } from 'apollo-client'
import { createHttpLink } from 'apollo-link-http'
import { hasSubscription } from '@jumpn/utils-graphql'
import { InMemoryCache } from 'apollo-cache-inmemory'
import absintheSocketLink from './apollo/absinthe-socket'
import VueApollo from 'vue-apollo'
import { split } from 'apollo-link'

// Components
import './components'

// Plugins
import './plugins'

// Sync router with store
import { sync } from 'vuex-router-sync'

// Application imports
import App from './App'
import i18n from '@/i18n'
import router from '@/router'
import store from '@/store'

// Sync store with router
sync(store, router)

Vue.config.productionTip = false

const link = split(
  operation => hasSubscription(operation.query),
  absintheSocketLink,
  createHttpLink({ uri: 'http://localhost:4000/graphql' })
)

const apolloClient = new ApolloClient({
  link: link,
  cache: new InMemoryCache()
})

Vue.use(VueApollo)

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

/* eslint-disable no-new */
new Vue({
  i18n,
  router,
  store,
  apolloProvider,
  render: h => h(App)
}).$mount('#app')
