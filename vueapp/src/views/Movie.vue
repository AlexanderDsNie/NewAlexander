<template>
    <div>
        <ul class="movie-box">
            <li class="movieList" v-for="(obj,index) in movieList" :key="index" @click="goDetail(obj.id)">
                <img :src="obj.images.medium" alt="">
                <div>
                    <h2>{{obj.original_title}}</h2>
                    <p>{{obj.collect_count}}已收藏</p>
                    <p>演员：<span v-for="(cast,index) in obj.casts" :key="index">{{cast.name}}</span></p>
                    <p>上映时间：{{obj.year}}</p>
                </div>
            </li>
        </ul>
        <img class="loading" v-show="isShow" src="@/assets/images/loading3.gif" alt="">
    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        data(){
            return {
                movieList:[],
                isShow:false,
                flag:true
            }
        },
        created(){
            this.getMovieList(this.movieList.length);
            window.onscroll = () => {
                let scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
                let clientHeight = document.documentElement.clientHeight;
                let scrollHeight = document.documentElement.scrollHeight;
                console.log(scrollHeight,scrollTop ,clientHeight);
                if( Math.abs(scrollHeight - scrollTop - clientHeight) <1 ){
                    this.getMovieList(this.movieList.length);
                }
            }
        },
        methods:{
            getMovieList(num){
                this.isShow = true;
                if(this.flag){
                    this.flag = false;
                     axios.get('https://bird.ioliu.cn/v1?url=https://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start='+num+'&count=10')
                    .then((res)=>{
                        this.movieList = [...this.movieList,...res.data.subjects];
                        this.isShow = false;
                        this.flag = true; 
                    }).catch((err)=>{
                        console.log(err);
                    })
                }
               
            },
            goDetail(id){
                // query
                this.$router.push({
                    path:'/movie/moviedetail',
                    query:{id}
                });
            }
        }
    }
            // axios.get('https://bird.ioliu.cn/v1?url=https://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10')
            // axios.get('./data/movie0.json')
            // .then((res)=>{
            //     this.movieList= res.data.subjects;
            // }).catch((err)=>{
            //     console.log(err);
            // })
            // axios.get('https://bird.ioliu.cn/v1?url=https://douban.uieee.com/v2/movie/in_theaters?start=0&count=10')
            // .then((res)=>{
            //     console.log(res.data);
            //     this.movieList = res.data.subjects;
            // }).catch((res)=>{
            //     console.log(res);
            // })
</script>

<style lang="scss" scoped>
.movie-box{
    padding: 0.2rem;
    .movieList{
        display: flex;
        img{
            width:2rem;
            margin-right:0.2rem;
        }
        margin-bottom:0.2rem;
        border-bottom: 1px solid #000;
    }
}
.loading{
    width:1.5rem;
    position: fixed;
    left:50%;
    top:50%;
    transform: translate(-50%,-50%);
}
</style>