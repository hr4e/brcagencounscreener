define [], ->
  class SurveyResponse
    constructor: ->
      self = @
      # questionnaire title and version number
      @questionnaireTitle = ko.observable("the breast and ovarian cancer genetic counseling screening questionnaire")
      @questionnaireVersion = ko.observable("version 1.0.")

      # sponsor information
      @sponsorName = ko.observable("Palo Alto Medical Foundation")
      @sponsorAbbrev = ko.observable("PAMF")
      @sponsorContactPhone = ko.observable("650-555-1212")
      @sponsorInternetResources = [
        "<li>PAMF: http://www.pamf.org/cancercare/diagnosis/geneticcounseling.html</li>"
      ]
      @sponsorInformedConsent = "<textarea rows='18' cols='80' disabled='disabled'>"+
        "** Simple PAMF-specific informed consent language here ** \n\n"+
        "By supplying your name and birthdate below, you are agreeing that you understand "+
        "the nature of the study and any risks or benefits of agreeing to participate, and "+
        "that you agree to participate.  Click 'Next' to proceed, 'Back' to cancel."+
        "</textarea>"

      @genericInternetResources = [
        "<li>National Institutes of Health: http://health.nih.gov/topic/BreastCancer</li>",
        "<li>Susan Komen Foundation: http://ww5.komen.org/AboutUs/AboutUs.html</li>",
        "<li>CancerNet: http://www.cancer.net/portal/site/patient/menuitem.00a3259e57e760d90d0bde106e37a01d/?vgnextoid=19a4ffbe5dd5b010VgnVCM100000ed730ad1RCRD&vgnextfmt=default</li>",
        "<li>National Comprehensive Cancer Network: http://www.nccn.org/patients/patient_guidelines/breast/index.html</li>"
      ]

      @closeBloodRelatives = "For purposes of this questionnaire, 'blood relatives' are people "+
        "who are my relatives <b><i>by birth</i></b>; all of the following relatives are considered 'close':<ul>"+
        "<li>parents, siblings (brothers & sisters), children</li>"+
        "<li>grandparents, grandchildren, aunts, uncles, nieces, nephews, half-siblings</li>"+
        "<li>great grandparents, great grandchildren, great aunts, great uncles, first cousins</li></ul>"

      @surveyPositives = [
        "<li>I have had at least one of the following cancers:<ul>"+
          "<li>Ovarian cancer</li>"+
          "<li>Cancer of the fallopian tubes</li>"+
          "<li>Cancer of the peritoneum</li>"+
          "</ul></li>",
        "<li>Specifically, I have had ovarian cancer</li>",
        "<li>Specifically, I have had cancer of the fallopian tubes</li>",
        "<li>Specifically, I have had cancer of the peritoneum</li>",

        "<li>At least one of my close blood relatives<sup>&#8224;</sup> has had any of the following cancers:<ul>"+
          "<li>Ovarian cancer</li>"+
          "<li>Cancer of the fallopian tubes</li>"+
          "<li>Cancer of the peritoneum</li>"+
          "</ul></li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> has had ovarian cancer</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> has had cancer of the fallopian tubes</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> has had cancer of the peritoneum</li>",

        "<li>I have had breast cancer (including DCIS); not just benign changes</li>",
        "<li>I was age 50 years old or younger when my breast cancer was first diagnosed</li>",
        "<li>My cancer was described as 'triple negative' (ER-, PR- and HER2-)</li>",
        "<li>My cancer was found in more than one location of the same breast</li>",
        "<li>I have had breast cancer in both breasts</li>",
        "<li>I had skin manifestations with my breast cancer</li>",
        "<li>I have Ashkenazi Jewish close blood relatives<sup>&#8224;</sup></li>",
        "<li>I have at least one close blood relative<sup>&#8224;</sup> with breast cancer that was diagnosed "+
          "at age 50 years or younger</li>",
        "<li>I have at least two close blood relatives<sup>&#8224;</sup> with breast or pancreatic cancer at any age</li>",
        "<li>I have also had at least one of the following:<ul>"+
          "<li>Thyroid cancer</li>"+
          "<li>Sarcoma</li>"+
          "<li>Adrenocortical carcinoma</li>"+
          "<li>Endometrial cancer</li>"+
          "<li>Pancreatic cancer</li>"+
          "<li>Brain tumors</li>"+
          "<li>Diffuse gastric cancer</li>"+
          "<li>Leukemia or lymphoma</li>"+
          "</ul></li>",
        "<li>Specifically, I have had thyroid cancer</li>",
        "<li>Specifically, I have had sarcoma</li>",
        "<li>Specifically, I have had adrenocortical carcinoma</li>",
        "<li>Specifically, I have had endometrial cancer</li>",
        "<li>Specifically, I have had pancreatic cancer</li>",
        "<li>Specifically, I have had brain tumors</li>",
        "<li>Specifically, I have had diffuse gastric cancer</li>",
        "<li>I have had leukemia or lymphoma</li>",

        "<li>I or one of my close blood relatives<sup>&#8224;</sup> is from a population at risk for developing "+
          "breast or ovarian cancer (such as Ashkanazi Jews)</li>",

        "<li>I have at least one close blood relative<sup>&#8224;</sup> confirmed to have gene mutations that "+
          "make breast and ovarian cancer more likely (such as BRCA)</li>",

        "<li>At least one of my close blood relatives<sup>&#8224;</sup> has had breast cancer</li>",
        "<li>One or more of my close blood relatives<sup>&#8224;</sup> who have had breast cancerare men (genetic males)</li>",
        "<li>Two or more close blood relatives<sup>&#8224;</sup> from the SAME SIDE (mother’s or father’s) of my family "+
          "have had breast cancer</li>",
        "<li>Of my close blood relatives<sup>&#8224;</sup> with breast cancer, at least one has ALSO had any of the following:<ul>"+
          "<li>Skin manifestations</li>"+
          "<li>Thyroid cancer</li>"+
          "<li>Sarcoma</li>"+
          "<li>Adrenocortical carcinoma</li>"+
          "<li>Endometrial cancer</li>"+
          "<li>Pancreatic cancer</li>"+
          "<li>Brain tumors</li>"+
          "<li>Diffuse gastric cancer</li>"+
          "<li>Leukemia or lymphoma</li>"+
          "</ul></li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had skin manifestations</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had thyroid cancer</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had sarcoma</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had adrenocortical carcinoma</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had endometrial cancer</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had pancreatic cancer</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had brain tumors</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had diffuse gastric cancer</li>",
        "<li>Specifically, at least one of my close blood relatives<sup>&#8224;</sup> with breast cancer has had leukemia or lymphoma</li>",

        "<li>I have enough long-lived female close blood relatives<sup>&#8224;</sup> to "+
        "make my family history significant in this context</li>",
          "" # A terminal empty string ... for my convenience
      ]

      @surveyNegatives = [
        "<li>I have not had any of the following cancers:<ul>"+
          "<li>Ovarian cancer</li>"+
          "<li>Cancer of the fallopian tubes</li>"+
          "<li>Cancer of the peritoneum</li>"+
          "</ul></li>",
        "<li>I have not had ovarian cancer</li>",
        "<li>I have not had cancer of the fallopian tubes</li>",
        "<li>I have not had cancer of the peritoneum</li>",

        "<li>None of my close blood relatives<sup>&#8224;</sup> has had any of the following cancers:<ul>"+
          "<li>Ovarian cancer</li>"+
          "<li>Cancer of the fallopian tubes</li>"+
          "<li>Cancer of the peritoneum</li>"+
          "</ul></li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> has had ovarian cancer</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> has had cancer of the fallopian tubes</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> has had cancer of the peritoneum</li>",

        "<li>I have not had breast cancer (or DCIS)</li>",
        "<li>I was over age 50 years old when my breast cancer was first diagnosed</li>",
        "<li>My cancer was not described as 'triple negative' (ER-, PR- and HER2-)</li>",
        "<li>My cancer was not found in more than one location of the same breast</li>",
        "<li>I did not have breast cancer in both breasts</li>",
        "<li>I have not had skin manifestations with my breast cancer</li>",
        "<li>I do not have Ashkenazi Jewish close blood relatives<sup>&#8224;</sup></li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer were diagnosed "+
          "at age 50 years or younger</li>",
        "<li>I do not have at least two close blood relatives<sup>&#8224;</sup> with breast or pancreatic cancer at any age</li>",
        "<li>I have not had any of the following:<ul>"+
          "<li>Thyroid cancer</li>"+
          "<li>Sarcoma</li>"+
          "<li>Adrenocortical carcinoma</li>"+
          "<li>Endometrial cancer</li>"+
          "<li>Pancreatic cancer</li>"+
          "<li>Brain tumors</li>"+
          "<li>Diffuse gastric cancer</li>"+
          "<li>Leukemia or lymphoma</li>"+
          "</ul></li>",
        "<li>I have not had thyroid cancer</li>",
        "<li>I have not had sarcoma</li>",
        "<li>I have not had adrenocortical carcinoma</li>",
        "<li>I have not had endometrial cancer</li>",
        "<li>I have not had pancreatic cancer</li>",
        "<li>I have not had brain tumors</li>",
        "<li>I have not had diffuse gastric cancer</li>",
        "<li>I have not had leukemia or lymphoma</li>",

        "<li>None of my close blood relatives<sup>&#8224;</sup> are from a population at risk for developing "+
          "breast or ovarian cancer (such as Ashkanazi Jews)</li>",

        "<li>None of my close blood relatives<sup>&#8224;</sup> have been confirmed to have gene mutations that "+
          "make breast and ovarian cancer more likely (such as BRCA)</li>",

        "<li>None of my close blood relatives<sup>&#8224;</sup> have had breast cancer</li>",
        "<li>None of my male close blood relatives<sup>&#8224;</sup> have had breast cancer</li>",
        "<li>At most one close blood relative<sup>&#8224;</sup> from the each side (mother’s or father’s) of my family "+
          "has had breast cancer</li>",
        "<li>Of my close blood relatives<sup>&#8224;</sup> with breast cancer, none have also had:<ul>"+
          "<li>Skin manifestations</li>"+
          "<li>Thyroid cancer</li>"+
          "<li>Sarcoma</li>"+
          "<li>Adrenocortical carcinoma</li>"+
          "<li>Endometrial cancer</li>"+
          "<li>Pancreatic cancer</li>"+
          "<li>Brain tumors</li>"+
          "<li>Diffuse gastric cancer</li>"+
          "<li>Leukemia or lymphoma</li>"+
          "</ul></li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had skin manifestations</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had thyroid cancer</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had sarcoma</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had adrenocortical carcinoma</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had endometrial cancer</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had pancreatic cancer</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had brain tumors</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had diffuse gastric cancer</li>",
        "<li>None of my close blood relatives<sup>&#8224;</sup> with breast cancer have had leukemia or lymphoma</li>",

        "<li>I do not have enough long-lived female close blood relatives<sup>&#8224;</sup> to "+
        "make my family history significant in this context</li>",
        "" # A terminal empty string ... for my convenience
      ]

      @responses = ko.observableArray([])

      # patient demographics
      @patientName = ko.observable()
      @birthDate = ko.observable()

      # patient callback number and associated checkbox
      @callbackReq = ko.observable()
      @patientCallbackNumber = ko.observable()

      # Group A risk variables for women with personal history of ovarian CA
      @pHxOvCARiskGroupA = ko.observable()
      @pHxOvarianCA = ko.observable()
      @pHxFallopianCA = ko.observable()
      @pHxPeritonealCA = ko.observable()

      # Group A risk variables for women with family history of ovarian CA
      @fHxOvCARiskGroupA = ko.observable()
      @fHxOvarianCA = ko.observable()
      @fHxFallopianCA = ko.observable()
      @fHxPeritonealCA = ko.observable()

      # Recognized risk group variables
      @recognizedRiskGroup = ko.observable()
      @ashkenaziJewish = ko.observable()

      # Other gross personal & family history risk variables
      @pHxBreastCA = ko.observable()
      @fHxBreastCA = ko.observable()
      @fHxBrCASuscGene = ko.observable()

      # Final test for family history sufficiency
      @fHxSufficient = ko.observable()

      # Group A risk variables for women with a personal history of breast CA
      @pHxBrCARiskGroupA = ko.observable()  # No longer used
      @pHxBrCALE50Years = ko.observable()
      @pHxBrCA3Neg = ko.observable()
      @pHxBrCAGT1PrimarySame = ko.observable()
      @pHxBrCAGT1PrimaryBoth = ko.observable()
      @pHxBrCADermMan = ko.observable()

      # Group B risk variables for women with a personal history of breast CA
      @pHxBrCARiskGroupB = ko.observable() # No longer used
      @pHxBrCAGE1RelBrCALE50Years = ko.observable()
      @pHxBrCAGE2RelBrPancCA = ko.observable()

      # Group C risk variables for women with a personal history of breast CA
      @pHxBrCARiskGroupC = ko.observable()
      @pHxBrCAThyroidCA = ko.observable()
      @pHxBrCASarcoma = ko.observable()
      @pHxBrCAAdrenalCA = ko.observable()
      @pHxBrCAEndometrialCA = ko.observable()
      @pHxBrCAPancreaticCA = ko.observable()
      @pHxBrCABrainTumors = ko.observable()
      @pHxBrCAGastricCA = ko.observable()
      @pHxBrCALeukLymphoma = ko.observable()

      # Group A risk variables for women with NO personal history of breast CA
      @fHxBrCARiskGroupA = ko.observable() # No longer used
      @fHxBrCAMale = ko.observable()
      @fHxBrCASameSideGE2 = ko.observable()

      # Group B risk variables for women with NO personal history of breast CA
      @fHxBrCARiskGroupB = ko.observable()
      @fHxBrCADermMan = ko.observable()
      @fHxBrCAThyroidCA = ko.observable()
      @fHxBrCASarcoma = ko.observable()
      @fHxBrCAAdrenalCA = ko.observable()
      @fHxBrCAEndometrialCA = ko.observable()
      @fHxBrCAPancreaticCA = ko.observable()
      @fHxBrCABrainTumors = ko.observable()
      @fHxBrCAGastricCA = ko.observable()
      @fHxBrCALeukLymphoma = ko.observable()

      #handle responses to risk group A questions for women with a personal history of ovarian CA
      self.pHxOvCARiskGroupA.subscribe (newValue)->
        if newValue is 'No' || newValue is 'Unknown'
          self.pHxOvarianCA(false)
          self.pHxFallopianCA(false)
          self.pHxPeritonealCA(false)
      self.pHxOvarianCA.subscribe (newValue)->
        if newValue is true
          self.pHxOvCARiskGroupA('Yes')
      self.pHxFallopianCA.subscribe (newValue)->
        if newValue is true
          self.pHxOvCARiskGroupA('Yes')
      self.pHxPeritonealCA.subscribe (newValue)->
        if newValue is true
          self.pHxOvCARiskGroupA('Yes')

      #handle responses to risk group A questions for women with a family history of ovarian CA
      self.fHxOvCARiskGroupA.subscribe (newValue)->
        if newValue is 'No' || newValue is 'Unknown'
          self.fHxOvarianCA(false)
          self.fHxFallopianCA(false)
          self.fHxPeritonealCA(false)
      self.fHxOvarianCA.subscribe (newValue)->
        if newValue is true
          self.fHxOvCARiskGroupA('Yes')
      self.fHxFallopianCA.subscribe (newValue)->
        if newValue is true
          self.fHxOvCARiskGroupA('Yes')
      self.fHxPeritonealCA.subscribe (newValue)->
        if newValue is true
          self.fHxOvCARiskGroupA('Yes')

      #handle responses to risk group C questions for women with a personal history of breast CA
      self.pHxBrCARiskGroupC.subscribe (newValue)->
        if newValue is 'No' || newValue is 'Unknown'
          self.pHxBrCAThyroidCA(false)
          self.pHxBrCASarcoma(false)
          self.pHxBrCAAdrenalCA(false)
          self.pHxBrCAEndometrialCA(false)
          self.pHxBrCAPancreaticCA(false)
          self.pHxBrCABrainTumors(false)
          self.pHxBrCAGastricCA(false)
          self.pHxBrCALeukLymphoma(false)
      self.pHxBrCAThyroidCA.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCASarcoma.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCAAdrenalCA.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCAEndometrialCA.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCAPancreaticCA.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCABrainTumors.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCAGastricCA.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')
      self.pHxBrCALeukLymphoma.subscribe (newValue)->
        if newValue is true
          self.pHxBrCARiskGroupC('Yes')

      #handle responses to risk group B questions for women with NO personal history of breast CA
      self.fHxBrCARiskGroupB.subscribe (newValue)->
        if newValue is 'No' || newValue is 'Unknown'
          self.fHxBrCADermMan(false)
          self.fHxBrCAThyroidCA(false)
          self.fHxBrCASarcoma(false)
          self.fHxBrCAAdrenalCA(false)
          self.fHxBrCAEndometrialCA(false)
          self.fHxBrCAPancreaticCA(false)
          self.fHxBrCABrainTumors(false)
          self.fHxBrCAGastricCA(false)
          self.fHxBrCALeukLymphoma(false)
      self.fHxBrCADermMan.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCAThyroidCA.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCASarcoma.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCAAdrenalCA.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCAEndometrialCA.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCAPancreaticCA.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCABrainTumors.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCAGastricCA.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')
      self.fHxBrCALeukLymphoma.subscribe (newValue)->
        if newValue is true
          self.fHxBrCARiskGroupB('Yes')

      # handle callback number and callback request checkbox
      self.patientCallbackNumber.subscribe (newValue)->
        if newValue?.length > 0
          self.callbackReq(true)

      @identification = ko.computed ->
        str =  'Completed for: <b>'+self.patientName()+'</b><br>Birthdate: <b>'+self.birthDate()+'</b>'
        return str

      @getCloseBloodRelatives = ko.computed ->
        str = self.closeBloodRelatives
        return str

      @assembleInformedConsent = ko.computed ->
        str = self.sponsorInformedConsent
        return str

      @assembleInternetResources = ko.computed ->
        str = "Here are some Internet resources you may want to check to learn more about this topic:<ul>"
        i = 0
        while i<self.genericInternetResources.length
          str += self.genericInternetResources[i]
          i += 1
        i = 0
        while i<self.sponsorInternetResources.length
          str += self.sponsorInternetResources[i]
          i += 1
        str += "</ul>"
        return str

      @tabulateResponse = ->
        responseArray = []
        responseArray.push(self.pHxOvCARiskGroupA())
        responseArray.push(self.pHxOvarianCA())
        responseArray.push(self.pHxFallopianCA())
        responseArray.push(self.pHxPeritonealCA())

        responseArray.push(self.fHxOvCARiskGroupA())
        responseArray.push(self.fHxOvarianCA())
        responseArray.push(self.fHxFallopianCA())
        responseArray.push(self.fHxPeritonealCA())

        responseArray.push(self.pHxBreastCA())
        responseArray.push(self.pHxBrCALE50Years())
        responseArray.push(self.pHxBrCA3Neg())
        responseArray.push(self.pHxBrCAGT1PrimarySame())
        responseArray.push(self.pHxBrCAGT1PrimaryBoth())
        responseArray.push(self.pHxBrCADermMan())
        responseArray.push(self.ashkenaziJewish())
        responseArray.push(self.pHxBrCAGE1RelBrCALE50Years())
        responseArray.push(self.pHxBrCAGE2RelBrPancCA())
        responseArray.push(self.pHxBrCARiskGroupC())
        responseArray.push(self.pHxBrCAThyroidCA())
        responseArray.push(self.pHxBrCASarcoma())
        responseArray.push(self.pHxBrCAAdrenalCA())
        responseArray.push(self.pHxBrCAEndometrialCA())
        responseArray.push(self.pHxBrCAPancreaticCA())
        responseArray.push(self.pHxBrCABrainTumors())
        responseArray.push(self.pHxBrCAGastricCA())
        responseArray.push(self.pHxBrCALeukLymphoma())

        responseArray.push(self.recognizedRiskGroup())

        responseArray.push(self.fHxBrCASuscGene())

        responseArray.push(self.fHxBreastCA())
        responseArray.push(self.fHxBrCAMale())
        responseArray.push(self.fHxBrCASameSideGE2())
        responseArray.push(self.fHxBrCARiskGroupB())
        responseArray.push(self.fHxBrCADermMan())
        responseArray.push(self.fHxBrCAThyroidCA())
        responseArray.push(self.fHxBrCASarcoma())
        responseArray.push(self.fHxBrCAAdrenalCA())
        responseArray.push(self.fHxBrCAEndometrialCA())
        responseArray.push(self.fHxBrCAPancreaticCA())
        responseArray.push(self.fHxBrCABrainTumors())
        responseArray.push(self.fHxBrCAGastricCA())
        responseArray.push(self.fHxBrCALeukLymphoma())

        responseArray.push(self.fHxSufficient())
        # Debugging
        ###
        i = 0
        while i<responseArray.length
          self.responses()[i] = responseArray[i]
          i += 1
        ###
        return responseArray

      @assembleRationale = (responseArray) ->
        rationale = "<ul>"
        i = 0
        while i<responseArray.length
          if responseArray[i] is 'Yes'then rationale += self.surveyPositives[i]
          else if responseArray[i] is true then rationale += self.surveyPositives[i] # handles special cases for grouped responses
          else if responseArray[i] is 'No'then rationale += self.surveyNegatives[i]
          i += 1
        rationale += "</ul>"
        return rationale

      @assembleMissingData = (responseArray) ->
        missingData = "<ul>"
        i = 0
        while i<responseArray.length
          if responseArray[i] is 'Unknown'
          # if (responseArray[i] != 'Yes') && (responseArray[i] != 'No'); need to handle "undefined" differently
            missingData += self.surveyPositives[i]
          i += 1
        missingData += "</ul>"
        return missingData

      # For debugging
      @assembleResults = ko.computed ->
        str = ""
        ###
        str += "<p>Results so far are:<ul>"
        str += "<li>pHxOvCARiskGroupA="+self.pHxOvCARiskGroupA()+"</li>"
        str += "<li>pHxOvarianCA="+self.pHxOvarianCA()+"</li>"
        str += "<li>pHxFallopianCA="+self.pHxFallopianCA()+"</li>"
        str += "<li>pHxPeritonealCA="+self.pHxPeritonealCA()+"</li>"
        str += "<li>fHxOvCARiskGroupA="+self.fHxOvCARiskGroupA()+"</li>"
        str += "<li>fHxOvarianCA="+self.fHxOvarianCA()+"</li>"
        str += "<li>fHxFallopianCA="+self.fHxFallopianCA()+"</li>"
        str += "<li>fHxPeritonealCA="+self.fHxPeritonealCA()+"</li>"
        str += "</ul></p>"
        ###
        return str

  return SurveyResponse

###
Copyright 2011 Health Records for Everyone

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

###