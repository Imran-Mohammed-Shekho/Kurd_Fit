import 'package:flutter/material.dart';
import 'package:gym/l10n/app_localizations.dart';

String tr(BuildContext context, String text) {
  final l10n = AppLocalizations.of(context);

  switch (text.trim()) {
    case "Contine":
      return l10n.continue1;
    case "Login":
      return l10n.login;
    case "Sign Up":
    case "Sign Up ":
      return l10n.signUp;
    case "Already have an account? Login":
    case "Already Have account ? Login":
      return l10n.alreadyHaveAccount;
    case "Forgot Password?":
      return l10n.forgotPassword;
    case "Email":
      return l10n.email;
    case "Full name":
    case "Full name ":
      return l10n.name;
    case "Password":
      return l10n.password;
    case "Age":
      return l10n.age;
    case "Gender":
      return l10n.gender;
    case "Weight":
      return l10n.weight;
    case "Height":
      return l10n.height;
    case "Goal":
      return l10n.whatIsYourGoal;
    case "What is your Goal?":
      return l10n.whatIsYourGoal;
    case "Gain Muscle":
      return l10n.gainMuscle;
    case "Burn fat":
    case "Burn body fat":
      return l10n.burnFat;
    case "General health":
      return l10n.generalHealth;
    case "How old are you?":
      return l10n.howOldAreYou;
    case "How tall are you?":
    case "How Tall are you?":
      return l10n.howTallAreYou;
    case "What is your Name?":
      return l10n.whatIsYourName;
    case "Please Enter your name right here ..":
    case "Please enter your name right here ..":
      return l10n.enterYourName;
    case "Any health issues?":
    case "Health issues":
      return l10n.healthIssues;
    case "What is your Weight?":
      return l10n.whatIsYourWeight;
    case "Back Pain":
      return l10n.backPain;
    case "Knee Pain":
      return l10n.kneePain;
    case "Shoulder Pain":
      return l10n.shoulderPain;
    case "No Issues":
      return l10n.noIssues;
    case "Choose your fitness level":
      return l10n.chooseFitnessLevel;
    case "Choose your Activity level":
      return l10n.activityLevel;
    case "How often would you like to workout ?":
      return l10n.howOftenWorkout;
    case " Your fitness \njourney starts \nhere":
      return l10n.fitnessJourneyStarts;
    case "About Us":
      return l10n.aboutUs;
    case "Share App":
      return l10n.shareApp;
    case "Enabble Notifications":
      return l10n.enabbleNotifications;
    case "Change language":
      return l10n.changelanguage;
    case "Beginner":
    case "beginner":
      return l10n.beginner;
    case "Intermediate":
    case "intermediate":
      return l10n.intermediate;
    case "Advanced":
    case "advanced":
      return l10n.advanced;
    case "Sedentary":
      return l10n.sedentary;
    case "Light Activity":
      return l10n.lightActivity;
    case "Moderate Activity":
      return l10n.moderateActivity;
    case "Very Active":
      return l10n.veryActive;
    case "Athlete":
      return l10n.athlete;
    case "Male":
    case "male":
      return l10n.male;
    case "Female":
    case "female":
      return l10n.female;
    case "Other":
      return l10n.other;
    case "Change Password":
      return l10n.changePassword;
    case "Current Password":
      return l10n.currentPassword;
    case "New Password":
      return l10n.newPassword;
    case "Confirm new Password":
    case "Confirm new Password ":
    case "Confirm new password":
      return l10n.confirmPassword;
    case "Submit":
      return l10n.submit;
    case "Please Fill all faileds ":
    case "fill all text boxes please! ":
      return l10n.fillAllFields;
    case "Or":
      return l10n.or;
    case "Help":
      return l10n.help;
    case "We are here to help!":
      return l10n.weAreHereToHelp;
    case "Have Questions or Need Assistance ?\nReach Out To Us!":
      return l10n.contactUs;
    case "Your message has been sent !":
      return l10n.messageSent;
    case "Profile":
      return l10n.profile;
    case "Workouts":
      return l10n.workouts;
    case "Dashboard":
      return l10n.dashboard;
    case "Close":
      return l10n.close;
    case "Logout":
      return l10n.logout;
    case "Cancel":
      return l10n.cancel;
    case "Password Changed":
      return l10n.passwordChanged;
    case "Choose Stronger Password":
      return l10n.chooseStrongerPassword;
    case "Passords dose not match ❌":
      return l10n.passwordsDoNotMatch;
    case "Calculate":
      return l10n.calculate;
    case "YOUR RESULT":
      return l10n.yourResult;
    case "Enter email":
      return l10n.enterEmail;
    case "Invalid email":
      return l10n.invalidEmail;
    case "Enter password":
      return l10n.enterPassword;
    case "Logged in successfully!":
      return l10n.loggedInSuccessfully;
    case "Password must be at least 6 chars":
    case "Password must be at least 6 characters":
      return l10n.passwordTooShort;
    case "rest link sccessefully sent to":
      return l10n.passwordResetSent;
    case "Check your Email !":
      return l10n.checkYourEmail;
    case "Payment":
      return l10n.payment;
    default:
      final lang = Localizations.localeOf(context).languageCode;
      if (lang != "ckb") {
        return text;
      }
      return _ckbFallback[text] ?? _ckbFallback[text.trim()] ?? text;
  }
}

