<template>
    <app-layout>
        <!-- <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard
            </h2>
        </template> -->

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg flex">
                    <div class="w-full chat-content">
                        <div class="p-6 bg-white border-b border-gray-200">
                            <div class="mt-8 text-2xl">
                                Welcome to your Jetstream application!
                            </div>
                            <div class="mt-6 text-gray-500 chatMessageContent" ref="chatMessageContent">
                                <ChatMessages :messages="messages" :sender="user" :receiver="receiver" />
                            </div>
                        </div>
                        <div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-1">
                            <div class="p-6">
                                <div class="text-lg text-gray-600 leading-7 font-semibold">
                                    <ChatForm v-on:messagesent = "addMessage" :user="user" :receiver="receiver" :progress="progress" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </app-layout>
</template>

<script>
    import AppLayout from '@/Layouts/AppLayout'
    import ChatMessages from '@/Jetstream/ChatMessages'
    import ChatForm from '@/Jetstream/ChatForm'
    import UploadService from "../Services/UploadFilesService"

    export default {
        components: {
            AppLayout,
            ChatMessages,
            ChatForm
        },
        props: ['user', 'user_list', 'progress'],

        data() {
            return {
                messages: [],
                receiver: 1
            }
        },

        created() {
            this.fetchMessages();
            console.log(this.user_list, "userlist")
            Echo.private('chat')
                .listen('MessageSent', (e) => {
                    console.log(e.message.message, "e.message", e.message)
                if(this.user.id == e.message.receiver)
                    this.messages.push({
                        message: e.message.message,
                        currentFile: e.message.currentFile,
                        currentFileName: e.message.currentFileName,
                        user: e.message.user,
                        user_id: e.message.user_id
                    });
                });
        },
        methods: {
            fetchMessages() {
                axios.get('/messages?user_id='+this.user.id+"&receiver_id="+this.receiver).then(response => {
                    this.messages = response.data;
                });
            },
            addMessage(message) {
                UploadService.upload(message, (event) => {

                })
                .then((response) => {
                    this.messages.push(message);
                })
            },
            switchReceiver(receiver_id) {
                this.receiver = receiver_id;
                this.fetchMessages();
            }
        }
    }
</script>
