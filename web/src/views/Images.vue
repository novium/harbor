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
          md10
      >
        <material-card
          color="blue"
          title="Images"
          text="List of all images"
        >
          <v-data-table
            :headers="headers"
            :items="images"
            hide-actions
          >
            <template
              slot="headerCell"
              slot-scope="{ header }"
            >
              <span
                class="subheading font-weight-light text-grey text--darken-3"
                v-text="header.text"
              />
            </template>

            <template
              slot="items"
              slot-scope="{ index, image }"
            >
              <td>{{ images[index].RepoTags[0] }}</td>
              <td>{{ prettyBytes(images[index].Size) }}</td>
            </template>
          </v-data-table>
        </material-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<style>

</style>

<script>
import gql from 'graphql-tag'
import prettyBytes from 'pretty-bytes'

export default {
  apollo: {
    images: gql`query { 
      images { Id, RepoTags, Size } 
    }`
  },

  data: () => ({
    headers: [
      {
        sortable: false,
        text: 'Tag',
        value: 'tag'
      },
      {
        sortable: false,
        text: 'Size',
        value: 'Size'
      }
    ]
  }),

  methods: {
    prettyBytes: function(bytes) {
      return prettyBytes(bytes);
    }
  }
}
</script>
