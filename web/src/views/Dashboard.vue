<template>
<v-container fill-height fluid grid-list-xl>
  <v-layout wrap>
    <v-flex sm6 xs12 md6 lg3>
      <material-stats-card
        color="green"
        icon="mdi-content-copy"
        title="Nodes"
        :value="nodes_count.all.toString()"
        small-value=""
        sub-text="Add more nodes here"
        v-if="!$apollo.loading"
      />
    </v-flex>

    <v-flex sm6 xs12 md6 lg3>
      <material-stats-card
        color="blue"
        icon="mdi-content-copy"
        title="Managers"
        value="..."
        small-value=""
        sub-text="Add more managers here"
        v-if="!$apollo.loading"
      />
    </v-flex>
  </v-layout>
</v-container>

<!--  <v-container
    fill-height
    fluid
    grid-list-xl
  >
    <v-layout wrap>
      <v-flex
        sm6
        xs12
        md6
        lg3
      >
        <material-stats-card
          color="green"
          icon="mdi-content-copy"
          title="Nodes"
          :value="nodes_count.all.toString()"
          small-value=""
          sub-text="Add more nodes here"
          v-if="!$apollo.loading"
        />

        <material-stats-card
          color="orange"
          icon="mdi-content-copy"
          title="Nodes"
          value="loading"
          small-value=""
          sub-text="Add more nodes here"
          v-if="$apollo.loading"
        />

      </v-flex>
      <v-flex
        md12
        lg6
      >
        <material-card
          color="blue"
          title="Nodes"
          text="List of all nodes"
        >
          <v-data-table
            :headers="headers"
            :items="nodes"
            hide-actions
          >
            <template
              slot="headerCell"
              slot-scope="{ header }"
            >
              <span
                class="font-weight-light text-warning text--darken-3"
                v-text="header.text"
              />
            </template>
            <template
              slot="items"
              slot-scope="{ index, item }"
            > 
              <td>{{ item.description.hostname }}</td>
              <td>{{ item.spec.availability }}</td>
            </template>
          </v-data-table>
        </material-card>
      </v-flex>
    </v-layout>
  </v-container>-->
</template>

<script>
import gql from 'graphql-tag'

export default {
  apollo: {
    nodes_count: gql`query {
      nodes_count { all }
    }`,

    nodes: gql`{
      nodes { description { hostname }, spec { availability } }
    }`
  },

  data () {
    return {
      headers: [
        {
          sortable: false,
          text: 'Hostname',
          value: 'hostname'
        },

        {
          sortable: false,
          text: 'Availability',
          value: 'availability'
        }
      ],
      tabs: 0,
      list: {
        0: false,
        1: false,
        2: false
      },

      nodes_count: 'loading'
    }
  },
  methods: {

  }
}
</script>
