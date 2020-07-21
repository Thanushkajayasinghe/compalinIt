import React, {Component} from 'react';
import {
  View,
  Text,
  Dimensions,
  ImageBackground,
  StyleSheet,
  ScrollView,
  TextInput,
  Modal,
  NativeModules,
  Picker,
  Image,
  TouchableOpacity,
  SafeAreaView,
  PermissionsAndroid,
  ActivityIndicator,
} from 'react-native';
import MapView, {Marker, PROVIDER_GOOGLE} from 'react-native-maps';
import {
  Title,
  Header,
  Body,
  Left,
  Right,
  Button,
  Icon,
  Label,
  Textarea,
} from 'native-base';
var ImagePicker = NativeModules.ImageCropPicker;
import AwesomeButtonRick from 'react-native-really-awesome-button/src/themes/rick';
import AsyncStorage from '@react-native-community/async-storage';
import AlertPro from 'react-native-alert-pro';
import {
  widthPercentageToDP as wp,
  heightPercentageToDP as hp,
} from 'react-native-responsive-screen';
import Geolocation from 'react-native-geolocation-service';
import marker from './Images/mapMarer.png';
import i18n from './i18n/locales/locale';
import Spinner from 'react-native-loading-spinner-overlay';


const screenWidth = Math.round(Dimensions.get('window').width);
const screenHeight = Math.round(Dimensions.get('window').height);

const latitudeDelta = 0.025;
const longitudeDelta = 0.025;



export default class AddComplaint extends Component {
  constructor(props) {
    super(props);

    this.state = {
      images: [],
      modalVisible: false,
      dataSource: [],
      mainCategory: '',
      subCategoryItems: [],
      allItemArray: [],
      subCategory: '',
      selectedItems: [],
      selectedItemsNames: [],
      com_title: '',
      com_msg: '',
      com_category: '',
      username: '',
      com_location_description: '',
      com_contact_person: '',
      com_contact_details: '',
      content: [],
      region: {
        latitudeDelta,
        longitudeDelta,
        latitude: 6.89435,
        longitude: 79.855108,
      },
      spinner: false,
      audioFile: '',
      recording: false,
      loaded: false,
      paused: true,
    };
  }

