﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Runtime Version: 1.1.4322.2032
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 1.1.4322.2032.
// 
namespace Sportsman_Field.ChampionshipServices {
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Web.Services;
    
    
    /// <remarks/>
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="ChampionshipServiceSoap", Namespace="http://www.mir.co.il/")]
    public class ChampionshipService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        /// <remarks/>
        public ChampionshipService() {
            string urlSetting = System.Configuration.ConfigurationSettings.AppSettings["Sportsman_Field.ChampionshipServices.ChampionshipService"];
            if ((urlSetting != null)) {
                this.Url = string.Concat(urlSetting, "");
            }
            else {
                this.Url = "http://localhost/ISF/SportServices/ChampionshipService.asmx";
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/GetSportFieldCompetitions", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Competition[] GetSportFieldCompetitions(int sportFieldID) {
            object[] results = this.Invoke("GetSportFieldCompetitions", new object[] {
                        sportFieldID});
            return ((Competition[])(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginGetSportFieldCompetitions(int sportFieldID, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("GetSportFieldCompetitions", new object[] {
                        sportFieldID}, callback, asyncState);
        }
        
        /// <remarks/>
        public Competition[] EndGetSportFieldCompetitions(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((Competition[])(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/GetCourtCompetitions", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Competition[] GetCourtCompetitions(int courtID) {
            object[] results = this.Invoke("GetCourtCompetitions", new object[] {
                        courtID});
            return ((Competition[])(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginGetCourtCompetitions(int courtID, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("GetCourtCompetitions", new object[] {
                        courtID}, callback, asyncState);
        }
        
        /// <remarks/>
        public Competition[] EndGetCourtCompetitions(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((Competition[])(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/LoadChampionship", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Phase[] LoadChampionship(int championshipCategoryId) {
            object[] results = this.Invoke("LoadChampionship", new object[] {
                        championshipCategoryId});
            return ((Phase[])(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginLoadChampionship(int championshipCategoryId, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("LoadChampionship", new object[] {
                        championshipCategoryId}, callback, asyncState);
        }
        
        /// <remarks/>
        public Phase[] EndLoadChampionship(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((Phase[])(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SaveChampionship", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SaveChampionship(int championshipCategoryId, ref Phase[] phases) {
            object[] results = this.Invoke("SaveChampionship", new object[] {
                        championshipCategoryId,
                        phases});
            phases = ((Phase[])(results[1]));
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSaveChampionship(int championshipCategoryId, Phase[] phases, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SaveChampionship", new object[] {
                        championshipCategoryId,
                        phases}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSaveChampionship(System.IAsyncResult asyncResult, out Phase[] phases) {
            object[] results = this.EndInvoke(asyncResult);
            phases = ((Phase[])(results[1]));
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SaveMatch", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SaveMatch(int championshipCategoryId, int phase, int group, int round, int match, System.DateTime time, int facility, int court) {
            object[] results = this.Invoke("SaveMatch", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        round,
                        match,
                        time,
                        facility,
                        court});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSaveMatch(int championshipCategoryId, int phase, int group, int round, int match, System.DateTime time, int facility, int court, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SaveMatch", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        round,
                        match,
                        time,
                        facility,
                        court}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSaveMatch(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SaveCompetition", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SaveCompetition(int championshipCategoryId, int phase, int group, int sportField, int competition, System.DateTime time, int facility, int court) {
            object[] results = this.Invoke("SaveCompetition", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        sportField,
                        competition,
                        time,
                        facility,
                        court});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSaveCompetition(int championshipCategoryId, int phase, int group, int sportField, int competition, System.DateTime time, int facility, int court, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SaveCompetition", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        sportField,
                        competition,
                        time,
                        facility,
                        court}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSaveCompetition(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SaveHeat", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SaveHeat(int championshipCategoryId, int phase, int group, int competition, int heat, System.DateTime time, int facility, int court) {
            object[] results = this.Invoke("SaveHeat", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        competition,
                        heat,
                        time,
                        facility,
                        court});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSaveHeat(int championshipCategoryId, int phase, int group, int competition, int heat, System.DateTime time, int facility, int court, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SaveHeat", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        competition,
                        heat,
                        time,
                        facility,
                        court}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSaveHeat(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SetCompetitorResult", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SetCompetitorResult(int champCategory, int phase, int group, int competition, int competitorIndex, string result, int score) {
            object[] results = this.Invoke("SetCompetitorResult", new object[] {
                        champCategory,
                        phase,
                        group,
                        competition,
                        competitorIndex,
                        result,
                        score});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSetCompetitorResult(int champCategory, int phase, int group, int competition, int competitorIndex, string result, int score, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SetCompetitorResult", new object[] {
                        champCategory,
                        phase,
                        group,
                        competition,
                        competitorIndex,
                        result,
                        score}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSetCompetitorResult(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SetTeamsResult", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SetTeamsResult(int championshipCategoryId, int phase, int group, TeamResult[] teamsResult) {
            object[] results = this.Invoke("SetTeamsResult", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        teamsResult});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSetTeamsResult(int championshipCategoryId, int phase, int group, TeamResult[] teamsResult, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SetTeamsResult", new object[] {
                        championshipCategoryId,
                        phase,
                        group,
                        teamsResult}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSetTeamsResult(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/SetResult", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool SetResult(Result result) {
            object[] results = this.Invoke("SetResult", new object[] {
                        result});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginSetResult(Result result, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("SetResult", new object[] {
                        result}, callback, asyncState);
        }
        
        /// <remarks/>
        public bool EndSetResult(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://www.mir.co.il/GetDateChampionships", RequestNamespace="http://www.mir.co.il/", ResponseNamespace="http://www.mir.co.il/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public DateChampionship[] GetDateChampionships(System.DateTime from, System.DateTime to) {
            object[] results = this.Invoke("GetDateChampionships", new object[] {
                        from,
                        to});
            return ((DateChampionship[])(results[0]));
        }
        
        /// <remarks/>
        public System.IAsyncResult BeginGetDateChampionships(System.DateTime from, System.DateTime to, System.AsyncCallback callback, object asyncState) {
            return this.BeginInvoke("GetDateChampionships", new object[] {
                        from,
                        to}, callback, asyncState);
        }
        
        /// <remarks/>
        public DateChampionship[] EndGetDateChampionships(System.IAsyncResult asyncResult) {
            object[] results = this.EndInvoke(asyncResult);
            return ((DateChampionship[])(results[0]));
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Competition {
        
        /// <remarks/>
        public int SportField;
        
        /// <remarks/>
        public System.DateTime Time;
        
        /// <remarks/>
        public int Facility;
        
        /// <remarks/>
        public int Court;
        
        /// <remarks/>
        public Competitor[] Competitors;
        
        /// <remarks/>
        public Heat[] Heats;
        
        /// <remarks/>
        public int championshipCategory;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Competitor {
        
        /// <remarks/>
        public int PlayerId;
        
        /// <remarks/>
        public int Heat;
        
        /// <remarks/>
        public int Position;
        
        /// <remarks/>
        public int ResultPosition;
        
        /// <remarks/>
        public string Result;
        
        /// <remarks/>
        public int Score;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class DateChampionship {
        
        /// <remarks/>
        public System.DateTime Day;
        
        /// <remarks/>
        public int ChampionshipCategory;
        
        /// <remarks/>
        public int Games;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Result {
        
        /// <remarks/>
        public int ChampionshipCategoryId;
        
        /// <remarks/>
        public int Phase;
        
        /// <remarks/>
        public int Group;
        
        /// <remarks/>
        public TeamResult[] TeamsResult;
        
        /// <remarks/>
        public int Round;
        
        /// <remarks/>
        public int Match;
        
        /// <remarks/>
        public System.Double TeamAScore;
        
        /// <remarks/>
        public System.Double TeamBScore;
        
        /// <remarks/>
        public int MatchResult;
        
        /// <remarks/>
        public string PartsResult;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class TeamResult {
        
        /// <remarks/>
        public int Games;
        
        /// <remarks/>
        public System.Double Points;
        
        /// <remarks/>
        public System.Double PointsAgainst;
        
        /// <remarks/>
        public int SmallPoints;
        
        /// <remarks/>
        public int SmallPointsAgainst;
        
        /// <remarks/>
        public System.Double Score;
        
        /// <remarks/>
        public int Wins;
        
        /// <remarks/>
        public int Loses;
        
        /// <remarks/>
        public int Ties;
        
        /// <remarks/>
        public int TechnicalWins;
        
        /// <remarks/>
        public int TechnicalLoses;
        
        /// <remarks/>
        public int Position;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Match {
        
        /// <remarks/>
        public int TeamAPos;
        
        /// <remarks/>
        public int TeamBPos;
        
        /// <remarks/>
        public System.DateTime Time;
        
        /// <remarks/>
        public int Facility;
        
        /// <remarks/>
        public int Court;
        
        /// <remarks/>
        public System.Double TeamAScore;
        
        /// <remarks/>
        public System.Double TeamBScore;
        
        /// <remarks/>
        public int Result;
        
        /// <remarks/>
        public string PartsResult;
        
        /// <remarks/>
        public int Cycle;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Round {
        
        /// <remarks/>
        public string Name;
        
        /// <remarks/>
        public Match[] Matches;
        
        /// <remarks/>
        public int Status;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Team {
        
        /// <remarks/>
        public int PreviousGroup;
        
        /// <remarks/>
        public int PreviousPosition;
        
        /// <remarks/>
        public int TeamId;
        
        /// <remarks/>
        public int Games;
        
        /// <remarks/>
        public System.Double Points;
        
        /// <remarks/>
        public System.Double PointsAgainst;
        
        /// <remarks/>
        public int SmallPoints;
        
        /// <remarks/>
        public int SmallPointsAgainst;
        
        /// <remarks/>
        public int Wins;
        
        /// <remarks/>
        public int Loses;
        
        /// <remarks/>
        public int Ties;
        
        /// <remarks/>
        public int TechnicalWins;
        
        /// <remarks/>
        public int TechnicalLoses;
        
        /// <remarks/>
        public System.Double Score;
        
        /// <remarks/>
        public int ResultPosition;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Group {
        
        /// <remarks/>
        public string Name;
        
        /// <remarks/>
        public int Status;
        
        /// <remarks/>
        public Team[] Teams;
        
        /// <remarks/>
        public Round[] Rounds;
        
        /// <remarks/>
        public Competition[] Competitions;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Phase {
        
        /// <remarks/>
        public string Name;
        
        /// <remarks/>
        public Group[] Groups;
        
        /// <remarks/>
        public int Status;
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.mir.co.il/")]
    public class Heat {
        
        /// <remarks/>
        public System.DateTime Time;
        
        /// <remarks/>
        public int Facility;
        
        /// <remarks/>
        public int Court;
    }
}
