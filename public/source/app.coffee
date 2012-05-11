define ['surveyResponse'],(SurveyResponse) ->
  class App
    constructor: ->
      self = @
      #properties
      @pages = ko.observableArray(['spl','inf','p1','p2','p3','p3a','p3b','p3c','p4','p4a','p4b','p5',
        'rAvgRisk','rIndetermRisk','rAboveAvgRisk',
        'splExplain','infExplain',
        'p1Explain','p2Explain','p3Explain','p4Explain','p5Explain',
        'p3aExplain','p3bExplain','p3cExplain','p4aExplain','p4bExplain'
      ])
      @currentSurvey = ko.observable new SurveyResponse
      @currentPage = ko.observable('spl')
      @nextPage = ko.observable()
      @currentIndex = ko.computed ->
        currIndex = self.pages().indexOf self.currentPage()
        return currIndex

      @exitRisk = ko.observable('indeterminate')
      @exitRationale = ko.observable("")
      @missingData = ko.observable("")

      @explMode = ko.observable(false)
      @explainMode = ko.computed ->
        return self.explMode()

      @ckTerm = ko.observable(false)
      @checkForTerminalScreen = ko.computed ->
        self.ckTerm(false)
        if self.currentPage() == 'rAvgRisk'
          self.ckTerm(true)
        if self.currentPage() == 'rAboveAvgRisk'
          self.ckTerm(true)
        if self.currentPage() == 'rIndetermRisk'
          self.ckTerm(true)
        return self.ckTerm()

      @ckExit = ko.observable(false)
      @checkForExit = ko.computed ->
        self.ckExit(false)
        result = null
        responseArray = self.currentSurvey().tabulateResponse()
        if self.currentPage() is 'p1'
          if self.currentSurvey().pHxOvCARiskGroupA() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p2'
          if self.currentSurvey().fHxOvCARiskGroupA() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p3'
          if self.currentSurvey().pHxBreastCA() is 'No'
            # Skip over questions for woman with NO personal history of breast cancer
            self.nextPage('p4')
            result = self.ckExit(true)
        else if self.currentPage() is 'p3a'
          # Start of series of questions for woman with a history of breast cancer
          if self.currentSurvey().pHxBrCALE50Years() is 'Yes' ||
          self.currentSurvey().pHxBrCA3Neg() is 'Yes' ||
          self.currentSurvey().pHxBrCAGT1PrimarySame() is 'Yes' ||
          self.currentSurvey().pHxBrCAGT1PrimaryBoth() is 'Yes' ||
          self.currentSurvey().pHxBrCADermMan() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p3b'
          if self.currentSurvey().ashkenaziJewish() is 'Yes' ||
          self.currentSurvey().pHxBrCAGE1RelBrCALE50Years() is 'Yes' ||
          self.currentSurvey().pHxBrCAGE2RelBrPancCA() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p3c'
          if self.currentSurvey().pHxBrCARiskGroupC() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
          # At terminus of series; skip over stuff for women with NO history of breast CA
          else
            self.nextPage('p5')
            result = self.ckExit(true)
        else if self.currentPage() is 'p4'
          # Start of series of questions for woman with NO history of breast or ovarian cancer
          if self.currentSurvey().recognizedRiskGroup() is 'Yes' ||
          self.currentSurvey().fHxBrCASuscGene() is 'Yes'
            # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
          else if self.currentSurvey().fHxBreastCA() is 'No'
            # Skip over stuff for women with no family history of breast CA
            self.nextPage('p5')
            result = self.ckExit(true)
          # At terminus of series
        else if self.currentPage() is 'p4a'
          # There WAS a FHx of breast CA
          if self.currentSurvey().fHxBrCAMale() is 'Yes' ||
          self.currentSurvey().fHxBrCASameSideGE2() is 'Yes'
           # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p4b'
        # There WAS a FHx of breast CA
          if self.currentSurvey().fHxBrCARiskGroupB() is 'Yes'
          # A premature exit because of above average risk
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.nextPage('rAboveAvgRisk')
            result = self.ckExit(true)
        else if self.currentPage() is 'p5'
          # You get here ONLY if no premature exits; now check for incomplete data
          if self.currentSurvey().fHxSufficient() is 'Yes'
            if self.currentSurvey().pHxBreastCA() is 'Yes'
              # For women with a personal history of breast CA, check for incomplete data
              if self.currentSurvey().fHxOvCARiskGroupA() is 'No' &&
              self.currentSurvey().pHxBrCALE50Years() is 'No' &&
              self.currentSurvey().pHxBrCA3Neg() is 'No' &&
              self.currentSurvey().pHxBrCAGT1PrimarySame() is 'No' &&
              self.currentSurvey().pHxBrCAGT1PrimaryBoth() is 'No' &&
              self.currentSurvey().pHxBrCADermMan() is 'No' &&
              self.currentSurvey().ashkenaziJewish() is 'No' &&
              self.currentSurvey().pHxBrCAGE1RelBrCALE50Years() is 'No' &&
              self.currentSurvey().pHxBrCAGE2RelBrPancCA() is 'No' &&
              self.currentSurvey().pHxBrCARiskGroupC() is 'No'
                # There is NO missing data in the series
                self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                self.nextPage('rAvgRisk')
                result = self.ckExit(true)
              else
                # There was missing data somewhere in the series
                self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                self.missingData(self.currentSurvey().assembleMissingData(responseArray))
                self.nextPage('rIndetermRisk')
                result = self.ckExit(true)
            else
              # For women with NO personal history of breast CA
              if self.currentSurvey().fHxBreastCA() is 'No'
                # For women with NO personal or family history of breast CA, check for incomplete data
                if self.currentSurvey().fHxOvCARiskGroupA() is 'No' &&
                self.currentSurvey().recognizedRiskGroup() is 'No' &&
                self.currentSurvey().fHxBrCASuscGene() is 'No'
                # There NO missing data in the series
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                  self.nextPage('rAvgRisk')
                  result = self.ckExit(true)
                else
                  # There was missing data somewhere in the series
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                  self.missingData(self.currentSurvey().assembleMissingData(responseArray))
                  self.nextPage('rIndetermRisk')
                  result = self.ckExit(true)
              else
                # For women with no personal history of breast CA, but with a family history of breast CA, check
                # for incomplete data
                if self.currentSurvey().fHxOvCARiskGroupA() is 'No' &&
                self.currentSurvey().recognizedRiskGroup() is 'No' &&
                self.currentSurvey().fHxBrCASuscGene() is 'No' &&
                self.currentSurvey().fHxBreastCA() is 'No' &&
                self.currentSurvey().fHxBrCAMale() is 'No' &&
                self.currentSurvey().fHxBrCASameSideGE2() is 'No' &&
                self.currentSurvey().fHxBrCARiskGroupB() is 'No'
                  # There was NO missing data in the series
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                  self.nextPage('rAvgRisk')
                  result = self.ckExit(true)
                else
                  # There was missing data somewhere in the series
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
                  self.missingData(self.currentSurvey().assembleMissingData(responseArray))
                  self.nextPage('rIndetermRisk')
                  result = self.ckExit(true)
          else
            # You get here ONLY if fHxSufficient is 'No': meaning no female close blood relatives surviving beyond age 45.
            # so treat as "missing data"; there may be additional missing data too ...
            self.exitRationale(self.currentSurvey().assembleRationale(responseArray))
            self.missingData(self.currentSurvey().assembleMissingData(responseArray))
            self.nextPage('rIndetermRisk')
            result = self.ckExit(true)
        else
          # Should never get to an exit screen once development is complete
          result = self.ckExit()
        return result

      #methods
      @next = ->
        if !self.checkForExit()
          currIndex = self.currentIndex()
          if currIndex < self.pages().length-1
            self.nextPage(self.pages()[currIndex+1])
          else
            self.nextPage(self.pages()[0])
        self.currentPage(self.nextPage())

      @back = ->
        if self.currentPage() is 'rAboveAvgRisk'
          self.nextPage('p1')
        else if self.currentPage() is 'rIndetermRisk'
          self.nextPage('p1')
        else
          currIndex = self.currentIndex()
          if currIndex > 0
            self.nextPage(self.pages()[currIndex-1])
          else
            self.nextPage(self.pages()[0])
        self.currentPage(self.nextPage())

      @goExplain = ->
        self.explMode(true)
        if self.currentPage() is 'spl'
          self.currentPage('splExplain')
        else if self.currentPage() is 'inf'
          self.currentPage('infExplain')
        else if self.currentPage() is 'p1'
          self.currentPage('p1Explain')
        else if self.currentPage() is 'p2'
          self.currentPage('p2Explain')
        else if self.currentPage() is 'p3'
          self.currentPage('p3Explain')
        else if self.currentPage() is 'p4'
          self.currentPage('p4Explain')
        else if self.currentPage() is 'p5'
          self.currentPage('p5Explain')
        else if self.currentPage() is 'p3a'
          self.currentPage('p3aExplain')
        else if self.currentPage() is 'p3b'
          self.currentPage('p3bExplain')
        else if self.currentPage() is 'p3c'
          self.currentPage('p3cExplain')
        else if self.currentPage() is 'p4a'
          self.currentPage('p4aExplain')
        else if self.currentPage() is 'p4b'
          self.currentPage('p4bExplain')
        else
          self.explMode(false)

      @returnExplain = ->
        self.explMode(false)
        if self.currentPage() is 'splExplain'
          self.currentPage('spl')
        else if self.currentPage() is 'infExplain'
          self.currentPage('inf')
        else if self.currentPage() is 'p1Explain'
          self.currentPage('p1')
        else if self.currentPage() is 'p2Explain'
          self.currentPage('p2')
        else if self.currentPage() is 'p3Explain'
          self.currentPage('p3')
        else if self.currentPage() is 'p4Explain'
          self.currentPage('p4')
        else if self.currentPage() is 'p5Explain'
          self.currentPage('p5')
        else if self.currentPage() is 'p3aExplain'
          self.currentPage('p3a')
        else if self.currentPage() is 'p3bExplain'
          self.currentPage('p3b')
        else if self.currentPage() is 'p3cExplain'
          self.currentPage('p3c')
        else if self.currentPage() is 'p4aExplain'
          self.currentPage('p4a')
        else if self.currentPage() is 'p4bExplain'
          self.currentPage('p4b')
        else
          self.explMode(true)

      @printPage = ->
        self.explMode(false)
        window.print()

  return App

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