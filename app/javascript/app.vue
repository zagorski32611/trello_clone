<template>
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <list v-for="(list, index) in lists"></list>
  </draggable>
</template>

<script>
import draggable from 'vuedraggable'
import list from 'components/list'

export default {
  components: { draggable , list},

  props: ["original_lists"],

  data: function() {
    return {
      lists: this.original_lists
    }
  },

  methods: {
    cardMoved: function(event) {
      const evt = event.added || event.moved 
      if (evt == undefined) { return }
      const element = evt.element
      const list_index = this.lists.findIndex((list) => {
        return list.cards.find((card) => {
          return card.id === element.id
        })
      })

      var data = new FormData
      data.append("card[list_id]", this.lists[list_index].id)
      data.append("card[position]", evt.newIndex + 1)

      Rails.ajax({
        url: `/cards/${element.id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json"
      })
    },


    listMoved: function(event) {
      var data = new FormData
      data.append("list[position]", event.newIndex + 1)

      Rails.ajax({
        url: `/lists/${this.lists[event.newIndex].id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json"
      })
    },

  }
}
</script>

<style scoped>
.dragArea {
  min-height: 10px;
}
p {
  font-size: 2em;
  text-align: center;
}
.board {
  overflow-x: auto;
  white-space: nowrap;
}

</style>
