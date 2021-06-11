<template>
    <div class="input-group">
        <div class="flex" ref="chatForm">
            <input 
                type="file" 
                @change="selectFile" 
                style="display:none"
                ref="fileInput"
            />
            
            <span class="">
                <button id="btn-chat" @click="this.$refs.fileInput.click()" type="button" class="inline-flex items-center justify-center h-9 w-12 transition duration-500 ease-in-out text-white hover:bg-blue-400 focus:outline-none">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6 text-gray-600">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path>
                    </svg>
                </button>
            </span>
            <textarea v-model="newMessage" rows='1' id="btn-input" @keydown="autosize" ref="msgInput" type="text" name="message" class="shadow appearance-none border border-gray-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="メッセージを入力..."></textarea>
            <span class="">
                <button id="btn-chat" @click="sendMessage" type="button" class="bg-blue-500 hover:bg-blue-700 text-white ml-1 py-1 px-4 rounded">
                    送信
                </button>
            </span>
        </div>
        <span>{{currentFileName}}</span>

    </div>
</template>

<script>
    export default {
        props: ['user', 'receiver', 'progress'],

        data() {
            return {
                currentFile: undefined,
                fileInfos: [],
                newMessage: '',
                currentFileName: ''
            }
        },

        methods: {
            selectFile(file) {
                this.currentFile = file.target.files[0];
                this.currentFileName = this.currentFile.name;
            },
            
            sendMessage() {
                if(this.newMessage || this.currentFile) {
                    let today = new Date();
                    let chat_time = today.getHours() + ":" + today.getMinutes();

                    this.$emit('messagesent', {
                        user_id: this.user.id,
                        receiver: this.receiver,
                        message: this.newMessage,
                        currentFile: this.currentFile,
                        currentFileName: this.currentFileName,
                    });
                }

                this.newMessage = ''
                this.currentFileName = ''
                this.currentFile = ''
            },
            autosize() {
                var ta = this.$refs.msgInput;
                var div = this.$refs.chatForm;
                ta.style.cssText = 'height:0px';
                var height = Math.min(20 * 5, ta.scrollHeight);
                height = height > 38 ? height:38;
                div.style.cssText = 'height:' + height + 'px';
                ta.style.cssText = 'height:' + height + 'px';
            }
        },
        mounted() {
            
        }
    }
</script>
