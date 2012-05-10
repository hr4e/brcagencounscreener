(function() {

  define(['surveyResponse'], function(SurveyResponse) {
    var App;
    App = (function() {

      function App() {
        var self;
        self = this;
        this.pages = ko.observableArray(['spl', 'inf', 'p1', 'p2', 'p3', 'p3a', 'p3b', 'p3c', 'p4', 'p4a', 'p4b', 'p5', 'rAvgRisk', 'rIndetermRisk', 'rAboveAvgRisk', 'splExplain', 'infExplain', 'p1Explain', 'p2Explain', 'p3Explain', 'p4Explain', 'p5Explain', 'p3aExplain', 'p3bExplain', 'p3cExplain', 'p4aExplain', 'p4bExplain']);
        this.currentSurvey = ko.observable(new SurveyResponse);
        this.currentPage = ko.observable('spl');
        this.nextPage = ko.observable();
        this.currentIndex = ko.computed(function() {
          var currIndex;
          currIndex = self.pages().indexOf(self.currentPage());
          return currIndex;
        });
        this.exitRisk = ko.observable('indeterminate');
        this.exitRationale = ko.observable("");
        this.missingData = ko.observable("");
        this.explMode = ko.observable(false);
        this.explainMode = ko.computed(function() {
          return self.explMode();
        });
        this.ckTerm = ko.observable(false);
        this.checkForTerminalScreen = ko.computed(function() {
          self.ckTerm(false);
          if (self.currentPage() === 'rAvgRisk') self.ckTerm(true);
          if (self.currentPage() === 'rAboveAvgRisk') self.ckTerm(true);
          if (self.currentPage() === 'rIndetermRisk') self.ckTerm(true);
          return self.ckTerm();
        });
        this.ckExit = ko.observable(false);
        this.checkForExit = ko.computed(function() {
          var responseArray, result;
          self.ckExit(false);
          result = null;
          responseArray = self.currentSurvey().tabulateResponse();
          if (self.currentPage() === 'p1') {
            if (self.currentSurvey().pHxOvCARiskGroupA() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p2') {
            if (self.currentSurvey().fHxOvCARiskGroupA() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p3') {
            if (self.currentSurvey().pHxBreastCA() === 'No') {
              self.nextPage('p4');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p3a') {
            if (self.currentSurvey().pHxBrCALE50Years() === 'Yes' || self.currentSurvey().pHxBrCA3Neg() === 'Yes' || self.currentSurvey().pHxBrCAGT1PrimarySame() === 'Yes' || self.currentSurvey().pHxBrCAGT1PrimaryBoth() === 'Yes' || self.currentSurvey().pHxBrCADermMan() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p3b') {
            if (self.currentSurvey().ashkenaziJewish() === 'Yes' || self.currentSurvey().pHxBrCAGE1RelBrCALE50Years() === 'Yes' || self.currentSurvey().pHxBrCAGE2RelBrPancCA() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p3c') {
            if (self.currentSurvey().pHxBrCARiskGroupC() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            } else {
              self.nextPage('p5');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p4') {
            if (self.currentSurvey().recognizedRiskGroup() === 'Yes' || self.currentSurvey().fHxBrCASuscGene() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            } else if (self.currentSurvey().fHxBreastCA() === 'No') {
              self.nextPage('p5');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p4a') {
            if (self.currentSurvey().fHxBrCAMale() === 'Yes' || self.currentSurvey().fHxBrCASameSideGE2() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p4b') {
            if (self.currentSurvey().fHxBrCARiskGroupB() === 'Yes') {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.nextPage('rAboveAvgRisk');
              result = self.ckExit(true);
            }
          } else if (self.currentPage() === 'p5') {
            if (self.currentSurvey().fHxSufficient() === 'Yes') {
              if (self.currentSurvey().pHxBreastCA() === 'Yes') {
                if (self.currentSurvey().fHxOvCARiskGroupA() === 'No' && self.currentSurvey().pHxBrCALE50Years() === 'No' && self.currentSurvey().pHxBrCA3Neg() === 'No' && self.currentSurvey().pHxBrCAGT1PrimarySame() === 'No' && self.currentSurvey().pHxBrCAGT1PrimaryBoth() === 'No' && self.currentSurvey().pHxBrCADermMan() === 'No' && self.currentSurvey().ashkenaziJewish() === 'No' && self.currentSurvey().pHxBrCAGE1RelBrCALE50Years() === 'No' && self.currentSurvey().pHxBrCAGE2RelBrPancCA() === 'No' && self.currentSurvey().pHxBrCARiskGroupC() === 'No') {
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                  self.nextPage('rAvgRisk');
                  result = self.ckExit(true);
                } else {
                  self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                  self.missingData(self.currentSurvey().assembleMissingData(responseArray));
                  self.nextPage('rIndetermRisk');
                  result = self.ckExit(true);
                }
              } else {
                if (self.currentSurvey().fHxBreastCA() === 'No') {
                  if (self.currentSurvey().fHxOvCARiskGroupA() === 'No' && self.currentSurvey().recognizedRiskGroup() === 'No' && self.currentSurvey().fHxBrCASuscGene() === 'No') {
                    self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                    self.nextPage('rAvgRisk');
                    result = self.ckExit(true);
                  } else {
                    self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                    self.missingData(self.currentSurvey().assembleMissingData(responseArray));
                    self.nextPage('rIndetermRisk');
                    result = self.ckExit(true);
                  }
                } else {
                  if (self.currentSurvey().fHxOvCARiskGroupA() === 'No' && self.currentSurvey().recognizedRiskGroup() === 'No' && self.currentSurvey().fHxBrCASuscGene() === 'No' && self.currentSurvey().fHxBreastCA() === 'No' && self.currentSurvey().fHxBrCAMale() === 'No' && self.currentSurvey().fHxBrCASameSideGE2() === 'No' && self.currentSurvey().fHxBrCARiskGroupB() === 'No') {
                    self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                    self.nextPage('rAvgRisk');
                    result = self.ckExit(true);
                  } else {
                    self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
                    self.missingData(self.currentSurvey().assembleMissingData(responseArray));
                    self.nextPage('rIndetermRisk');
                    result = self.ckExit(true);
                  }
                }
              }
            } else {
              self.exitRationale(self.currentSurvey().assembleRationale(responseArray));
              self.missingData(self.currentSurvey().assembleMissingData(responseArray));
              self.nextPage('rIndetermRisk');
              result = self.ckExit(true);
            }
          } else {
            result = self.ckExit();
          }
          return result;
        });
        this.next = function() {
          var currIndex;
          if (!self.checkForExit()) {
            currIndex = self.currentIndex();
            if (currIndex < self.pages().length - 1) {
              self.nextPage(self.pages()[currIndex + 1]);
            } else {
              self.nextPage(self.pages()[0]);
            }
          }
          return self.currentPage(self.nextPage());
        };
        this.back = function() {
          var currIndex;
          if (self.currentPage() === 'rAboveAvgRisk') {
            self.nextPage('p1');
          } else if (self.currentPage() === 'rIndetermRisk') {
            self.nextPage('p1');
          } else {
            currIndex = self.currentIndex();
            if (currIndex > 0) {
              self.nextPage(self.pages()[currIndex - 1]);
            } else {
              self.nextPage(self.pages()[0]);
            }
          }
          return self.currentPage(self.nextPage());
        };
        this.goExplain = function() {
          self.explMode(true);
          if (self.currentPage() === 'spl') {
            return self.currentPage('splExplain');
          } else if (self.currentPage() === 'inf') {
            return self.currentPage('infExplain');
          } else if (self.currentPage() === 'p1') {
            return self.currentPage('p1Explain');
          } else if (self.currentPage() === 'p2') {
            return self.currentPage('p2Explain');
          } else if (self.currentPage() === 'p3') {
            return self.currentPage('p3Explain');
          } else if (self.currentPage() === 'p4') {
            return self.currentPage('p4Explain');
          } else if (self.currentPage() === 'p5') {
            return self.currentPage('p5Explain');
          } else if (self.currentPage() === 'p3a') {
            return self.currentPage('p3aExplain');
          } else if (self.currentPage() === 'p3b') {
            return self.currentPage('p3bExplain');
          } else if (self.currentPage() === 'p3c') {
            return self.currentPage('p3cExplain');
          } else if (self.currentPage() === 'p4a') {
            return self.currentPage('p4aExplain');
          } else if (self.currentPage() === 'p4b') {
            return self.currentPage('p4bExplain');
          } else {
            return self.explMode(false);
          }
        };
        this.returnExplain = function() {
          self.explMode(false);
          if (self.currentPage() === 'splExplain') {
            return self.currentPage('spl');
          } else if (self.currentPage() === 'infExplain') {
            return self.currentPage('inf');
          } else if (self.currentPage() === 'p1Explain') {
            return self.currentPage('p1');
          } else if (self.currentPage() === 'p2Explain') {
            return self.currentPage('p2');
          } else if (self.currentPage() === 'p3Explain') {
            return self.currentPage('p3');
          } else if (self.currentPage() === 'p4Explain') {
            return self.currentPage('p4');
          } else if (self.currentPage() === 'p5Explain') {
            return self.currentPage('p5');
          } else if (self.currentPage() === 'p3aExplain') {
            return self.currentPage('p3a');
          } else if (self.currentPage() === 'p3bExplain') {
            return self.currentPage('p3b');
          } else if (self.currentPage() === 'p3cExplain') {
            return self.currentPage('p3c');
          } else if (self.currentPage() === 'p4aExplain') {
            return self.currentPage('p4a');
          } else if (self.currentPage() === 'p4bExplain') {
            return self.currentPage('p4b');
          } else {
            return self.explMode(true);
          }
        };
        this.printPage = function() {
          self.explMode(false);
          return window.print();
        };
      }

      return App;

    })();
    return App;
  });

}).call(this);
