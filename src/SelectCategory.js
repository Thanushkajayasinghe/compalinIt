import React, {Component} from 'react';
import {
  StyleSheet,
  FlatList,
  View,
  Alert,
  Image,
  ImageBackground,
  TouchableHighlight,
  ScrollView,
  SafeAreaView,
  YellowBox,
} from 'react-native';
import AwesomeButtonRick from 'react-native-really-awesome-button/src/themes/rick';
import AsyncStorage from '@react-native-community/async-storage';
import {Tooltip, Text, Divider} from 'react-native-elements';
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
import AlertPro from 'react-native-alert-pro';
import i18n from './i18n/locales/locale';

YellowBox.ignoreWarnings(['VirtualizedLists should never be nested']);

export default class SelectCategory extends Component {
  constructor() {
    super();

    this.state = {
      GridViewItems: [
        {key: 'Security', name: i18n.t('Security'), img: require('./Images/security.png')},
        {key: 'Violence', name: i18n.t('Violence'), img: require('./Images/violence.png')},
        {key: 'Accident',  name: i18n.t('Accident'),img: require('./Images/accident.png')},
        {key: 'Natural Disaster',  name: i18n.t('Natural Disaster'),img: require('./Images/naturalDisaster.png')},
        {key: 'Animals',  name: i18n.t('Animals'),img: require('./Images/animals.png')},
        {key: 'Social',  name: i18n.t('Social'),img: require('./Images/social.png')},
        {key: 'Goverment',  name: i18n.t('Goverment'),img: require('./Images/goverment.png')},
        {
          key: 'Traffic Violation',
          name: i18n.t('Traffic Violation'),
          img: require('./Images/trafficViolation.png'),
        },
        {
          key: 'Election Violation',
          name: i18n.t('Election Violation'),
          img: require('./Images/election.png'),
        },
        {
          key: 'Illegal Activity',
          name: i18n.t('Illegal Activity'),
          img: require('./Images/IllegalActivity.png'),
        },
        {
          key: 'Harresment',
          name: i18n.t('Harresment'),
          img: require('./Images/harresment.png'),
        },
        {
          key: 'Fraud',
          name: i18n.t('Fraud'),
          img: require('./Images/fraud.png'),
        },
        {
          key: 'Lost/ Missing Person',
          name: i18n.t('Lost/ Missing Person'),
          img: require('./Images/lostMissingPerson.png'),
        },
        {
          key: 'Lost/ Missing Pets',
          name: i18n.t('Lost/ Missing Pets'),
          img: require('./Images/lostMissingPets.png'),
        },
        {
          key: 'Lost/ Missing Items',
          name: i18n.t('Lost/ Missing Items'),
          img: require('./Images/lostandmissingitems.png'),
        },
        {
          key: 'Public Property Damages',
          name: i18n.t('Public Property Damages'),
          img: require('./Images/PublicPropertyDamages.png'),
        },
        {
          key: 'Bribery & Corruption',
          name: i18n.t('Bribery & Corruption'),
          img: require('./Images/bribery.png'),
        },
        {key: 'Other',  name: i18n.t('Other'), img: require('./Images/other.png')},
      ],
      SelectedCategory: '',
      TsSelectedCategory: '',
    };
  }

  GetGridViewItem(item,h) {     
    this.setState({SelectedCategory: item});  
    this.setState({TsSelectedCategory: h});   
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('LoginType')) != 'Anonymous') {
      if ((await AsyncStorage.getItem('username')) == null) {
        this.props.navigation.navigate('BeforeLogin');
      }
    }
  }

  onClickListener = contextThis => {
    if (this.state.SelectedCategory != '') {
      contextThis.props.navigation.navigate('AddComplaint', {
        SelectedCategory: contextThis.state.SelectedCategory,
      });
    } else {
      contextThis.AlertPro.open();
    }
  };

  render() {
    return (
      <ImageBackground
        source={require('./Images/iop.jpg')}
        style={styles.imgBackground}>
        <Header style={{marginTop: 10}} transparent>
          <Left>
            <Button transparent onPress={() => this.props.navigation.goBack()}>
              <Icon name="arrow-back" />
            </Button>
          </Left>
          <Body>
            <Title>{i18n.t('Complain Category')}</Title>
          </Body>
        </Header>
        <View>
          <Text style={{fontSize:20, textAlign: 'center', color: 'white'}}>{i18n.t('Selected Category')}: {this.state.TsSelectedCategory}</Text>
        </View>

        <SafeAreaView style={{flex: 1}}>
          <ScrollView style={{marginTop: 5}}>
            <View style={{marginTop: 25, marginLeft: 5, marginRight: 5}}>
              <FlatList
                data={this.state.GridViewItems}
                renderItem={({item}) => (                  
                  <TouchableHighlight
                    onPress={this.GetGridViewItem.bind(this, item.key, item.name)}
                    underlayColor="black"
                    style={
                      this.state.SelectedCategory === item.key
                        ? styles.GridViewBlockStyleSelected
                        : styles.GridViewBlockStyle
                    }>
                    <View>
                      <View style={{alignItems: 'center'}}>
                        <Image
                          style={{width: 90, height: 70}}
                          source={item.img}
                        />
                      </View>
                      <Tooltip
                        popover={<Text>{item.name}</Text>}
                        backgroundColor={'white'}>
                        <View style={{alignItems: 'center'}}>
                          <Text
                            numberOfLines={1}
                            style={styles.GridViewInsideTextItemStyle}>
                            {item.name}
                          </Text>
                        </View>
                      </Tooltip>
                    </View>
                  </TouchableHighlight>
                )}
                numColumns={3}
              />
            </View>
          </ScrollView>
        </SafeAreaView>

        <View
          style={{
            textAlign: 'center',
            alignItems: 'center',
            marginTop: 25,
            paddingBottom: 20,
          }}>
          <AwesomeButtonRick
            width={250}
            type="secondary"
            onPress={() => this.onClickListener(this)}>
            {i18n.t('Next')}
          </AwesomeButtonRick>
        </View>

        <AlertPro
          ref={ref => {
            this.AlertPro = ref;
          }}
          onConfirm={() => this.AlertPro.close()}
          title={i18n.t('Please Select Category')}
          showCancel={false}
          textConfirm={i18n.t('OK')}
          customStyles={{
            mask: {
              backgroundColor: 'transparent',
            },
            container: {
              borderWidth: 1,
              borderColor: '#9900cc',
              shadowColor: '#000000',
              shadowOpacity: 0.1,
              shadowRadius: 10,
            },
            buttonCancel: {
              backgroundColor: '#4da6ff',
            },
          }}
        />
      </ImageBackground>
    );
  }
}

const styles = StyleSheet.create({
  imgBackground: {
    flex: 1,
  },
  GridViewBlockStyle: {
    justifyContent: 'flex-end',
    flex: 1,
    alignItems: 'center',
    height: 120,
    margin: 5,
    backgroundColor: '#00BCD4',
    borderRadius: 15,
  },
  GridViewBlockStyleSelected: {
    justifyContent: 'flex-end',
    flex: 1,
    alignItems: 'center',
    height: 120,
    margin: 5,
    backgroundColor: '#e67e22',
    borderRadius: 15,
  },
  GridViewInsideTextItemStyle: {
    color: '#fff',
    padding: 10,
    fontSize: 18,
    justifyContent: 'center',
  },
});
