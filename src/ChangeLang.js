import React, {Component} from 'react';
import {
  View,
  StyleSheet,
  Picker,
  Text,
  ImageBackground,
  TouchableOpacity,
} from 'react-native';
import {Button} from 'react-native-elements';
import {Header, Body, Title} from 'native-base';
import AsyncStorage from '@react-native-community/async-storage';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';

export default class ChangeLang extends Component {
  constructor(props) {
    super(props);

    this.state = {
      languageSelected: this.props.route.params.langSelected,     
    };

    i18n.locale = this.props.route.params.langSelected;
  }

  // async componentDidMount() {
  //   if ((await AsyncStorage.getItem('lang')) == null) {
  //     i18n.locale = 'en';
  //   } else {
  //     i18n.locale = await AsyncStorage.getItem('lang');
  //   }

  //   console.log(await AsyncStorage.getItem('lang'))
  // }

  updateUser = languageSelected => {
    this.setState({
      languageSelected,
    });

    i18n.locale = languageSelected;
    AsyncStorage.setItem('lang', languageSelected);
  };

  render() {
    const {languageSelected} = this.state;

    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/wer.jpg')}
          style={styles.imgBackground}>
          <Header style={{marginTop: hp('2%')}} transparent>
            <Body style={{alignItems: 'center'}}>
              <Title style={{color: '#000', fontSize: hp('2.8%')}}>
                {i18n.t('Change Language')}
              </Title>
            </Body>
          </Header>

          <View style={styles.containerView}>
            <View>
              <Picker
                style={styles.drpdown}
                selectedValue={languageSelected}
                onValueChange={this.updateUser}>
                <Picker.Item label="English" value="en" />
                <Picker.Item label="සිංහල" value="si" />
                <Picker.Item label="தமிழ்" value="ta" />
              </Picker>
            </View>
            <View style={{marginTop: hp('4%')}}>
              <Text style={styles.textSelLang}>
                {i18n.t('Selected Language')}: {i18n.t('English')}
              </Text>
            </View>
            <View style={{marginTop: hp('4%')}}>
              <Button
                title={i18n.t('Next')}
                titleStyle={[styles.btnNextTextStyle]}
                buttonStyle={[styles.btnNextStyle]}
                onPress={() => this.props.navigation.navigate('BeforeLogin')}
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
  containerView: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  drpdown: {
    width: wp('60%'),
    textAlign: 'center',
  },
  textSelLang: {
    fontSize: hp('3%'),
  },
  btnNextStyle: {
    width: wp('75%'),
    backgroundColor: '#2c3e50',
    height: hp('7%'),
  },
  btnNextTextStyle: {
    fontSize: hp('2.5%'),
  },
});
