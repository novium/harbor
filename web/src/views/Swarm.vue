<template>
  <v-container
    fill-height
    fluid
    grid-list-xl
  >
      <v-layout
      justify-center
      wrap
    >
  <v-flex
          md12
      >
    <v-tabs
      fixed-tabs
      hide-slider
      color="rgba(0,0,0,0)"
      >
      <v-tab key="overview">
        Overview
      </v-tab>

      <v-tab key="create">
        Create
      </v-tab>

      <v-tab key="add">
        Add Server
      </v-tab>

      <v-tab-item reverse-transition="fade" transition="fade" key="overview">
        Hello!
      </v-tab-item>

      <v-tab-item reverse-transition="fade" transition="fade" key="create">
        create!
      </v-tab-item>
    </v-tabs>
  </v-flex>
      </v-layout>
  </v-container>
</template>

<style scoped>

</style>

<script>
import {
  mapMutations,
  mapState
} from 'vuex'

export default {
  data: () => ({
    tabs: [
    ]
  }),

  computed: {
    ...mapState('app', ['image', 'color']),
  }
}
</script>