const Map<String, String> _ckbFallback = {
  "Body Parts": "بەشەکانی جەستە",
  "No data found": "هیچ داتایەک نەدۆزرایەوە",
  "no data found ": "هیچ داتایەک نەدۆزرایەوە",
  "Workout Detail": "وردەکاری ڕاهێنان",
  "Workout Detail ": "وردەکاری ڕاهێنان",
  "Workout Details": "وردەکاری ڕاهێنان",
  "Re-Calculate": "دووبارە ژمێرە",
  "Name": "ناو",
  "Name :": "ناو:",
  "Body Part :": "بەشی جەستە:",
  "Equipments:": "ئامرازەکان:",
  "TargetMuscles:": "ماسولکە ئامانجەکان:",
  "SecondaryMuscles:": "ماسولکە لاوەکییەکان:",
  "Instructions:": "ڕێنماییەکان:",
  "Can't Load images due to server down !":
      "ناتوانرێت وێنە باربکرێت، سێرڤەر وەستاوە!",
  "Workout plan has been created ": "پلانی ڕاهێنان دروستکرا",
  "response from server is null": "وەڵامی سێرڤەر بەتاڵە",
  "fill all faileds ": "تکایە هەموو خانەکان پڕبکەرەوە",
  "Generate Plan": "دروستکردنی پلان",
  "Workout Generator": "دروستکەری ڕاهێنان",
  "Daily Calorie Needed Calculator": "ژمێرەری پێویستی کالۆری ڕۆژانە",
  "Calculate Daily Calorie": "ژمێرەی کالۆری ڕۆژانە",
  "Height/Cm": "باڵا/سم",
  "Weight/Kg": "کێش/کگ",
  "age": "تەمەن",
  "Height in cm": "باڵا بە سم",
  "Weight in Kg": "کێش بە کگ",
  "day": "ڕۆژ",
  "How many days do you prefer?": "چەند ڕۆژ دەتەوێت؟",
  "Experience": "ئەزموون",
  "fat loss": "سووتاندنی چەوری",
  "muscle gain": "گەشەی ماسولکە",
  "strength": "هێز",
  "general fitness": "تەندروستی گشتی",
  "Payment & Subscription": "پارەدان و بەشداری",
  "Your Balance": "باڵانسی تۆ",
  "Payment Methods": "شێوازی پارەدان",
  "Add payment method": "زیادکردنی شێوازی پارەدان",
  "Credit Card": "کارتی بانکی",
  "visa ending in 9783": "ڤیزا کۆتایی بە 9783",
  "Adding payment method": "زیادکردنی شێوازی پارەدان",
  "Cardholder Name": "ناوی خاوەنی کارت",
  "name on card": "ناوی سەر کارت",
  "Card Number": "ژمارەی کارت",
  "CVV": "CVV",
  "Search": "گەڕان",
  "Date": "بەروار",
  "Total :": "کۆی گشتی:",
  "Coming Soon !": "بەزوویی دێت!",
  "Pay Now": "ئێستا پارەبدە",
  "Product Preview": "پێشبینینی بەرهەم",
  "Product Information": "زانیاری بەرهەم",
  "Price :": "نرخ:",
  "Description :": "وەسف:",
  "Add To Cart": "زیادکردن بۆ سەبەتە",
  "Porduct Added To Cart": "بەرهەم زیادکرا بۆ سەبەتە",
  "Products": "بەرهەمەکان",
  "NO  products add yet!!": "هێشتا هیچ بەرهەمێک زیاد نەکراوە!",
  "Favorite Products": "بەرهەمە دڵخوازەکان",
  "NO favorite products add yet!!": "هێشتا هیچ بەرهەمی دڵخواز زیاد نەکراوە!",
  "We are here to help!": "ئێمە لێرەین بۆ یارمەتیدان!",
  "Have Questions or Need Assistance ?\nReach Out To Us!":
      "پرسیارت هەیە یان یارمەتیت دەوێت؟\nپەیوەندیمان پێوە بکە!",
  "Name ": "ناو",
  "Email ": "ئیمەیڵ",
  "write your problem here...": "کێشەکەت لێرە بنووسە...",
  "Also You can Find Us here": "دەتوانیت لێرەش بماندۆزیتەوە",
  "Forgot your password?": "وشەی نهێنیت لەبیرچووە؟",
  "Enter your email below to receive a\npassword reset link.":
      "ئیمەیڵەکەت بنووسە بۆ وەرگرتنی\nبەستەری گەڕاندنەوەی وشەی نهێنی.",
  "Send": "ناردن",
  "Check your Email !": "سەیری ئیمەیڵەکەت بکە!",
  "Back to login": "گەڕانەوە بۆ چوونەژوورەوە",
  "We’ve Sent a Password rest link to your Email Address\n Please Check your Inbox.":
      "بەستەری نوێکردنەوەی وشەی نهێنی نێردرا بۆ ئیمەیڵەکەت.\nتکایە سەیری Inbox بکە.",
  "We’ve Sent a Verification  link to your Email Address\n Please Verify your Email .":
      "بەستەری پشتڕاستکردنەوە نێردرا بۆ ئیمەیڵەکەت.\nتکایە ئیمەیڵەکەت پشتڕاست بکەرەوە.",
  "I verfied": "پشتڕاستم کردەوە",
  "Going back": "گەڕانەوە",
  "Email verified succsessfully": "ئیمەیڵ بە سەرکەوتوویی پشتڕاستکرایەوە",
  "failed to save user info ": "پاراستنی زانیاری بەکارهێنەر سەرکەوتوو نەبوو",
  "Please Verify your email and Try again!":
      "تکایە ئیمەیڵەکەت پشتڕاست بکەرەوە و دووبارە هەوڵبدە!",
  "Please verify your email before logging in.":
      "تکایە پێش چوونەژوورەوە ئیمەیڵەکەت پشتڕاست بکەرەوە.",
  "Logged in successfully!": "بە سەرکەوتوویی چوویتە ژوورەوە!",
  "Enter email": "ئیمەیڵ بنووسە",
  "Invalid email": "ئیمەیڵی هەڵە",
  "Enter password": "وشەی نهێنی بنووسە",
  "Password must be at least 6 chars": "وشەی نهێنی دەبێت لانیکەم ٦ پیت بێت",
  "By logging in, you agree to our Terms of Service & Privacy Policy.":
      "بە چوونەژوورەوە، ڕەزامەندی مەرجەکان و سیاسەتی تایبەتمەندی دەدەیت.",
  "By signing up, you agree to our Terms Of Service & Privacy Policy.":
      "بە تۆمارکردن، ڕەزامەندی مەرجەکان و سیاسەتی تایبەتمەندی دەدەیت.",
  "Training, Gym, Strength": "ڕاهێنان، جیم، هێز",
  "Full name": "ناوی تەواو",
  "Please enter your email address": "تکایە ئیمەیڵەکەت بنووسە",
  "Please enter your email": "تکایە ئیمەیڵەکەت بنووسە",
  "Please Enter your name right here ..": "تکایە ناوەکەت لێرە بنووسە",
  "Please enter your name": "تکایە ناوەکەت بنووسە",
  "Please enter your password": "تکایە وشەی نهێنی بنووسە",
  "Please enter a valid email address": "تکایە ئیمەیڵێکی دروست بنووسە",
  "Please enter a valid name (letters and spaces only)":
      "تکایە ناوێکی دروست بنووسە (تەنها پیت و بۆشایی).",
  "Name must be at least 2 characters": "ناو دەبێت لانیکەم ٢ پیت بێت",
  "Password must be at least 6 characters":
      "وشەی نهێنی دەبێت لانیکەم ٦ پیت بێت",
  "No account found with this email.": "هیچ هەژمارێک بەو ئیمەیڵە نەدۆزرایەوە.",
  "Incorrect password. Please try again.":
      "وشەی نهێنی هەڵەیە. تکایە دووبارە هەوڵبدە.",
  "Please enter a valid email address.": "تکایە ئیمەیڵێکی دروست بنووسە.",
  "This account has been disabled.": "ئەم هەژمارە ناچالاک کراوە.",
  "Too many attempts. Please try again later.":
      "هەوڵدان زۆر بوو. تکایە دواتر هەوڵبدە.",
  "Login failed. Try again.": "چوونەژوورەوە سەرکەوتوو نەبوو. دووبارە هەوڵبدە.",
  "Please enter vailde email": "تکایە ئیمەیڵێکی دروست بنووسە",
  "rest link sccessefully sent to": "بەستەری گەڕاندنەوە نێردرا بۆ",
  "Delete account": "سڕینەوەی هەژمار",
  "delete account": "سڕینەوەی هەژمار",
  "Warning": "ئاگاداری",
  "Are you sure you want to delete your account?":
      "دڵنیایت دەتەوێت هەژمارەکەت بسڕیتەوە؟",
  "Personal Information": "زانیاری کەسی",
  "Unknown": "نەناسراو",
  "Body Foucs": "سەرنجی جەستە",
  "Fitness Level": "ئاستی تەندروستی",
  "Workouts per Week": "ڕاهێنان لە هەفتەیەکدا",
  "Please Fill all faileds ": "تکایە هەموو خانەکان پڕبکەرەوە",
  "Passords dose not match ❌": "وشە نهێنییەکان یەک ناگرنەوە ❌",
  "Choose Stronger Password": "وشەی نهێنیی بەهێزتر هەڵبژێرە",
  "Your Password has been updated Please Login again":
      "وشەی نهێنیت نوێکرایەوە، تکایە دووبارە بچۆ ژوورەوە",
  "Password Changed": "وشەی نهێنی گۆڕدرا",
  "please try again": "تکایە دووبارە هەوڵبدە",
  "Enter current password": "وشەی نهێنی ئێستا بنووسە",
  "Enter new passowrd": "وشەی نهێنی نوێ بنووسە",
  "Confirm new password": "پشتڕاستکردنەوەی وشەی نهێنی نوێ",
  "😢 Weak": "😢 لاواز",
  "🙂 Normal": "🙂 ئاسایی",
  "😎 Good !": "😎 باشە!",
  "🔥 Strong": "🔥 بەهێز",
  "What is your gender?": "ڕەگەزەکەت چییە؟",
  "What is your Goal?": "ئامانجەکەت چییە؟",
  "Gain Muscle": "گەشەکردنی ماسولکە",
  "Burn body fat": "سووتاندنی چەوری جەستە",
  "Lose fat and gain muscle together":
      "کەمکردنەوەی چەوری و گەشەی ماسولکە لەیەککاتدا",
  "General health": "تەندروستی گشتی",
  "Choose your foucs areas": "شوێنی سەرنجەکانت هەڵبژێرە",
  "Back": "پشت",
  "Abs": "سک",
  "Shoulders": "شان",
  "Legs": "لاق",
  "Chest": "سنگ",
  "Arms": "بازوو",
  "Calves": "قاچ",
  "FullBody": "هەموو جەستە",
  "Choose your fitness level": "ئاستی تەندروستیت هەڵبژێرە",
  "Choose your Activity level": "ئاستی چالاکیت هەڵبژێرە",
  "How often would you like to workout ?": "چەند جار دەتەوێت ڕاهێنان بکەیت؟",
  " Your fitness \njourney starts \nhere":
      "گەشتی تەندروستیت\nلێرە دەست پێدەکات",
  " Achieve your fitness goals with\npersonalized workouts and expert\nguidance.":
      "ئامانجەکانی تەندروستیت بەدەستبهێنە بە\nڕاهێنانی کەسی و ڕێنمایی شارەزا.",
  "Train Smarter, Not Harder": "بە زیرەکی ڕاهێنە، نەک بە توندی",
  "Choose how often you want to work out and we’ll adjust intensity for maximum results.":
      "هەڵبژێرە چەند جار دەتەوێت ڕاهێنان بکەیت، ئێمەش توندی دەگونجێنین بۆ باشترین ئەنجام.",
  "BMI Calculator": "ژمێرەری BMI",
  "Your BMI Calculator": "ژمێرەری BMI ـی تۆ",
  "workout a week": "ڕاهێنان لە هەفتەیەکدا",
  "years": "ساڵ",
  "cm": "سم",
  "kg": "کگ",
  "Kg": "کگ",
  "Food analyzer is not configured yet. Contact support.":
      "شیکەرەوەی خۆراک هێشتا ڕێک نەخراوە. تکایە پەیوەندی بە پشتگیرییەوە بکە.",
  "Could not analyze this image right now. Try again later.":
      "ئێستا ناتوانرێت ئەم وێنەیە شیکرابێتەوە. تکایە دواتر هەوڵبدە.",
  "No foods detected.": "هیچ خۆراکێک نەدۆزرایەوە.",
  "🥗 Food Breakdown": "🥗 وردەکاری خۆراک",
  "🔥 Calories": "🔥 کالۆری",
  "💪 Protein": "💪 پرۆتین",
  "🍞 Carbs": "🍞 کاربۆهایدرەیت",
  "🧈 Fats": "🧈 چەوری",
  "🌿 Fiber": "🌿 ڕیشاڵ",
  "Discount": "داشکاندن",
  "20% off\n": "20% داشکاندن\n",
  "On This  products": "لەسەر ئەم بەرهەمانە",
  "Buy Now": "ئێستا بکڕە",
  "English": "ئینگلیزی",
  "Kurdish": "کوردی",
  "Done": "تەواو",
  "Please read the info below": "تکایە زانیارییەکانی خوارەوە بخوێنەوە",
  "you need to login again to able delete your account ":
      "دەبێت دووبارە بچیتە ژوورەوە بۆ ئەوەی بتوانیت هەژمارەکەت بسڕیتەوە.",
  "Please login again before deleting your account.":
      "تکایە پێش سڕینەوەی هەژمارەکەت دووبارە بچۆ ژوورەوە.",
  "Workout plan is ready !": "پلانی ڕاهێنان ئامادەیە!",
  "You can check image on internet follow this link":
      "دەتوانیت وێنەکە لە ئینتەرنێت ببینیت، ئەم بەستەرە شوێن بکە.",
  "Version 1.0": "وەشانی 1.0",
  "⚡ AI Fitness Intelligence": "⚡ زیرەکی دەستکردی تەندروستی",
  "Our system uses smart algorithms to understand your body data and optimize your results.":
      "سیستەمەکەمان ئالگۆریتمی زیرەک بەکاردێنێت بۆ تێگەیشتن لە داتای جەستەت و باشترکردنی ئەنجامەکانت.",
  "🧠 AI-Powered BMI Analysis": "🧠 شیکردنەوەی BMI بە هێزی AI",
  "Get an accurate Body Mass Index calculation with intelligent insights based on your personal data.":
      "ژمێرەیەکی دروستی BMI وەربگرە لەگەڵ تێبینی زیرەک لەسەر بنەمای داتای کەسیت.",
  "💪 Smart Weight Evaluation": "💪 هەڵسەنگاندنی زیرەکی کێش",
  "Your weight helps us calculate your ideal BMI and generate a precise fitness roadmap.":
      "کێشەکەت یارمەتیمان دەدات BMI ـی گونجاوت ژمێربکەین و نەخشەڕێگایەکی وردی تەندروستی دروست بکەین.",
  "🔥 Train Smarter, Not Harder": "🔥 بە زیرەکی ڕاهێنە، نەک بە توندی",
  "Weekly Progress": "پێشکەوتنی هەفتانە",
  "Daily BreakDown": "دابەشکردنی ڕۆژانە",
  "Workout": "ڕاهێنان",
  "Calorie": "کالۆری",
  "Duration": "ماوە",
  "min": "خولەک",
  "Steps": "هنگاو",
  "Sat": "شەممە",
  "Sun": "یەکشەممە",
  "Mon": "دووشەممە",
  "Tue": "سێشەممە",
  "Wed": "چوارشەممە",
  "Thu": "پێنجشەممە",
  "Fri": "هەینی",
  "Oct 23 -Oct 29 , 2025": "٢٣ ـی تشرینی یەکەم تا ٢٩ ـی تشرینی یەکەم ٢٠٢٥",
  "NECK": "مل",
  "FOREARMS": "پێشەبازوو",
  "SHOULDERS": "شان",
  "CARDIO": "کاردیۆ",
  "UPPER ARMS": "بازووی سەرەوە",
  "CHEST": "سنگ",
  "BACK": "پشت",
  "UPPER LEGS": "لاقی سەرەوە",
  "WAIST": "کەمەر",
  "Whey Protein": "پرۆتینی وێی",
  "Supports muscle recovery and growth. .":
      "یارمەتیدەری چاکبوونەوە و گەشەی ماسولکەیە.",
  "Creatine Monohydrate": "کریاتین مۆنۆهایدرەیت",
  "Increases strength, power, and endurance by\nboosting ATP production. ":
      "هێز و توانست و بەردەوامی زیاد دەکات بە\nزیادکردنی بەرهەمهێنانی ATP.",
  "BCAA ": "BCAA",
  "Helps reduce muscle soreness and fatigue.":
      "یارمەتیدەری کەمکردنەوەی ئازاری ماسولکە و ماندووبوونە.",
  "Pre-Workout": "پێش-ڕاهێنان",
  "Boosts energy, focus, and endurance before training.\n .":
      "پێش ڕاهێنان وزە و سەرنج و بەردەوامی زیاد دەکات.",
  "Glutamine": "گلوتامین",
  "Supports muscle recovery and immune health.":
      "پشتگیری لە چاکبوونەوەی ماسولکە و تەندروستی بەرگری دەکات.",
  "Fish Oil (Omega-3)": "ڕۆنی ماسی (ئۆمێگا-3)",
  "Promotes heart health, reduces inflammation\n and supports joint recovery. ":
      "تەندروستی دڵ باشتر دەکات، سووربوون کەم دەکات\n و پشتگیری لە چاکبوونەوەی جۆینتەکان دەکات.",
  "Multivitamins": "فرەڤیتامینەکان",
  "Provides essential vitamins and minerals\nto fill nutritional gaps":
      "ڤیتامین و کانزای گرنگ دابین دەکات\nبۆ پڕکردنەوەی کەموکوڕییە خۆراکییەکان.",
  "Casein Protein": "پرۆتینی کەیزین",
  "Slow-digesting protein ideal for overnight recovery.":
      "پرۆتینێکی هێواش هەضمبوونە کە گونجاوە بۆ چاکبوونەوەی شەوانە.",
  "Mass Gainer": "ماس گەینەر",
  "High-calorie supplement that helps build size and strength. ":
      "پاشکەوتی بەرزکالۆرییە کە یارمەتیدەری زیادکردنی قەبارە و هێزە.",
  "Electrolytes": "ئیلێکترۆلایتەکان",
  "Helps maintain hydration and muscle\nfunction during intense workouts ":
      "یارمەتیدەری پاراستنی ئاودانی و کارکردنی ماسولکەیە\nلە کاتی ڕاهێنانی توند.",
  "Sorry, this platform is not supported yet. We’re working on it!":
      "ببورە، ئەم پلاتفۆرمە هێشتا پشتگیری ناکرێت. کار لەسەری دەکەین!",
  "Our Mission": "ئامانجی ئێمە",
  "Our History": "مێژووی ئێمە",
  "somthinge went wrong ": "هەڵەیەک ڕوویدا",
  "Something went wrong. Please try again.":
      "هەڵەیەک ڕوویدا. تکایە دووبارە هەوڵبدە.",
  "email is already registered. Please login instead.":
      "ئەم ئیمەیڵە پێشتر تۆمارکراوە. تکایە بچۆ ژوورەوە.",
  "Email/password accounts are not enabled. Please contact support.":
      "هەژماری ئیمەیڵ/وشەی نهێنی چالاک نییە. تکایە پەیوەندی بە پشتگیرییەوە بکە.",
  "Password is too weak. Please use a stronger password.":
      "وشەی نهێنی زۆر لاوازە. تکایە وشەی نهێنییەکی بەهێزتر بەکاربهێنە.",
  "Network error. Please check your internet connection.":
      "هەڵەی تۆڕ ڕوویدا. تکایە هێڵی ئینتەرنێتەکەت بپشکنە.",
  "smothing went wrong": "هەڵەیەک ڕوویدا",
  "Gym App By Imran Mohammed ": "ئەپی جیم لەلایەن Imran Mohammed",
  "Check out my Gym App! Download it here: https://play.google.com/store/apps/details?id=com.example.gym_app":
      "ئەپی جیمەکەم تاقیکەرەوە! لێرە دایبەزێنە: https://play.google.com/store/apps/details?id=com.example.gym_app",
  "You will need to sign in again next time.\n Continue?":
      "دەبێت جارێکی تر بچیتە ژوورەوە لە کاتی داهاتوودا.\nبەردەوامبیت؟",
  "user-not-found": "هیچ هەژمارێک بەو ئیمەیڵە نەدۆزرایەوە.",
  "wrong-password": "وشەی نهێنی هەڵەیە.",
  "invalid-email": "ئیمەیڵی هەڵە.",
  "user-disabled": "ئەم هەژمارە ناچالاک کراوە.",
  "too-many-requests": "هەوڵدان زۆر بوو. تکایە دواتر هەوڵبدە.",
  "network-request-failed":
      "هەڵەی تۆڕ ڕوویدا. تکایە هێڵی ئینتەرنێتەکەت بپشکنە.",
  "requires-recent-login":
      "پێویستە دووبارە بچیتە ژوورەوە بۆ ئەنجامدانی ئەم کردارە.",
  "weak-password": "وشەی نهێنی زۆر لاوازە.",
  "email-already-in-use": "ئەم ئیمەیڵە پێشتر بەکارهاتووە.",
  "operation-not-allowed": "ئەم جۆرە هەژمارە چالاک نییە.",
};
