<template>
  <v-navigation-drawer
    app
    persistent
    permament
    mobile-break-point="100"
    width="260"
  >
      <v-layout
        tag="v-list"
        column
      >
        <v-list-tile avatar>
          <v-list-tile-title class="title">
            Harbor
          </v-list-tile-title>
        </v-list-tile>

        <v-divider/>

        <v-list-tile
          v-for="(link, i) in links"
          :key="i"
          :to="link.to"
          active-class="blue lighten-5"
        >
          <v-list-tile-action>
            <v-icon>{{ link.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-title
            v-text="link.text"
          />
        </v-list-tile>
      </v-layout>
  </v-navigation-drawer>
</template>

<script>
// Utilities
import {
  mapMutations,
  mapState
} from 'vuex'

export default {
  data: () => ({
    logo: './img/vuetifylogo.png',
    links: [
      {
        to: '/dashboard',
        icon: 'mdi-view-dashboard',
        text: 'Dashboard'
      },
      {
        to: '/images',
        icon: 'mdi-view-dashboard',
        text: 'Images'
      },
      {
        to: '/swarm',
        icon: 'mdi-account',
        text: 'Swarm'
      }
    ],
    responsive: false
  }),
  computed: {
    ...mapState('app', ['image', 'color']),
    inputValue: {
      get () {
        return this.$store.state.app.drawer
      },
      set (val) {
        this.setDrawer(val)
      }
    },
    items () {
      return this.$t('Layout.View.items')
    }
  },
  mounted () {
    //this.onResponsiveInverted()
    //window.addEventListener('resize', this.onResponsiveInverted)
  },
  beforeDestroy () {
    //window.removeEventListener('resize', this.onResponsiveInverted)
  },
  methods: {
    ...mapMutations('app', ['setDrawer', 'toggleDrawer']),
    onResponsiveInverted () {
      //if (window.innerWidth < 991) {
      //  this.responsive = true
      //} else {
      //  this.responsive = false
      //}
    }
  }
}
</script>

<style lang="scss">
  #app-drawer {

  }
</style>
