import React, {Component} from 'react';
import {
  View,
  Text,
  StyleSheet,
  Alert,
  TextInput,
  TouchableOpacity,
  ImageBackground,
} from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import AwesomeAlert from 'react-native-awesome-alerts';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';
import AsyncStorage from '@react-native-community/async-storage';

export default class SignUp extends Component {
  constructor() {
    super();

    this.state = {
      showAlert: false,
      showPass: true,
      press: false,
      showPassCon: true,
      pressCon: false,
      Username: '',
      Pass: '',
      ConfirmPass: '',
      Email: '',
      Tel: '',
    };
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('lang')) == null) {
      i18n.locale = 'en';
    } else {
      i18n.locale = await AsyncStorage.getItem('lang');
    }
  }

  showAlert = () => {
    this.setState({
      showAlert: true,
    });
  };

  hideAlert = () => {
    this.setState({
      showAlert: false,
    });
  };

  onClickListener = contextThis => {
    if (this.state.Username || this.state.Username != '') {
      if (this.state.Pass) {
        if (this.state.Pass == this.state.ConfirmPass) {
          this.registerCall(contextThis);
        } else {
          Alert.alert(i18n.t('Password and Confirm Password not matching!'));
        }
      } else {
        Alert.alert(i18n.t('Please Enter Password'));
      }
    } else {
      Alert.alert(i18n.t('Please Enter Username'));
    }
  };

  registerCall(contextThis) {
    var that = this;
    var url = 'http://123.231.114.160:3000/signUp/';

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        Username: this.state.Username,
        ConfirmPass: this.state.ConfirmPass,
        Email: this.state.Email,
        Tel: this.state.Tel,
      }),
    })
      .then(function(response) {
        return response.json();
      })
      .then(function(result) {
        console.log(result);
        if (result == 'UsernameAlreadyExists') {
          Alert.alert(i18n.t('Username Alreay Taken!'));
        } else if (result == 'successfullyUserCreated') {
          contextThis.showAlert();
        }
      })
      .catch(function(error) {
        alert('result:' + error);
      });
  }

  showPass = () => {
    if (this.state.press == false) {
      this.setState({showPass: false, press: true});
    } else {
      this.setState({showPass: true, press: false});
    }
  };

  showPassCon = () => {
    if (this.state.pressCon == false) {
      this.setState({showPassCon: false, pressCon: true});
    } else {
      this.setState({showPassCon: true, pressCon: false});
    }
  };

  render() {
    const {showAlert} = this.state;

    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/splashImg.jpg')}
          style={styles.imgBackground}>
          <View style={{alignItems: 'center'}}>
            <Text style={styles.title}>{i18n.t('Sign Up')}</Text>
            <View>
              <Icon
                name="user"
                size={28}
                color={'rgba(255, 255, 255, 0.7)'}
                style={styles.inputIcon}
              />
              <TextInput
                style={styles.input}
                placeholder={i18n.t('Username')}
                placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                onChangeText={Username => this.setState({Username})}
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
                secureTextEntry={this.state.showPass}
                placeholder={i18n.t('Password')}
                placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                onChangeText={Pass => this.setState({Pass})}
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

            <View>
              <Icon
                name="lock"
                size={28}
                color={'rgba(255, 255, 255, 0.7)'}
                style={styles.inputIcon}
              />
              <TextInput
                style={styles.input}
                secureTextEntry={this.state.showPassCon}
                placeholder={i18n.t('Confirm Password')}
                placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                onChangeText={ConfirmPass => this.setState({ConfirmPass})}
              />
              <TouchableOpacity
                style={styles.btnEye}
                onPress={this.showPassCon.bind(this)}>
                <Icon
                  name={this.state.pressCon == false ? 'eye' : 'eye-slash'}
                  size={26}
                  color={'rgba(255, 255, 255, 0.7)'}
                />
              </TouchableOpacity>
            </View>

            <View>
              <Icon
                name="envelope-o"
                size={28}
                color={'rgba(255, 255, 255, 0.7)'}
                style={styles.inputIcon}
              />
              <TextInput
                style={styles.input}
                placeholder={i18n.t('Email')}
                placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                onChangeText={Email => this.setState({Email})}
              />
            </View>

            <View>
              <Icon
                name="phone"
                size={28}
                color={'rgba(255, 255, 255, 0.7)'}
                style={styles.inputIcon}
              />
              <TextInput
                style={styles.input}
                placeholder={i18n.t('Telephone')}
                placeholderTextColor={'rgba(255, 255, 255, 0.7)'}
                onChangeText={Tel => this.setState({Tel})}
              />
            </View>

            <TouchableOpacity
              style={styles.btnLogin}
              onPress={() => this.onClickListener(this)}>
              <Icon
                name="floppy-o"
                size={28}
                color={'rgba(255, 255, 255, 0.7)'}
                style={styles.btnLoginIcon}
              />
              <Text style={styles.loginBtnText}>{i18n.t('Sign Up')}</Text>
            </TouchableOpacity>
          </View>

          <AwesomeAlert
            show={showAlert}
            showProgress={false}
            title={i18n.t('Successfully Registered!')}
            message={i18n.t('You will be redirect to the Sign In!')}
            closeOnTouchOutside={true}
            closeOnHardwareBackPress={false}
            showCancelButton={false}
            showConfirmButton={true}
            confirmText="Ok"
            confirmButtonColor="#DD6B55"
            onConfirmPressed={() => {
              this.props.navigation.navigate('BeforeLogin');
            }}
          />
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
    fontSize: hp('5.5%'),
    fontWeight: '700',
  },
  input: {
    width: wp('90%'),
    height: hp('7.2%'),
    borderRadius: 25,
    paddingLeft: hp('7%'),
    backgroundColor: 'rgba(0,0,0,0.25)',
    marginTop: hp('2%'),
    fontSize: hp('2.5%'),
  },
  inputIcon: {
    position: 'absolute',
    top: hp('3.8%'),
    left: hp('2'),
  },
  btnEye: {
    position: 'absolute',
    top: hp('3.8%'),
    right: hp('2.8%'),
  },
  btnLogin: {
    width: wp('90%'),
    height: hp('6.8%'),
    borderRadius: 25,
    backgroundColor: '#ffbe76',
    justifyContent: 'center',
    marginTop: hp('5%'),
  },
  loginBtnText: {
    color: '#130f40',
    fontSize: hp('2%'),
    textAlign: 'center',
    fontWeight: 'bold',
  },
  btnLoginIcon: {
    position: 'absolute',
    left: hp('11.5%'),
    color: 'black',
  },
});
