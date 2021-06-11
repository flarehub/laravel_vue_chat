<template>
    <app-layout>
        <!-- <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard
            </h2>
        </template> -->

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="shadow-xl sm:rounded-lg flex">
                    <div class="overflow-y-scroll text-white user_manage" v-if="user.id == 1">
                        <ul class="user_list">
                            <li class="flex text-gray-600">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                                </svg>
                                <span class="text-gray-600">ユーザー</span>
                            </li>
                            <li v-for="(item, index) in user_lists" v-bind:key="index" class="user" 
                                @click="switchReceiver(item.id)"
                                :class="{'bg-yellow-100': item.id == activeIndex}"
                            >
                                <div  class="user_name">
                                    <span class="text-gray-600">{{ item.name }} </span>
                                    <span class="badge mb-3 bg-red-800 rounded-full px-2 py-1 text-center object-right-top text-white text-sm mr-1" v-if="item.msgCount">
                                        {{ item.msgCount }}
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="w-full chat-content">
                        <div class="p-6 bg-white border-b border-gray-200">
                            <div class="mt-8 text-2xl">
                                Jetstream アプリケーションへようこそ!
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
    import axios from 'axios';

    export default {
        components: {
            AppLayout,
            ChatMessages,
            ChatForm
        },
        props: ['user', 'user_list', 'progress'],

        data() {
            return {
                user_lists: {},
                messages: [],
                receiver: null,
                activeIndex: null
            }
        },

        created() {
            this.fetchMessages();

            Echo.private('chat')
                .listen('MessageSent', (e) => {
                    console.log(e.message, "message received", e.message.message)
                    if(this.user.id == e.message.receiver && this.receiver == e.message.user_id) {
                        this.messages.push({
                            message: e.message.message,
                            currentFile: e.message.currentFile,
                            currentFileName: e.message.currentFileName,
                            user: e.message.user,
                            user_id: e.message.user_id
                        });
                        this.readMessage();
                    }
                        
                    else
                        this.getUserlist();        
                });
        },
        mounted() {
            this.user_lists = this.user_list
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
                .catch(() => {

                });
            },
            switchReceiver(receiver_id) {
                this.activeIndex = receiver_id
                this.receiver = receiver_id;
                this.fetchMessages();
                this.readMessage();
                this.getUserlist();
            },
            readMessage() {
                const receiver = {receiver: this.receiver}
                axios.post('/readMessage', receiver)
                .then((response) => {

                })
            },
            getUserlist() {
                axios.get('/user_list')
                .then((response) => {
                    this.user_lists = response.data
                })
            }
        }
    }
</script>
