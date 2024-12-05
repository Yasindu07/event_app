import { StyleSheet, View, Animated, Image } from "react-native";
import React, { useEffect, useRef } from "react";

const SplashScreen = ({ navigation }) => {
  useEffect(() => {
    const timeout = setTimeout(() => {
      navigation.replace("Login");
    }, 3000);

    return () => clearTimeout(timeout); // Clear timeout if component unmounts
  }, [navigation]);

  const spinValue = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    Animated.loop(
      Animated.timing(spinValue, {
        toValue: 1,
        duration: 1500,
        useNativeDriver: true,
      })
    ).start();
  }, [spinValue]);
  const spin = spinValue.interpolate({
    inputRange: [0, 1],
    outputRange: ["0deg", "360deg"],
  });
  return (
    <View style={styles.container}> 
      <Image
        source={require('../assets/logo.png')}
        style={[styles.logo, { transform: [{ rotate: spin }] }]} 
      />

    </View>
  );
};

export default SplashScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  logo: {
    width: 300,
    height: 300,
  },
});
