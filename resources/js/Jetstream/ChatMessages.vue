<template>
    <ul class="chat" ref="chat">
            
        <li class="chat-body clearfix" v-for="(message, index) in messages" :key="index">
            
            <div class="separator">{{message.chat_date}}</div>

            <div class="rightMessage" v-if="message.user_id == sender.id">
                <div class="messageBox m-4 bg-gray-600 text-gray-100">
                    <div class="header">
                        <strong class="primary-font">
                            {{ sender.name}}
                        </strong>
                    </div>
                    <p>
                        {{ message.message }}
                    </p>
                    
                    <p v-if="message.currentFile">
                        <a class="flex" target="_blank" :href="'/uploads/'+message.currentFileName+'/'+message.user_id">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6 text-gray-100">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path>
                            </svg>
                            {{message.currentFileName}}
                        </a>
                    </p>
                
                    <span class="right_chat_time text-gray-600">
                        {{message.chat_time}}
                    </span>
                </div>
            </div>

            <div class="leftMessage" v-else>
                
                <div class="messageBox m-4 bg-gray-200 text-gray-600">
                    <span class="left_msg_user">
                        <button type="button" class="inline-flex items-center justify-center rounded-full h-12 w-12 transition duration-500 ease-in-out text-white bg-gray-500 hover:bg-blue-400 focus:outline-none">
                            {{ message.user.name }}
                        </button>
                    </span>

                    <div class="header">
                        <strong class="primary-font">
                            {{ message.user.name }}
                        </strong>
                    </div>
                    <p>
                        {{ message.message }}
                    </p>
                    <p v-if="message.currentFile != ''">
                        <a class="flex" target="_blank" :href="'/uploads/'+message.currentFileName+'/'+message.user_id">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6 text-gray-600">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path>
                            </svg>
                            {{message.currentFileName}}
                        </a>
                    </p>
                
                    <span class="left_chat_time">
                        {{message.chat_time}}
                    </span>

                </div>
            </div>
        </li>

    </ul>
</template>

<script>
export default {
  props: ['messages', 'sender', 'receiver_id'],
  updated() {
    this.$nextTick(() => this.scrollToEnd());
  },
  mounted() {
    this.scrollToEnd();
    console.log(this.messages, "messages")
  },
  methods: {
      scrollToEnd() {
        var container = this.$refs.chat;
        container.scrollTop = container.scrollHeight;
      }
  }
};
</script>