  async componentDidMount() {
    if ((await AsyncStorage.getItem('LoginType')) != 'Anonymous') {
      if ((await AsyncStorage.getItem('username')) == null) {
        this.props.navigation.navigate('BeforeLogin');
      }

      this.setState({username: await AsyncStorage.getItem('username')});
    } else {
      this.setState({username: await AsyncStorage.getItem('Anonymous')});
    }

    fetch('http://123.231.114.160:3000/getMainCategories/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
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

  openConfirmation() {
    this.AlertPro1.open();
  }

  setModalVisible = visible => {
    this.setState({modalVisible: visible});
  };

  AddMultipleItems() {
    const selectedMainCategory = this.state.mainCategory;
    const selectedSubCategory = this.state.subCategory;

    Object.values(this.state.subCategoryItems).map((item, key) => {
      if (item['id'] === this.state.subCategory) {
        if (this.state.selectedItemsNames.indexOf(item['subgroupname']) == -1) {
          this.setState({
            selectedItems: this.state.selectedItems.concat({
              MainCategory: selectedMainCategory,
              SubCategory: selectedSubCategory,
            }),
            selectedItemsNames: this.state.selectedItemsNames.concat(
              item['subgroupname'],
            ),
          });
        }
      }
    });
  }

  onMainCategoryChange = (value, index) => {
    this.setState({
      mainCategory: value,
    });

    fetch('http://123.231.114.160:3000/getSubCategories/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: value,
      }),
    })
      .then(response => response.json())
      .then(responseJson => {
        this.setState(
          {
            subCategoryItems: responseJson,
            allItemArray: Array.from(
              new Set(this.state.allItemArray.concat(responseJson)),
            ),
          },
          function() {},
        );
      })
      .catch(error => {
        console.error(error);
      });
  };

  onSubCategoryChange = (value, index) => {
    this.setState({
      subCategory: value,
    });
  };

  pickMultiple() {
    ImagePicker.openPicker({
      multiple: true,
      waitAnimationEnd: false,
      sortOrder: 'desc',
      includeExif: true,
      forceJpg: true,
      includeBase64: true,
    })
      .then(images => {
        images.map(i => {
          this.setState({
            images: this.state.images.concat(i.data),
          });
        });
      })
      .catch(e => alert(e));
  }

  pickSingleWithCamera(cropping, mediaType = 'photo') {
    ImagePicker.openCamera({
      cropping: cropping,
      width: 500,
      height: 500,
      includeExif: true,
      mediaType,
      includeBase64: true,
    })
      .then(images => {
        this.setState({
          images: this.state.images.concat(images.data),
        });
      })
      .catch(e => alert(e));
  }

  onClickListener = async contextThis => {
    if (this.state.selectedItems.length != 0) {
      contextThis.setState({spinner: true});

      if ((await AsyncStorage.getItem('LoginType')) != 'Anonymous') {
        fetch('http://123.231.114.160:3000/addComplain/', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            com_title: this.state.com_title,
            com_msg: this.state.com_msg,
            com_category: this.props.route.params.SelectedCategory,
            mainCategory: this.state.mainCategory,
            selectedItems: this.state.selectedItems,
            com_location_x: this.state.region.longitude,
            com_location_y: this.state.region.latitude,
            com_location_description: this.state.com_location_description,
            com_contact_person: this.state.com_contact_person,
            com_contact_details: this.state.com_contact_details,
            username: await AsyncStorage.getItem('username'),
            images: this.state.images,
          }),
        })
          .then(function(response) {
            return response.json();
          })
          .then(function(result) {
            contextThis.setState({spinner: false});
            if (result == 'ComplainSuccessfullyAdded') {
              contextThis.AlertPro.open();
            }
          })
          .catch(function(error) {
            contextThis.setState({spinner: false});
            alert('result:' + error);
          });
      } else {
        fetch('http://123.231.114.160:3000/addComplain/', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            com_title: this.state.com_title,
            com_msg: this.state.com_msg,
            com_category: this.props.route.params.SelectedCategory,
            mainCategory: this.state.mainCategory,
            selectedItems: this.state.selectedItems,
            com_location_x: this.state.region.longitude,
            com_location_y: this.state.region.latitude,
            com_location_description: this.state.com_location_description,
            com_contact_person: this.state.com_contact_person,
            com_contact_details: this.state.com_contact_details,
            username: 'Anonymous',
            images: this.state.images,
          }),
        })
          .then(function(response) {
            return response.json();
          })
          .then(function(result) {
            contextThis.setState({spinner: false});
            if (result == 'ComplainSuccessfullyAdded') {
              contextThis.AlertPro.open();
            }
          })
          .catch(function(error) {
            contextThis.setState({spinner: false});
            alert('result:' + error);
          });
      }
    } else {
      contextThis.setState({spinner: false});
      alert('Inform To Can not be empty!');
    }
  };

  onConfirmClick = async contextThis => {
    contextThis.AlertPro.close();
    if ((await AsyncStorage.getItem('LoginType')) == 'Anonymous') {
      contextThis.props.navigation.navigate('BeforeLogin');
    } else {
      contextThis.props.navigation.navigate('Home');
    }
  };

  deleteRecord(item) {
    Object.values(this.state.allItemArray).map((it, key) => {
      if (it['subgroupname'] === item) {
        let newItemName = this.state.selectedItemsNames.filter(x => x !== item);
        let newItemSerial = this.state.selectedItems.filter(
          x => x.SubCategory !== it['id'],
        );

        this.setState({selectedItems: newItemSerial});
        this.setState({selectedItemsNames: newItemName});
      }
    });
  }

  async getCurrentLocation(contextThis) {
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
      {
        title: 'ComplainIt App',
        message: 'ComplainIt App access to your location ',
      },
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
      Geolocation.getCurrentPosition(
        position => {
          contextThis.setState({
            region: {
              latitude: Number(position.coords.latitude),
              longitude: Number(position.coords.longitude),
              latitudeDelta: 0.003,
              longitudeDelta: 0.003,
            },
          });
        },
        error => {
          console.log(error.code, error.message);
        },
        {enableHighAccuracy: true, timeout: 15000, maximumAge: 10000},
      );

      contextThis.AlertPro1.close();
      contextThis.setModalVisible(true);
    } else {
      alert('Location permission denied');
    }
  }

  async closeAndDefaultLocation(contextThis) {
    contextThis.AlertPro1.close();
    this.setModalVisible(true);
    this.setState({
      region: {
        latitudeDelta,
        longitudeDelta,
        latitude: Number(6.89435),
        longitude: Number(79.855108),
      },
    });
  }

  onRegionChange = region => {
    this.setState({region});
  };

  DeleteImageFromArr(item) {
    var array = [...this.state.images];
    var index = array.indexOf(item);
    if (index !== -1) {
      array.splice(index, 1);
      this.setState({images: array});
    }
  }

  selectVideo = () => {

    ImagePicker.openPicker({
      mediaType: "video",
    }).then((video) => {
      console.log(video.path);


    });
   
  };

  render() {
    const {modalVisible} = this.state;
    const {region} = this.state;
    const {recording, paused, audioFile} = this.state;

    const imgs = this.state.images.map((item, key) => {
      return (
        <ImageBackground
          key={key}
          source={{
            uri: `data:image/png;base64,${item}`,
          }}
          style={{
            width: 80,
            height: 80,
            marginRight: 10,
            position: 'relative',
          }}>
          <Icon
            name="md-close-circle-outline"
            style={{
              marginTop: 3,
              position: 'absolute',
              right: 0,
              color: 'white',
              fontSize: 45,
            }}
            onPress={() => this.DeleteImageFromArr(item)}
          />
        </ImageBackground>
      );
    });

    return (
      <ImageBackground
        source={require('./Images/wer.jpg')}
        style={styles.imgBackground}>
        <Header transparent style={{marginTop: hp('1%')}}>
          <Left>
            <Button transparent onPress={() => this.props.navigation.goBack()}>
              <Icon style={{color: '#000'}} name="arrow-back" />
            </Button>
          </Left>
          <Body>
            <Title style={{color: '#000'}}>
              {i18n.t('New Complaint Details')}
            </Title>
          </Body>
        </Header>
        <Spinner
          visible={this.state.spinner}
          textContent={'Loading...'}
          textStyle={styles.spinnerTextStyle}
        />
        <ScrollView>
          <View style={{flex: 1, padding: hp('1.5%')}}>
            <View style={{marginTop: hp('1.2%')}}>
              <Label>{i18n.t('Complain Title')}:</Label>
              <TextInput
                style={{
                  borderColor: 'gray',
                  borderWidth: 2,
                  paddingLeft: 10,
                  fontSize: 18,
                }}
                onChangeText={com_title => this.setState({com_title})}
              />
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>{i18n.t('Complain')}:</Label>
              <View style={{flex: 1}}>
                <Textarea
                  rowSpan={5}
                  style={{
                    borderColor: 'gray',
                    borderWidth: 2,
                    color: '#000',
                    fontSize: 18,
                  }}
                  onChangeText={com_msg => this.setState({com_msg})}
                />
              </View>
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>
                {i18n.t('Inform To')}
                <Label style={{color: 'blue', fontSize: 12}}>
                  ({i18n.t('Please Select Main and Sub Category')})
                </Label>
                :
              </Label>
              <Picker
                selectedValue={this.state.mainCategory}
                onValueChange={this.onMainCategoryChange}>
                <Picker.Item
                  disabled
                  label={i18n.t('Select Main Category')}
                  value={null}
                />
                {this.state.dataSource.map((item, key) => (
                  <Picker.Item
                    label={item.groupname}
                    value={item.groupid}
                    key={key}
                  />
                ))}
              </Picker>
            </View>

            <View style={{marginTop: hp('1.2%'), flexDirection: 'row'}}>
              <View style={{flex: 0.87}}>
                <Picker
                  selectedValue={this.state.subCategory}
                  onValueChange={this.onSubCategoryChange}>
                  <Picker.Item
                    disabled
                    label={i18n.t('Select Sub Category')}
                    value={null}
                  />
                  {this.state.subCategoryItems.map((item, key) => (
                    <Picker.Item
                      label={item.subgroupname}
                      value={item.id}
                      key={key}
                    />
                  ))}
                </Picker>
              </View>
              <View style={{flex: 0.13}}>
                <Button
                  style={{
                    backgroundColor: '#575fcf',
                  }}
                  block
                  onPress={() => {
                    this.AddMultipleItems();
                  }}>
                  <Text>
                    <Icon
                      name="ios-add-circle"
                      style={{marginTop: 3, color: 'white', fontSize: 20}}
                    />
                  </Text>
                </Button>
              </View>
            </View>

            <View
              style={{
                marginTop: hp('1.2%'),
                flexDirection: 'row',
                flexGrow: 1,
                justifyContent: 'space-between',
              }}>
              <ScrollView horizontal={true} style={{paddingBottom: hp('1.2%')}}>
                {(() =>
                  this.state.selectedItemsNames.map((item, key) => (
                    <View
                      style={{
                        flexDirection: 'row',
                        backgroundColor: '#485460',
                        borderRadius: 20,
                        paddingTop: 2,
                        paddingLeft: 6,
                        paddingRight: 6,
                        paddingBottom: 3,
                        marginRight: 5,
                      }}
                      key={key}>
                      <Text
                        style={{
                          fontSize: 18,
                          marginRight: 8,
                          color: 'white',
                        }}>
                        {item}
                      </Text>
                      <TouchableOpacity onPress={() => this.deleteRecord(item)}>
                        <Icon
                          name="md-close-circle-outline"
                          style={{marginTop: 3, color: 'white', fontSize: 20}}
                        />
                      </TouchableOpacity>
                    </View>
                  )))()}
              </ScrollView>
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>{i18n.t('Evidence Upload')}:</Label>
              <Button
                onPress={this.pickMultiple.bind(this)}
                block
                warning
                style={{marginTop: 10, borderRadius: 20}}>
                <Icon name="ios-cloud-upload" />
                <Text
                  style={{
                    textAlign: 'center',
                    color: '#fff',
                    fontWeight: 'bold',
                    fontSize: 18,
                  }}>
                  {i18n.t('Select Files to Upload')}
                </Text>
              </Button>

              <Button
                onPress={() => this.pickSingleWithCamera(true)}
                block
                warning
                style={{marginTop: 15, borderRadius: 20}}>
                <Icon name="ios-camera" />
                <Text
                  style={{
                    textAlign: 'center',
                    color: '#fff',
                    fontWeight: 'bold',
                    fontSize: 18,
                  }}>
                  {i18n.t('Open Camera & Capture')}
                </Text>
              </Button>

              <Button
                onPress={() => this.selectVideo(true)}
                block
                warning
                style={{marginTop: 15, borderRadius: 20}}>
                <Icon name="ios-camera" />
                <Text
                  style={{
                    textAlign: 'center',
                    color: '#fff',
                    fontWeight: 'bold',
                    fontSize: 18,
                  }}>
                  Video Upload
                </Text>
              </Button>
            </View>

            <View style={{marginTop: hp('1.2%'), flexDirection: 'row'}}>
              <ScrollView horizontal={true} style={{paddingBottom: hp('1.2%')}}>
                {imgs}
              </ScrollView>
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>
                {i18n.t('Location')}:
                <Label style={{color: 'red', fontSize: 12}}>(Optional)</Label>
              </Label>
              <Modal
                animationType="none"
                transparent={true}
                visible={modalVisible}
                onRequestClose={this.closeModal}
                style={styles.modal}>
                <View style={styles.modalView}>
                  <MapView
                    style={styles.map}
                    provider={PROVIDER_GOOGLE}
                    //initialRegion={region}
                    region={region}
                    onRegionChangeComplete={this.onRegionChange}
                  />
                  <View style={styles.markerFixed}>
                    <Image style={styles.marker} source={marker} />
                  </View>
                  <SafeAreaView style={styles.footer}>
                    <Text style={styles.region}>
                      {JSON.stringify(region, null, 2)}
                    </Text>
                  </SafeAreaView>

                  <View style={{flexDirection: 'row'}}>
                    <Button
                      style={{
                        ...styles.openButton,
                        backgroundColor: '#e67e22',
                        marginTop: hp('1%'),
                        width: '40%',
                        alignSelf: 'flex-start',
                      }}
                      block
                      onPress={() => {
                        this.setModalVisible(!modalVisible);

                        this.setState({
                          region: {
                            latitude: 0,
                            longitude: 0,
                            latitudeDelta: 0.003,
                            longitudeDelta: 0.003,
                          },
                        });
                      }}>
                      <Icon name="md-close-circle-outline" />
                      <Text
                        style={{
                          textAlign: 'center',
                          color: '#fff',
                          fontWeight: 'bold',
                          fontSize: 18,
                        }}>
                        {i18n.t('Close')}
                      </Text>
                    </Button>

                    <Button
                      style={{
                        ...styles.openButton,
                        backgroundColor: '#3498db',
                        marginTop: hp('1%'),
                        marginLeft: hp('1.2%'),
                        width: '40%',
                        alignSelf: 'flex-end',
                      }}
                      block
                      onPress={() => {
                        this.setModalVisible(!modalVisible);
                      }}>
                      <Icon name="ios-checkmark-circle-outline" />
                      <Text
                        style={{
                          textAlign: 'center',
                          color: '#fff',
                          fontWeight: 'bold',
                          fontSize: 18,
                        }}>
                        {i18n.t('OK')}
                      </Text>
                    </Button>
                  </View>
                </View>
              </Modal>

              <Button
                style={styles.openButton}
                block
                onPress={() => {
                  // this.setModalVisible(true);
                  this.openConfirmation(true);
                }}>
                <Icon name="md-open" />
                <Text
                  style={{
                    textAlign: 'center',
                    color: '#fff',
                    fontWeight: 'bold',
                    fontSize: 18,
                  }}>
                  {i18n.t('Open Map')}
                </Text>
              </Button>
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>
                {i18n.t('Or Location in description')}:
                <Label style={{color: 'red', fontSize: 12}}>
                  ({i18n.t('Optional')})
                </Label>
              </Label>
              <Textarea
                rowSpan={5}
                style={{
                  borderColor: 'gray',
                  borderWidth: 2,
                  color: '#000',
                  fontSize: 18,
                }}
                onChangeText={com_location_description =>
                  this.setState({com_location_description})
                }
              />
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>
                {i18n.t('Contact Person')}:
                <Label style={{color: 'red', fontSize: 12}}>
                  ({i18n.t('Optional')})
                </Label>
              </Label>
              <TextInput
                style={{
                  borderColor: 'gray',
                  borderWidth: 2,
                  paddingLeft: 10,
                  fontSize: 18,
                }}
                onChangeText={com_contact_person =>
                  this.setState({com_contact_person})
                }
              />
            </View>

            <View style={{marginTop: hp('1.2%')}}>
              <Label>
                {i18n.t('Contact Details')}:
                <Label style={{color: 'red', fontSize: 12}}>
                  ({i18n.t('Optional')})
                </Label>
              </Label>
              <TextInput
                style={{
                  borderColor: 'gray',
                  borderWidth: 2,
                  paddingLeft: 10,
                  fontSize: 18,
                }}
                onChangeText={com_contact_details =>
                  this.setState({com_contact_details})
                }
              />
            </View>

            <View
              style={{
                marginTop: 20,
                textAlign: 'center',
                justifyContent: 'center',
                alignItems: 'center',
              }}>
              <AwesomeButtonRick
                width={300}
                type="secondary"
                onPress={() => this.onClickListener(this)}>
                {i18n.t('Submit')}
              </AwesomeButtonRick>
            </View>

            <AlertPro
              ref={ref => {
                this.AlertPro = ref;
              }}
              onConfirm={() => this.onConfirmClick(this)}
              title={i18n.t('Complain Submitted Successfully!')}
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

            {/* /Map confirmation for get current locaion */}
            <AlertPro
              ref={ref => {
                this.AlertPro1 = ref;
              }}
              onCancel={() => this.closeAndDefaultLocation(this)}
              onConfirm={() => this.getCurrentLocation(this)}
              title={i18n.t('Do you want to use Current location?')}
              textCancel={i18n.t('No')}
              textConfirm={i18n.t('OK')}
              customStyles={{
                mask: {
                  backgroundColor: 'transparent',
                },
                container: {
                  borderWidth: 2,
                  borderColor: '#9900cc',
                  shadowColor: '#000000',
                  shadowOpacity: 0.1,
                  shadowRadius: 10,
                },
                buttonCancel: {
                  backgroundColor: 'red',
                },
                buttonConfirm: {
                  backgroundColor: 'green',
                },
              }}
            />
          </View>
        </ScrollView>
      </ImageBackground>
    );
  }
}

const styles = StyleSheet.create({
  imgBackground: {
    flex: 1,
  },
  modalView: {
    margin: hp('1.8%'),
    backgroundColor: 'white',
    borderRadius: 20,
    paddingBottom: hp('6%'),
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 1,
    shadowRadius: 5.84,
    elevation: 5,
    width: screenWidth * 0.93,
    height: screenHeight * 0.93,
    alignItems: 'center',
    overflow: 'hidden',
    // borderColor: 'black', borderWidth: 2
  },
  openButton: {
    marginTop: hp('1%'),
    backgroundColor: '#F194FF',
    borderRadius: 20,
  },
  thumbnailImage: {
    height: 50,
    width: 50,
  },
  map: {
    borderTopRightRadius: 20,
    width: '100%',
    height: '96%',
  },
  markerFixed: {
    left: '50%',
    marginLeft: -24,
    marginTop: -48,
    position: 'absolute',
    top: '50%',
  },
  marker: {
    height: 52,
    width: 52,
  },
  footer: {
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    bottom: hp('10%'),
    position: 'absolute',
    width: '100%',
  },
  region: {
    color: '#fff',
    lineHeight: 20,
    margin: 15,
  },
  spinnerTextStyle: {
    color: '#FFF',
  },
});
