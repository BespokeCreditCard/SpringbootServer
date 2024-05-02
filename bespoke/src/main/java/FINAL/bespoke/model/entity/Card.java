package FINAL.bespoke.model.entity;

import FINAL.bespoke.model.dto.CardDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Comment;

@Getter
@Entity
@Table(name = "card74")
@Comment("새 카드 추가용 테이블")
@NoArgsConstructor
public class Card {
    @Id
    @FieldComment("카드")
    @Column(name = "card", columnDefinition = "TEXT")
    private String card; // 카드

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cardIndex", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_CARD_INDEX"))
    @FieldComment("카드 인덱스")
    @Comment("카드 인덱스")
    private ImageTemplate imageTemplate;

    @Column(name = "cluster_index")
    @FieldComment("군집 인덱스")
    @Comment("군집 인덱스")
    private Long clusterIndex;

    @Column(name = "department_store")
    @FieldComment("백화점")
    @Comment("백화점")
    private Double departmentStore;

    @Column(name = "non_operating")
    @FieldComment("무실적")
    @Comment("무실적")
    private Double nonOperating;

    @Column(name = "hypermarket")
    @FieldComment("대형마트")
    @Comment("대형마트")
    private Double hypermarket;

    @Column(name = "utilities_rentals")
    @FieldComment("공과금/렌탈")
    @Comment("공과금/렌탈")
    private Double utilitiesRentals;

    @Column(name = "online_travel_agency")
    @FieldComment("온라인 여행사")
    @Comment("온라인 여행사")
    private Double onlineTravelAgency;

    @Column(name = "national_happiness")
    @FieldComment("국민행복")
    @Comment("국민행복")
    private Double nationalHappiness;

    @Column(name = "theme_park")
    @FieldComment("테마파크")
    @Comment("테마파크")
    private Double themePark;

    @Column(name = "books")
    @FieldComment("도서")
    @Comment("도서")
    private Double books;

    @Column(name = "other")
    @FieldComment("기타")
    @Comment("기타")
    private Double other;

    @Column(name = "digital_subscription")
    @FieldComment("디지털구독")
    @Comment("디지털구독")
    private Double digitalSubscription;

    @Column(name = "discount")
    @FieldComment("할인")
    @Comment("할인")
    private Double discount;

    @Column(name = "easy_payment")
    @FieldComment("간편결제")
    @Comment("간편결제")
    private Double easyPayment;

    @Column(name = "low_cost_airline")
    @FieldComment("저가항공")
    @Comment("저가항공")
    private Double lowCostAirline;

    @Column(name = "jin_air")
    @FieldComment("진에어")
    @Comment("진에어")
    private Double jinAir;

    @Column(name = "rental")
    @FieldComment("렌탈")
    @Comment("렌탈")
    private Double rental;

    @Column(name = "all_franchise")
    @FieldComment("모든가맹점")
    @Comment("모든가맹점")
    private Double allFranchise;

    @Column(name = "cafe_dessert")
    @FieldComment("카페/디저트")
    @Comment("카페/디저트")
    private Double cafeDessert;

    @Column(name = "travel_accommodation")
    @FieldComment("여행/숙박")
    @Comment("여행/숙박")
    private Double travelAccommodation;

    @Column(name = "accumulation")
    @FieldComment("적립")
    @Comment("적립")
    private Double accumulation;

    @Column(name = "convenience_store")
    @FieldComment("편의점")
    @Comment("편의점")
    private Double convenienceStore;

    @Column(name = "beauty_fitness")
    @FieldComment("뷰티/피트니스")
    @Comment("뷰티/피트니스")
    private Double beautyFitness;

    @Column(name = "golf")
    @FieldComment("골프")
    @Comment("골프")
    private Double golf;

    @Column(name = "general_restaurant")
    @FieldComment("일반음식점")
    @Comment("일반음식점")
    private Double generalRestaurant;

    @Column(name = "hospital")
    @FieldComment("병원")
    @Comment("병원")
    private Double hospital;

    @Column(name = "academy")
    @FieldComment("학원")
    @Comment("학원")
    private Double academy;

    @Column(name = "fast_food")
    @FieldComment("패스트푸드")
    @Comment("패스트푸드")
    private Double fastFood;

    @Column(name = "kakao_pay")
    @FieldComment("카카오페이")
    @Comment("카카오페이")
    private Double kakaoPay;

    @Column(name = "delivery_app")
    @FieldComment("배달앱")
    @Comment("배달앱")
    private Double deliveryApp;

    @Column(name = "transportation")
    @FieldComment("교통")
    @Comment("교통")
    private Double transportation;

    @Column(name = "public_transportation")
    @FieldComment("대중교통")
    @Comment("대중교통")
    private Double publicTransportation;

    @Column(name = "overseas_usage")
    @FieldComment("해외이용")
    @Comment("해외이용")
    private Double overseasUsage;

    @Column(name = "food")
    @FieldComment("푸드")
    @Comment("푸드")
    private Double food;

    @Column(name = "bakery")
    @FieldComment("베이커리")
    @Comment("베이커리")
    private Double bakery;

    @Column(name = "shopping")
    @FieldComment("쇼핑")
    @Comment("쇼핑")
    private Double shopping;

    @Column(name = "social_commerce")
    @FieldComment("소셜커머스")
    @Comment("소셜커머스")
    private Double socialCommerce;

    @Column(name = "performance_exhibition")
    @FieldComment("공연/전시")
    @Comment("공연/전시")
    private Double performanceExhibition;

    @Column(name = "family_restaurant")
    @FieldComment("패밀리레스토랑")
    @Comment("패밀리레스토랑")
    private Double familyRestaurant;

    @Column(name = "communication")
    @FieldComment("통신")
    @Comment("통신")
    private Double communication;

    @Column(name = "airport_lounge_pp")
    @FieldComment("공항라운지/PP")
    @Comment("공항라운지/PP")
    private Long airportLoungePp;

    @Column(name = "airfare")
    @FieldComment("항공권")
    @Comment("항공권")
    private Double airfare;

    @Column(name = "airport_lounge")
    @FieldComment("공항라운지")
    @Comment("공항라운지")
    private Long airportLounge;

    @Column(name = "payco")
    @FieldComment("PAYCO")
    @Comment("PAYCO")
    private Double payco;

    @Column(name = "finance")
    @FieldComment("금융")
    @Comment("금융")
    private Long finance;

    @Column(name = "gas_station")
    @FieldComment("주유소")
    @Comment("주유소")
    private Double gasStation;

    @Column(name = "refueling")
    @FieldComment("주유")
    @Comment("주유")
    private Double refueling;

    @Column(name = "overseas")
    @FieldComment("해외")
    @Comment("해외")
    private Double overseas;

    @Column(name = "rental_car")
    @FieldComment("렌터카")
    @Comment("렌터카")
    private Double rentalCar;

    @Column(name = "cafe")
    @FieldComment("카페")
    @Comment("카페")
    private Double cafe;

    @Column(name = "hotel")
    @FieldComment("호텔")
    @Comment("호텔")
    private Long hotel;

    @Column(name = "movie_culture")
    @FieldComment("영화/문화")
    @Comment("영화/문화")
    private Double movieCulture;

    @Column(name = "office_worker")
    @FieldComment("직장인")
    @Comment("직장인")
    private Double officeWorker;

    @Column(name = "commission_discount")
    @FieldComment("수수료우대")
    @Comment("수수료우대")
    private Long commissionDiscount;

    @Column(name = "mart_convenience_store")
    @FieldComment("마트/편의점")
    @Comment("마트/편의점")
    private Double martConvenienceStore;

    @Column(name = "high_pass")
    @FieldComment("하이패스")
    @Comment("하이패스")
    private Double highPass;

    @Column(name = "movie")
    @FieldComment("영화")
    @Comment("영화")
    private Double movie;

    @Column(name = "air_mileage")
    @FieldComment("항공마일리지")
    @Comment("항공마일리지")
    private Double airMileage;

    @Column(name = "hospital_pharmacy")
    @FieldComment("병원/약국")
    @Comment("병원/약국")
    private Double hospitalPharmacy;

    @Column(name = "duty_free_shop")
    @FieldComment("면세점")
    @Comment("면세점")
    private Double dutyFreeShop;

    @Column(name = "automobile")
    @FieldComment("자동차")
    @Comment("자동차")
    private Double automobile;

    @Column(name = "leisure_sports")
    @FieldComment("레저/스포츠")
    @Comment("레저/스포츠")
    private Double leisureSports;

    @Column(name = "online_shopping")
    @FieldComment("온라인/쇼핑")
    @Comment("온라인/쇼핑")
    private Double onlineShopping;

    @Column(name = "utilities")
    @FieldComment("공과금")
    @Comment("공과금")
    private Double utilities;

    @Column(name = "education_childcare")
    @FieldComment("교육/육아")
    @Comment("교육/육아")
    private Double educationChildcare;

    @Column(name = "life")
    @FieldComment("생활")
    @Comment("생활")
    private Double life;

    @Column(name = "animal_hospital")
    @FieldComment("동물병원")
    @Comment("동물병원")
    private Double animalHospital;

    public Card(CardDto dto) {
        this.card = dto.getCard();
        this.imageTemplate = dto.getImageTemplate();
        this.clusterIndex = dto.getClusterIndex();
        this.departmentStore = dto.getDepartmentStore();
        this.nonOperating = dto.getNonOperating();
        this.hypermarket = dto.getHypermarket();
        this.utilitiesRentals = dto.getUtilitiesRentals();
        this.onlineTravelAgency = dto.getOnlineTravelAgency();
        this.nationalHappiness = dto.getNationalHappiness();
        this.themePark = dto.getThemePark();
        this.books = dto.getBooks();
        this.other = dto.getOther();
        this.digitalSubscription = dto.getDigitalSubscription();
        this.discount = dto.getDiscount();
        this.easyPayment = dto.getEasyPayment();
        this.lowCostAirline = dto.getLowCostAirline();
        this.jinAir = dto.getJinAir();
        this.rental = dto.getRental();
        this.allFranchise = dto.getAllFranchise();
        this.cafeDessert = dto.getCafeDessert();
        this.travelAccommodation = dto.getTravelAccommodation();
        this.accumulation = dto.getAccumulation();
        this.convenienceStore = dto.getConvenienceStore();
        this.beautyFitness = dto.getBeautyFitness();
        this.golf = dto.getGolf();
        this.generalRestaurant = dto.getGeneralRestaurant();
        this.hospital = dto.getHospital();
        this.academy = dto.getAcademy();
        this.fastFood = dto.getFastFood();
        this.kakaoPay = dto.getKakaoPay();
        this.deliveryApp = dto.getDeliveryApp();
        this.transportation = dto.getTransportation();
        this.publicTransportation = dto.getPublicTransportation();
        this.overseasUsage = dto.getOverseasUsage();
        this.food = dto.getFood();
        this.bakery = dto.getBakery();
        this.shopping = dto.getShopping();
        this.socialCommerce = dto.getSocialCommerce();
        this.performanceExhibition = dto.getPerformanceExhibition();
        this.familyRestaurant = dto.getFamilyRestaurant();
        this.communication = dto.getCommunication();
        this.airportLoungePp = dto.getAirportLoungePp();
        this.airfare = dto.getAirfare();
        this.airportLounge = dto.getAirportLounge();
        this.payco = dto.getPayco();
        this.finance = dto.getFinance();
        this.gasStation = dto.getGasStation();
        this.refueling = dto.getRefueling();
        this.overseas = dto.getOverseas();
        this.rentalCar = dto.getRentalCar();
        this.cafe = dto.getCafe();
        this.hotel = dto.getHotel();
        this.movieCulture = dto.getMovieCulture();
        this.officeWorker = dto.getOfficeWorker();
        this.commissionDiscount = dto.getCommissionDiscount();
        this.martConvenienceStore = dto.getMartConvenienceStore();
        this.highPass = dto.getHighPass();
        this.movie = dto.getMovie();
        this.airMileage = dto.getAirMileage();
        this.hospitalPharmacy = dto.getHospitalPharmacy();
        this.dutyFreeShop = dto.getDutyFreeShop();
        this.automobile = dto.getAutomobile();
        this.leisureSports = dto.getLeisureSports();
        this.onlineShopping = dto.getOnlineShopping();
        this.utilities = dto.getUtilities();
        this.educationChildcare = dto.getEducationChildcare();
        this.life = dto.getLife();
        this.animalHospital = dto.getAnimalHospital();
    }
}