import React, {Component} from 'react';
import {
  View,
  Text,
  StyleSheet,
  Image,
  Dimensions,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Alert,
  ImageBackground,
} from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import AsyncStorage from '@react-native-community/async-storage';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';

export default class SignIn extends Component {
  constructor() {
    super();

    this.state = {
      showPass: true,
      press: false,
      Usrname: '',
      password: '',
    };
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('lang')) == null) {
      i18n.locale = 'en';
    } else {
      i18n.locale = await AsyncStorage.getItem('lang');
    }
  }
  
  showPass = () => {
    if (this.state.press == false) {
      this.setState({showPass: false, press: true});
    } else {
      this.setState({showPass: true, press: false});
    }
  };

  onClickListener = contextThis => {
    if (this.state.Usrname || this.state.Usrname != '') {
      if (this.state.password) {
        this.registerCall(contextThis);
      } else {
        Alert.alert(i18n.t('Please Enter Password'));
      }
    } else {
      Alert.alert(i18n.t('Please Enter Username'));
    }
  };

  registerCall(contextThis) {

    AsyncStorage.removeItem('LoginType');
    
    var that = this;
    var url = 'http://123.231.114.160:3000/signIn/';

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: this.state.Usrname,
        password: this.state.password,
      }),
    })
      .then(function(response) {
        return response.json();
      })
      .then(function(result) {
        if (result == 'usernameNotFound') {
          Alert.alert(i18n.t('Wrong Username'));
        } else if (result == 'passwordWrong') {
          Alert.alert('Wrong Password');
        } else if (result == 'passwordMatched') {
          AsyncStorage.setItem('username', that.state.Usrname);          
          contextThis.props.navigation.navigate('DrawerNav');
        }
      })
      .catch(function(error) {
        alert('result:' + error);
      });
  }

  render() {
    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/splashImg.jpg')}
          style={styles.imgBackground}>
          <KeyboardAvoidingView behavior="padding">
            <View style={{alignItems: 'center'}}>
              <Text style={styles.title}>{i18n.t('Sign In')}</Text>
              <View>
                <Icon
                  name="user"
                  size={28}
                  color={'rgba(255, 255, 255, 0.7)'}
                  style={styles.inputIcon}
                />
                <TextInput
                  style={styles.input}
                  returnKeyType="next"
                  placeholder={i18n.t('Username')}
                  placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                  onSubmitEditing={() => this.passwordInput.focus()}
                  onChangeText={Usrname => this.setState({Usrname})}
                />
              </View>

              <View>
                <Icon
                  name="lock"
                  size={28}
                  color={'rgba(255, 255, 255, 0.7)'}
                  style={styles.inputIcon}
                />
                <TextInput
                  style={styles.input}
                  returnKeyType="go"
                  secureTextEntry={this.state.showPass}
                  placeholder={i18n.t('Password')}
                  placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                  ref={input => (this.passwordInput = input)}
                  onChangeText={password => this.setState({password})}
                />
                <TouchableOpacity
                  style={styles.btnEye}
                  onPress={this.showPass.bind(this)}>
                  <Icon
                    name={this.state.press == false ? 'eye' : 'eye-slash'}
                    size={26}
                    color={'rgba(255, 255, 255, 0.7)'}
                  />
                </TouchableOpacity>
              </View>

              <TouchableOpacity
                style={styles.btnLogin}
                onPress={() => this.onClickListener(this)}>
                <Icon
                  name="lock"
                  size={28}
                  color={'rgba(255, 255, 255, 0.7)'}
                  style={styles.btnLoginIcon}
                />
                <Text style={styles.loginBtnText}>{i18n.t('Sign In')}</Text>
              </TouchableOpacity>
            </View>
          </KeyboardAvoidingView>
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
    fontSize: hp('6%'),
    fontWeight: '700',
  },
  input: {
    width: wp('90%'),
    height: hp('7.2%'),
    borderRadius: 25,
    paddingLeft: hp('7%'),
    backgroundColor: 'rgba(0,0,0,0.25)',
    marginTop: hp('2.3%'),
    fontSize: hp('2.8%'),
  },
  inputIcon: {
    position: 'absolute',
    top: hp('4%'),
    left: hp('2.3%'),
  },
  btnEye: {
    position: 'absolute',
    top: hp('4%'),
    right: hp('3%'),
  },
  btnLogin: {
    width: wp('90%'),
    height: hp('7%'),
    borderRadius: 25,
    backgroundColor: '#ffbe76',
    justifyContent: 'center',
    marginTop: hp('4%'),
  },
  loginBtnText: {
    color: '#130f40',
    fontSize: hp('3%'),
    textAlign: 'center',
    fontWeight: 'bold',
  },
  btnLoginIcon: {
    position: 'absolute',
    left: hp('15%'),
    color: 'black',
  },
});
