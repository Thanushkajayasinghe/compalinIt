import React, {Component} from 'react';
import {
  View,
  Text,
  StyleSheet,
  Alert,
  Image,
  ImageBackground,
} from 'react-native';
import AsyncStorage from '@react-native-community/async-storage';
import {
  Container,
  Header,
  Left,
  Body,
  Right,
  Button,
  Icon,
  Title,
} from 'native-base';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import i18n from './i18n/locales/locale';


export default class ViewComplainStatus extends Component {
  constructor() {
    super();

    this.state = {
      dataSource: [],
    };
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('username')) == null) {
      this.props.navigation.navigate('BeforeLogin');
    }

    fetch('http://123.231.114.160:3000/getComplainStatus/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        refNo: this.props.route.params.refNo,
      }),
    })
      .then(response => response.json())
      .then(responseJson => {
        this.setState(
          {
            dataSource: responseJson,
          },
          function() {},
        );
      })
      .catch(error => {
        console.error(error);
      });
  }

  render() {
    return (
      <View style={styles.container}>
        <ImageBackground
          source={require('./Images/wer.jpg')}
          style={styles.imgBackground}>
          <Header transparent>
            <Left>
              <Button
                transparent
                onPress={() => this.props.navigation.goBack()}
                >
                <Icon
                style={{
                  color: '#000',
                  fontSize: hp('3%'),
                  marginTop: hp('1.8%'),
                  fontWeight: 'bold'
                }} name="arrow-back" />
              </Button>
            </Left>
            <Body>
              <Title
                style={{
                  color: '#000',
                  fontSize: hp('2.5%'),
                  marginTop: hp('1.8%'),
                }}>
                {i18n.t('Complain Status')}
              </Title>
            </Body>
          </Header>

          <View style={{flex: 1, marginTop: 50}}>
            {this.state.dataSource.map((item, key) => {
              var received = 'Pending';
              var processing = 'Pending';
              var completed = 'Pending';
              if (
                item.receiveddatetime != null &&
                item.processingdatetime != null &&
                item.completeddatetime != null
              ) {
                received = item.receiveddatetime;
                processing = item.processingdatetime;
                completed = item.completeddatetime;
              } else if (
                item.receiveddatetime != null &&
                item.processingdatetime != null &&
                item.completeddatetime == null
              ) {
                received = item.receiveddatetime;
                processing = item.processingdatetime;
                completed = 'Pending';
              } else if (
                item.receiveddatetime != null &&
                item.processingdatetime == null &&
                item.completeddatetime == null
              ) {
                received = item.receiveddatetime;
                processing = 'Pending';
                completed = 'Pending';
              }
              var imageHol1 = require('./Images/Completed.png');
              if (received == 'Pending') {
                imageHol1 = require('./Images/Pending.png');
              }

              var imageHol2 = require('./Images/Completed.png');
              if (processing == 'Pending') {
                imageHol2 = require('./Images/Pending.png');
              }

              var imageHol3 = require('./Images/Completed.png');
              if (completed == 'Pending') {
                imageHol3 = require('./Images/Pending.png');
              }
              return (
                <View key={key} style={{alignItems: 'center'}}>
                  <View style={styles.rectangle}>
                    <View style={{flexDirection: 'row', width: '100%'}}>
                      <View style={{flex: 0.22}}>
                        <Image style={styles.stretch} source={imageHol1} />
                      </View>
                      <View style={{flex: 0.78}}>
                        <Text style={{fontSize: 20, fontWeight: 'bold'}}>
                        {i18n.t('Complain Received')}
                        </Text>

                        <Text style={{fontSize: 18}}>[ {received} ]</Text>
                      </View>
                    </View>
                  </View>
                  <View style={styles.triangle} />
                  <View style={styles.rectangle}>
                    <View style={{flexDirection: 'row', width: '100%'}}>
                      <View style={{flex: 0.22}}>
                        <Image style={styles.stretch} source={imageHol2} />
                      </View>
                      <View style={{flex: 0.78}}>
                        <Text style={{fontSize: 20, fontWeight: 'bold'}}>
                        {i18n.t('Complain Processing')}
                        </Text>
                        <Text style={{fontSize: 18}}>[ {processing} ]</Text>
                      </View>
                    </View>
                  </View>
                  <View style={styles.triangle} />
                  <View style={styles.rectangle}>
                    <View style={{flexDirection: 'row', width: '100%'}}>
                      <View style={{flex: 0.22}}>
                        <Image style={styles.stretch} source={imageHol3} />
                      </View>
                      <View style={{flex: 0.78}}>
                        <Text style={{fontSize: 20, fontWeight: 'bold'}}>
                        {i18n.t('Complain Completed')}
                        </Text>
                        <Text style={{fontSize: 18}}>[ {completed} ]</Text>
                      </View>
                    </View>
                  </View>
                </View>
              );
            })}
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
  rectangle: {
    width: wp('80%'),
    backgroundColor: 'yellow',
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: hp('2.5%'),
    paddingBottom: hp('2.5%'),
    paddingLeft: hp('1%'),
    borderRadius: 20,
    borderColor: 'black',
    borderWidth: 3,
  },
  triangle: {
    backgroundColor: 'transparent',
    borderStyle: 'solid',
    borderLeftWidth: hp('3%'),
    borderRightWidth: hp('3%'),
    borderBottomWidth: hp('5%'),
    borderLeftColor: 'transparent',
    borderRightColor: 'transparent',
    borderBottomColor: 'black',
    transform: [{rotate: '180deg'}],
    marginBottom: 10,
    alignItems: 'center',
    borderWidth: 0,
    borderColor: 'transparent',
  },
  stretch: {
    width: '80%',
    height: 50,
    resizeMode: 'stretch',
  },
});
