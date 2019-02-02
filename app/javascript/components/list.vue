<template>
    <div class="list">
      <h6>{{ list.name }}</h6>
      <hr />
      <draggable v-model="list.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
        <div v-for="(card, index) in list.cards" class="card card-body mb-3">
          {{ card.name }}
        </div>
      </draggable>
      <div class="card card-body">
        <textarea class="form-control" v-model="message"></textarea>
        <button v-on:click="submitMessages(list.id)" class="btn btn-secondary">Save</button>
      </div>
    </div>
</template>


<script>
export default {
    props: ["list"]

    data function() {
        return {
            message: ""
        }
    },
    
    methods: { 
        submitMessages: function() {
          var data = new FormData
          data.append("card[list_id]", this.list.id)
          data.append("card[name]", this.messages)
        }

          Rails.ajax({
            url: `/cards/${element.id}/move`,
            type: "PATCH",
            data: data,
            dataType: "json"
          })
        },

}
</script>

<style scoped>
.dragArea {
  min-height: 10px;
}
.list {
  background: #e2e4e6;
  border-radius: 3px;
  display: inline-block;
  margin-right: 10px;
  padding: 10px;
  vertical-align: top;
  width: 270px;
}
</style>
