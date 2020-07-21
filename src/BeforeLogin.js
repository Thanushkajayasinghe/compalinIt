import React, {Component} from 'react';
import {View, Text, StyleSheet, Image, ImageBackground} from 'react-native';
import {Button} from 'react-native-elements';
import AsyncStorage from '@react-native-community/async-storage';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';

export default class BeforeLogin extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      dataSource: null,
      indexChecked: '0',
    };
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('lang')) == null) {
      i18n.locale = 'en';
    } else {
      i18n.locale = await AsyncStorage.getItem('lang');
    }
  }

  onAnonymousLoginClick = contextThis => {
    AsyncStorage.removeItem('username');
    AsyncStorage.setItem('LoginType','Anonymous');
    contextThis.props.navigation.navigate('SelectCategory')
  };

  render() {
    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/splashImg.jpg')}
          style={styles.imgBackground}>
          <Image style={styles.logo} source={require('./Images/qweyb.png')} />
          <View style={styles.logoContainer}>
            <Text style={styles.title}> {i18n.t('Welcome')}</Text>           
            <View>
              <Button
                title={i18n.t('Anonymous Login')}
                buttonStyle={[styles.btnStyle, styles.btn1]}
                onPress={() => this.onAnonymousLoginClick(this)}                
              />
              <Button
                title={i18n.t('Sign In')}
                buttonStyle={[styles.btnStyle, styles.btn2]}
                onPress={() => this.props.navigation.navigate('SignIn')}
              />
              <Button
                title={i18n.t('Sign Up')}
                buttonStyle={[styles.btnStyle, styles.btn3]}
                onPress={() => this.props.navigation.navigate('SignUp')}
              />
            </View>
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
    width: undefined,
    height: undefined,
  },
  logo: {
    width: wp('100%'),
    height: hp('32%'),
    marginTop: hp('6.5%'),
  },
  logoContainer: {
    alignItems: 'center',
  },
  title: {
    color: 'white',
    fontSize: hp('5%'),
    fontWeight: '700',
    marginTop: hp('3%'),
  },
  subTitle: {
    textAlign: 'center',
    paddingHorizontal: 10,
    fontWeight: '700',
    marginTop: hp('1.5%'),
  },
  btnStyle: {
    height: hp('7%'),
    width: wp('75%'),
    borderRadius: 24,
  },
  btn1: {
    marginTop: hp('6%'),
    backgroundColor: '#4a6da7',
  },
  btn2: {
    marginTop: hp('2%'),
    backgroundColor: '#00c28a',
  },
  btn3: {
    marginTop: hp('2%'),
    backgroundColor: '#f0932b',
  },
});
