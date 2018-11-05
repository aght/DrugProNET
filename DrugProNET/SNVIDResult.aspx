﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BasePage.Master" AutoEventWireup="true" CodeBehind="SNVIDResult.aspx.cs" Inherits="DrugProNET.SNVIDResult" %>

<asp:Content runat="server" ContentPlaceHolderID="HeadContentPlaceHolder">
    <link rel="stylesheet" href="./css/3_column.css" />
    <link rel="stylesheet" href="./css/drug_info.css" />
    <link rel="stylesheet" href="./css/query_result.css" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyContentPlaceHolder">

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <h3 class="h3-side-title">General Info</h3>
        </div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Protein-Drug Interaction SNV Identification</h3>
            <p class="description">This query provides identification of single nucleotide variants (SNVs) in 
                the human genome that may affect specific protein-drug interactions. Using 
                critical amino acid residues in a target protein implicated in a specific 
                drug binding from a previous DrugProNET query. SNVs of these amino acids 
                are identified for their locations in the human genome and the consequence 
                of their mutation on binding of a speciic drug is predicted.
            </p>
        </div>
        <div class="c-col advertisment-content">
            <asp:UpdatePanel ID="ad_update_panel" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="ad_refresh_timer" runat="server" Interval="10000" OnPreRender="RenewAdvertisement" OnTick="RenewAdvertisement"></asp:Timer>
                    <asp:HyperLink ID="adLink" NavigateUrl="navigateurl" runat="server">
                        <asp:Image ImageUrl="imageUrl" runat="server" ID="adBanner" AlternateText="" />
                    </asp:HyperLink>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ad_refresh_timer" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content"></div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Protein/Gene Specifications</h3>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Gene Name:</p>
        </div>
        <div class="c-col body-content">
            <p id="gene_name" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">UniProt ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="uniprot_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">RefSeq ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="refseq_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Nucleotide ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="nucleotide_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Gene ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="gene_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Chromosome Location:</p>
        </div>
        <div class="c-col body-content">
            <p id="chromosome_location" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Gene Location:</p>
        </div>
        <div class="c-col body-content">
            <p id="gene_location" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">AA Residue No:</p>
        </div>
        <div class="c-col body-content">
            <p id="aa_residue_no" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">AA Residue Type:</p>
        </div>
        <div class="c-col body-content">
            <p id="aa_residue_type" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">No. Atomic Interactions:</p>
        </div>
        <div class="c-col body-content">
            <p id="atomic_interactions" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Average Atom Distance (Angstroms):</p>
        </div>
        <div class="c-col body-content">
            <p id="avg_atom_distance" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Interaction / Distance Ratio:</p>
        </div>
        <div class="c-col body-content">
            <p id="interaction_distance_ratio" runat="server"></p>
        </div>
    </div>


    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content"></div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Drug Specifications</h3>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">PDB Drug ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="PDB_drug_ID" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Drug Name:</p>
        </div>
        <div class="c-col body-content">
            <p id="drug_name" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">PubChem CID:</p>
        </div>
        <div class="c-col body-content">
            <p id="pubchem_cid" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">ChEMBL ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="chembl_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">ChemSpider ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="chemspider_id" runat="server"></p>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">DrugBank ID:</p>
        </div>
        <div class="c-col body-content">
            <p id="drugbank_id" runat="server"></p>
        </div>
    </div>
    


    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content"></div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">PDB Information</h3>
        </div>
    </div>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">PDB Entry:</p>
        </div>
        <div class="c-col body-content">
            <p id="PDB_entry" runat="server"></p>
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content"></div>
        <div class="c-col body-content longDiv" style="padding-top: 2em">
            <div style="display: inline-block; float: left; padding-right: 2em">
                <asp:Button ID="Button1" runat="server" Text="Download Table" />
            </div>
            <div>
                <p>Click to download MS-Excel file of predicted SNVs</p>
            </div>
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content"></div>
        <div class="c-col body-content longDiv" style="padding-top: 2em">
            <asp:Table runat="server" ID="interaction_list">
            </asp:Table>
        </div>
    </div>

</asp:Content>