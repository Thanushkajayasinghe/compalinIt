import React, {Component} from 'react';
import {View, Text, StyleSheet, ImageBackground} from 'react-native';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import AsyncStorage from '@react-native-community/async-storage';

export default class Splash extends Component {

  async componentDidMount() {

    const lang = await AsyncStorage.getItem('lang');
    
    if ((lang) == null) {      
      this.timeoutHandle = setTimeout(() => {      
        this.props.navigation.navigate('ChangeLang', {
          langSelected: 'en',
        });
      }, 3000);
    } else {    
      this.timeoutHandle = setTimeout(() => {      
        this.props.navigation.navigate('ChangeLang', {
          langSelected: lang,
        });
      }, 3000);
    }
    
  }

  render() {
    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/splashImg.jpg')}
          style={styles.imgBackground}>
          <View style={styles.titleWrapper}>
            <Text style={styles.title}> ComplainIt! </Text>
          </View>
          <View style={styles.subtitleWrapper}>
            <Text style={styles.subtitle}>Design By SLIT</Text>
          </View>
        </ImageBackground>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
  },
  imgBackground: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
    alignItems: 'center',
    width: undefined,
    height: undefined,
  },
  title: {
    color: 'white',
    fontSize: hp('7%'), 
    fontWeight: 'bold',
  },
  subtitle: {
    color: 'black',
    fontSize: hp('2.4%'), 
    fontWeight: '500',
    paddingBottom: hp('1.6%'),
  },
  titleWrapper: {
    flex: 1,
    justifyContent: 'center',
  },
});
