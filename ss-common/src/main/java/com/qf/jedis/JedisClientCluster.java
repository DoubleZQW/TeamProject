package com.qf.jedis;

import redis.clients.jedis.JedisCluster;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * User: DHC
 * Date: 2018/1/19
 * Time: 10:19
 * Version:V1.0
 */
public class JedisClientCluster implements JedisClient {

    private JedisCluster jedisCluster;

    public JedisCluster getJedisCluster() {
        return jedisCluster;
    }

    public void setJedisCluster(JedisCluster jedisCluster) {
        this.jedisCluster = jedisCluster;
    }

    @Override
    public String set(String key, String value) {
        return jedisCluster.set(key,value);
    }

    @Override
    public String get(String key) {
        return jedisCluster.get(key);
    }

    @Override
    public Boolean exists(String key) {
        return jedisCluster.exists(key);
    }

    @Override
    public Long expire(String key, int seconds) {
        return jedisCluster.expire(key,seconds);
    }

    @Override
    public Long ttl(String key) {
        return jedisCluster.ttl(key);
    }

    @Override
    public Long incr(String key) {
        return jedisCluster.incr(key);
    }

    @Override
    public Long del(String key) {
        return jedisCluster.del(key);
    }

    @Override
    public Long hset(String key, String field, String value) {
        return jedisCluster.hset(key,field,value);
    }

    @Override
    public String hget(String key, String field) {
        return jedisCluster.hget(key,field);
    }

    @Override
    public Long hdel(String key, String... field) {
        return jedisCluster.hdel(key,field);
    }

    @Override
    public Boolean hexists(String key, String field) {
        return jedisCluster.hexists(key,field);
    }

    @Override
    public List<String> hvals(String key) {
        return jedisCluster.hvals(key);
    }

    @Override
    public Set<String> hkeys(String key) {
        return jedisCluster.hkeys(key);
    }

    @Override
    public String hmset(String key, Map<String, String> map) {
        return jedisCluster.hmset(key,map);
    }

    @Override
    public List<String> hmget(String key, String... field) {
        return jedisCluster.hmget(key,field);
    }

    @Override
    public Long lpush(String key, String... value) {
        return jedisCluster.lpush(key,value);
    }
}
