class CompanyStateID{

  String watching = "watching";
  String inturn_selection = "inturn_selection";
  String inturn_join= "inturn_join";
  String main_selection = "main_selection";
  String got_job = "got_job";
  String prayed = "prayed";
  String other = "other";

  String indexToCompanyStateID(index){
      String companyStateID = "";
      switch (index){
        case 0: companyStateID = CompanyStateID().watching;
        case 1: companyStateID = CompanyStateID().inturn_selection;
        case 2: companyStateID = CompanyStateID().inturn_join;
        case 3: companyStateID = CompanyStateID().main_selection;
        case 4: companyStateID = CompanyStateID().got_job;
        case 5: companyStateID = CompanyStateID().prayed;
        default: companyStateID = CompanyStateID().other;
      }
      return companyStateID;
  }


  String indexToCompanyStateName(index){
      String companyStateID = "";
      switch (index){
        case 0: companyStateID = "検討中";
        case 1: companyStateID = "インターン選考中";
        case 2: companyStateID = "インターン参加";
        case 3: companyStateID = "本選考中";
        case 4: companyStateID = "🎉内定";
        case 5: companyStateID = "🙏落選";
        default: companyStateID = "その他";
      }
      return companyStateID;
  }

}