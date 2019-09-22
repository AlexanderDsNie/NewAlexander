<template>
    <div class="header" :style="{background:$store.state.color}" >
        <span class="one_1">首页</span>{{$store.state.title}}
    </div>
</template>

<script>
    export default {
        
    }
</script>

<style lang="scss" scoped>
    .header{
        height: 50px;
        line-height: 50px;
        background: red;
        position: fixed;
        text-align: center;
        top:0px;
        width:100%;
        color: white;
    }
    .one_1{
        position:fixed;
        top: 0;
        left: 10px;
    }
</style>