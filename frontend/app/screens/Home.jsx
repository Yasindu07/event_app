import { View, Text, SafeAreaView, Pressable, StyleSheet, Alert } from 'react-native'
import React from 'react'

export default function Home() {
  return (
    <SafeAreaView style={styles.container}>
      
      <View style={styles.logo}>
        <Text style={{ textAlign: 'center', fontSize: 30, color: 'white', fontWeight: 'bold' }}>Welcome to the Home Screen</Text>
      </View>
      <View style={styles.card}>
        <Pressable style={styles.button} onPress={()=>Alert.alert("Hello World")}>
            <Text>Register</Text>
        </Pressable>
        <Pressable style={styles.button} onPress={()=>Alert.alert("Hello World")}>
            <Text>Login</Text>
        </Pressable>
      </View>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
    container:{
        backgroundColor: 'aqua',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        flex: 1,
        paddingVertical: 10
    },
    logo:{
        width: '100%',
        height: '50%',
        marginTop: 50,
        marginHorizontal: 15
    },
    button: {
        padding: 10,
        marginBottom: 15,
        marginHorizontal: 20,
        backgroundColor: '#007bff',
        borderRadius: 10
    },
})