<template>
    <div>
        <ul class="music-box">
            <li class="musicList"  v-for="(obj,index) in musicList" :key="index">
                <div>
                    <h2>{{obj.original_title}}</h2>
                    <p>作者：<span v-for="(author,index) in obj.authors" :key="index">{{author.name}}</span></p>
                    <p>上映时间：{{obj.year}}</p>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        data(){
            return {
                musicList:[]
            }
        },
        creat(){
            axios.get('./data/musicdata.json')
            .then((res)=>{
                this.musicList= res.data.subjects;
            }).catch((err)=>{
                console.log(err);
            })
        }     
    }
</script>

<style lang="scss" scoped>
.music-box{
    padding: 0.2rem;
    .musicList{
    }
}
</style>