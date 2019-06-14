/**************************************************************************
 Program:  Cps_finish_new.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   P. Tatian
 Created:  05/25/19
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Autocall macro to finish CPS data sets (new version).

 Modifications:
**************************************************************************/

%macro Cps_finish_new();

  ** Remove gtcbsa. from temporary format catalog (missing Boston MSA) **;
  
  proc catalog catalog=formats;
    delete gtcbsa / entrytype=format;
  quit;
  
  ** Add formats to data set **;
  
  proc datasets library=work memtype=(data) nolist;
    modify &dataset;
      format
        hrecord    hrecord.  
        hunits     hunits.   
        hefaminc   hefaminc. 
        h_respnm   h_respnm. 
        h_hhtype   h_hhtype. 
        h_numper   h_numper. 
        hnumfam    hnumfam.  
        h_type     h_type.   
        h_month    h_month.  
        h_hhnum    h_hhnum.  
        h_livqrt   h_livqrt. 
        h_typebc   h_typebc. 
        h_tenure   h_tenure. 
        h_telhhd   h_telhhd. 
        h_telavl   h_telavl. 
        h_telint   h_telint. 
        gereg      gereg.    
        gestfips   gestfips. 
        gtcbsa     gtcbsa.   
        gtco       gtco.     
        gtcbsast   gtcbsast. 
        gtmetsta   gtmetsta. 
        gtindvpc   gtindvpc. 
        gtcbsasz   gtcbsasz. 
        gtcsa      gtcsa.    
        hunder15   hunder1e. 
        hh5to18    hh5to18l. 
        hhotlun    hhotlun.  
        hhotno     hhotno.   
        hflunch    hflunch.  
        hflunno    hflunno.  
        hpublic    hpublic.  
        hlorent    hlorent.  
        hfoodsp    hfoodsp.  
        hfoodno    hfoodno.  
        hfoodmo    hfoodmo.  
        hengast    hengast.  
        hengval    hengval.  
        hinc_ws    hinc_ws.  
        hwsval     hwsval.   
        hinc_se    hinc_se.  
        hseval     hseval.   
        hinc_fr    hinc_fr.  
        hfrval     hfrval.   
        hinc_uc    hinc_uc.  
        hucval     hucval.   
        hinc_wc    hinc_wc.  
        hwcval     hwcval.   
        hss_yn     hss_yn.   
        hssval     hssval.   
        hssi_yn    hssi_yn.  
        hssival    hssival.  
        hpaw_yn    hpaw_yn.  
        hpawval    hpawval.  
        hvet_yn    hvet_yn.  
        hvetval    hvetval.  
        hsur_yn    hsur_yn.  
        hsurval    hsurval.  
        hdis_yn    hdis_yn.  
        hdisval    hdisval.  
        hret_yn    hret_yn.  
        hretval    hretval.  
        hint_yn    hint_yn.  
        hintval    hintval.  
        hdiv_yn    hdiv_yn.  
        hdivval    hdivval.  
        hrnt_yn    hrnt_yn.  
        hrntval    hrntval.  
        hed_yn     hed_yn.   
        hedval     hedval.   
        hcsp_yn    hcsp_yn.  
        hcspval    hcspval.  
        hfin_yn    hfin_yn.  
        hfinval    hfinval.  
        hoi_yn     hoi_yn.   
        hoival     hoival.   
        htotval    htotval.  
        hearnval   hearnval. 
        hothval    hothval.  
        hhinc      hhinc.    
        hmcare     hmcare.   
        hmcaid     hmcaid.   
        hchamp     hchamp.   
        hhi_yn     hhi_yn.   
        hhstatus   hhstatus. 
        hunder18   hunder1h. 
        htop5pct   htop5pct. 
        hpctcut    hpctcut.  
        h1tenure   h1tenure. 
        h1livqrt   h1livqrt. 
        h1telhhd   h1telhhd. 
        h1telavl   h1telavl. 
        h1telint   h1telint. 
        i_hhotlu   i_hhotlu. 
        i_hhotno   i_hhotno. 
        i_hflunc   i_hflunc. 
        i_hflunn   i_hflunn. 
        i_hpubli   i_hpubli. 
        i_hloren   i_hloren. 
        i_hfoods   i_hfoods. 
        i_hfdval   i_hfdval. 
        i_hfoodn   i_hfoodn. 
        i_hfoodm   i_hfoodm. 
        i_hengas   i_hengas. 
        i_hengva   i_hengva. 
        prop_tax   prop_tax. 
        housret    housret.  
        hrhtype    hrhtype.  
        i_hunits   i_hunits. 
        hrpaidcc   hrpaidcc. 
        hprop_val  hprop_val.
        thprop_val thprop_val.
        i_propval  i_propval.
        hrwicyn    hrwicyn.  
        hfdval     hfdval.   
        tcare_val  tcare_val.
        care_val   care_val. 
        i_careval  i_careval.
        hpres_mort hpres_mort.
        frecord    frecord.  
        fkind      fkind.    
        ftype      ftype.    
        fwifeidx   fwifeidx. 
        fhusbidx   fhusbidx. 
        fspouidx   fspouidx. 
        fownu6     fownu6l.  
        fownu18    fownu18l. 
        frelu6     frelu6l.  
        frelu18    frelu18l. 
        fpctcut    fpctcut.  
        famlis     famlis.   
        povll      povll.    
        frspov     frspov.   
        finc_ws    finc_ws.  
        finc_se    finc_se.  
        fseval     fseval.   
        finc_fr    finc_fr.  
        ffrval     ffrval.   
        finc_uc    finc_uc.  
        fucval     fucval.   
        finc_wc    finc_wc.  
        fwcval     fwcval.   
        finc_ss    finc_ss.  
        fssval     fssval.   
        finc_ssi   finc_ssi. 
        fssival    fssival.  
        finc_paw   finc_paw. 
        fpawval    fpawval.  
        finc_vet   finc_vet. 
        fvetval    fvetval.  
        finc_sur   finc_sur. 
        fsurval    fsurval.  
        finc_dis   finc_dis. 
        fdisval    fdisval.  
        finc_ret   finc_ret. 
        fretval    fretval.  
        finc_int   finc_int. 
        fintval    fintval.  
        finc_div   finc_div. 
        fdivval    fdivval.  
        finc_rnt   finc_rnt. 
        frntval    frntval.  
        finc_ed    finc_ed.  
        fedval     fedval.   
        finc_csp   finc_csp. 
        fcspval    fcspval.  
        finc_fin   finc_fin. 
        ffinval    ffinval.  
        finc_oi    finc_oi.  
        foival     foival.   
        ftotval    ftotval.  
        fearnval   fearnval. 
        fothval    fothval.  
        ftot_r     ftot_r.   
        fspanish   fspanish. 
        f_mv_fs    f_mv_fs.  
        f_mv_sl    f_mv_sl.  
        fhip_val   fhip_val. 
        fmoop      fmoop.    
        fotc_val   fotc_val. 
        fmed_val   fmed_val. 
        i_fhipval  i_fhipval.
        precord    precord.  
        a_parent   a_parent. 
        a_exprrp   a_exprrp. 
        perrp      perrp.    
        a_age      a_age.    
        a_maritl   a_maritl. 
        a_spouse   a_spouse. 
        a_sex      a_sex.    
        a_hga      a_hga.    
        prdtrace   prdtrace. 
        p_stat     p_stat.   
        prpertyp   prpertyp. 
        pehspnon   pehspnon. 
        prdthsp    prdthsp.  
        a_famnum   a_famnum. 
        a_famtyp   a_famtyp. 
        a_famrel   a_famrel. 
        a_pfrel    a_pfrel.  
        hhdrel     hhdrel.   
        famrel     famrel.   
        hhdfmx     hhdfmx.   
        parent     parent.   
        age1       age1l.    
        pecohab    pecohab.  
        pelnmom    pelnmom.  
        pelndad    pelndad.  
        pemomtyp   pemomtyp. 
        pedadtyp   pedadtyp. 
        peafever   peafever. 
        peafwhn1   peafwhna. 
        peafwhn2   peafwhnb. 
        peafwhn3   peafwhnc. 
        peafwhn4   peafwhnd. 
        pedisear   pedisear. 
        pediseye   pediseye. 
        pedisrem   pedisrem. 
        pedisphy   pedisphy. 
        pedisdrs   pedisdrs. 
        pedisout   pedisout. 
        prdisflg   prdisflg. 
        peinusyr   peinusyr. 
        prcitshp   prcitshp. 
        fl_665     fl_665l.  
        prdasian   prdasian. 
        pecert1    pecert1l. 
        pecert2    pecert2l. 
        pecert3    pecert3l. 
        a_fnlwgt   a_fnlwgt. 
        a_ernlwt   a_ernlwt. 
        a_hrs1     a_hrs1l.  
        a_uslft    a_uslft.  
        a_whyabs   a_whyabs. 
        a_payabs   a_payabs. 
        peioind    peioind.  
        peioocc    peioocc.  
        a_clswkr   a_clswkr. 
        a_wkslk    a_wkslk.  
        a_whenlj   a_whenlj. 
        a_nlflj    a_nlflj.  
        a_wantjb   a_wantjb. 
        prerelg    prerelg.  
        a_uslhrs   a_uslhrs. 
        a_hrlywk   a_hrlywk. 
        a_hrspay   a_hrspay. 
        a_grswk    a_grswk.  
        a_unmem    a_unmem.  
        a_uncov    a_uncov.  
        a_enrlw    a_enrlw.  
        a_hscol    a_hscol.  
        a_ftpt     a_ftpt.   
        a_lfsr     a_lfsr.   
        a_untype   a_untype. 
        a_wkstat   a_wkstat. 
        a_explf    a_explf.  
        a_wksch    a_wksch.  
        a_civlf    a_civlf.  
        a_ftlf     a_ftlf.   
        a_mjind    a_mjind.  
        a_dtind    a_dtind.  
        a_mjocc    a_mjocc.  
        a_dtocc    a_dtocc.  
        peio1cow   peio1cow. 
        prcow1     prcow1l.  
        pemlr      pemlr.    
        pruntype   pruntype. 
        prwkstat   prwkstat. 
        prptrea    prptrea.  
        prdisc     prdisc.   
        peabsrsn   peabsrsn. 
        prnlfsch   prnlfsch. 
        pehruslt   pehruslt. 
        workyn     workyn.   
        wrk_ck     wrk_ck.   
        wtemp      wtemp.    
        nwlook     nwlook.   
        nwlkwk     nwlkwk.   
        rsnnotw    rsnnotw.  
        wkswork    wkswork.  
        wkcheck    wkcheck.  
        losewks    losewks.  
        lknone     lknone.   
        lkweeks    lkweeks.  
        lkstrch    lkstrch.  
        pyrsn      pyrsn.    
        phmemprs   phmemprs. 
        hrswk      hrswk.    
        hrcheck    hrcheck.  
        ptyn       ptyn.     
        ptweeks    ptweeks.  
        ptrsn      ptrsn.    
        wexp       wexp.     
        wewkrs     wewkrs.   
        welknw     welknw.   
        weuemp     weuemp.   
        earner     earner.   
        clwk       clwk.     
        weclw      weclw.    
        ljcw       ljcw.     
        industry   industry. 
        occup      occup.    
        noemp      noemp.    
        nxtres     nxtres.   
        mig_cbst   mig_cbst. 
        migsame    migsame.  
        mig_reg    mig_reg.  
        mig_st     mig_st.   
        mig_dscp   mig_dscp. 
        gediv      gediv.    
        mig_div    mig_div.  
        mig_mtr1   mig_mtra. 
        mig_mtr3   mig_mtrc. 
        mig_mtr4   mig_mtrd. 
        ern_yn     ern_yn.   
        ern_srce   ern_srce. 
        ern_otr    ern_otr.  
        ern_val    ern_val.  
        wageotr    wageotr.  
        wsal_yn    wsal_yn.  
        wsal_val   wsal_val. 
        ws_val     ws_val.   
        seotr      seotr.    
        semp_yn    semp_yn.  
        semp_val   semp_val. 
        se_val     se_val.   
        frmotr     frmotr.   
        frse_yn    frse_yn.  
        frse_val   frse_val. 
        frm_val    frm_val.  
        uc_yn      uc_yn.    
        subuc      subuc.    
        strkuc     strkuc.   
        uc_val     uc_val.   
        wc_yn      wc_yn.    
        wc_type    wc_type.  
        wc_val     wc_val.   
        ss_yn      ss_yn.    
        ss_val     ss_val.   
        resnss1    resnss1l. 
        resnss2    resnss2l. 
        sskidyn    sskidyn.  
        ssi_yn     ssi_yn.   
        ssi_val    ssi_val.  
        resnssi1   resnssia. 
        resnssi2   resnssib. 
        ssikidyn   ssikidyn. 
        paw_yn     paw_yn.   
        paw_typ    paw_typ.  
        paw_mon    paw_mon.  
        paw_val    paw_val.  
        vet_yn     vet_yn.   
        vet_typ1   vet_typa. 
        vet_typ2   vet_typb. 
        vet_typ3   vet_typc. 
        vet_typ4   vet_typd. 
        vet_typ5   vet_type. 
        vet_qva    vet_qva.  
        vet_val    vet_val.  
        sur_yn     sur_yn.   
        sur_sc1    sur_sc1l. 
        sur_val1   sur_vala. 
        sur_val2   sur_valb. 
        srvs_val   srvs_val. 
        dis_hp     dis_hp.   
        dis_cs     dis_cs.   
        dis_yn     dis_yn.   
        dis_sc1    dis_sc1l. 
        dis_val1   dis_vala. 
        dis_val2   dis_valb. 
        dsab_val   dsab_val. 
        ret_yn     ret_yn.   
        ret_sc1    ret_sc1l. 
        ret_val1   ret_vala. 
        ret_val2   ret_valb. 
        rtm_val    rtm_val.  
        int_yn     int_yn.   
        int_val    int_val.  
        div_yn     div_yn.   
        div_val    div_val.  
        rnt_yn     rnt_yn.   
        rnt_val    rnt_val.  
        ed_yn      ed_yn.    
        oed_typ1   oed_typa. 
        oed_typ2   oed_typb. 
        oed_typ3   oed_typc. 
        ed_val     ed_val.   
        csp_yn     csp_yn.   
        csp_val    csp_val.  
        fin_yn     fin_yn.   
        fin_val    fin_val.  
        oi_off     oi_off.   
        oi_yn      oi_yn.    
        oi_val     oi_val.   
        ptotval    ptotval.  
        pearnval   pearnval. 
        pothval    pothval.  
        ptot_r     ptot_r.   
        perlis     perlis.   
        pov_univ   pov_univ. 
        wicyn      wicyn.    
        mcare      mcare.    
        mcaid      mcaid.    
        champ      champ.    
        hi_yn      hi_yn.    
        hiown      hiown.    
        hiemp      hiemp.    
        hipaid     hipaid.   
        emcontrb   emcontrb. 
        hi         hi.       
        hityp      hityp.    
        dephi      dephi.    
        hilin1     hilin1l.  
        hilin2     hilin2l.  
        paid       paid.     
        hiout      hiout.    
        priv       priv.     
        prityp     prityp.   
        depriv     depriv.   
        pilin1     pilin1l.  
        pilin2     pilin2l.  
        pout       pout.     
        out        out.      
        care       care.     
        caid       caid.     
        mon        mon.      
        oth        oth.      
        otyp_1     otyp_1l.  
        otyp_2     otyp_2l.  
        otyp_3     otyp_3l.  
        otyp_4     otyp_4l.  
        otyp_5     otyp_5l.  
        othstper   othstper. 
        othstyp1   othstypa. 
        hea        hea.      
        ihsflg     ihsflg.   
        ahiper     ahiper.   
        ahityp6    ahityp6l. 
        pchip      pchip.    
        cov_gh     cov_gh.   
        cov_hi     cov_hi.   
        ch_mc      ch_mc.    
        ch_hi      ch_hi.    
        marg_tax   marg_tax. 
        ctc_crd    ctc_crd.  
        penplan    penplan.  
        penincl    penincl.  
        filestat   filestat. 
        dep_stat   dep_stat. 
        eit_cred   eit_cred. 
        actc_crd   actc_crd. 
        fica       fica.     
        fed_ret    fed_ret.  
        agi        agi.      
        tax_inc    tax_inc.  
        fedtax_bc  fedtax_bc.
        fedtax_ac  fedtax_ac.
        statetax_bc statetax_bc.
        statetax_ac statetax_ac.
        paidccyn   paidccyn. 
        paidcyna   paidcyna. 
        moop       moop.     
        phip_val   phip_val. 
        potc_val   potc_val. 
        pmed_val   pmed_val. 
        chsp_val   chsp_val. 
        chsp_yn    chsp_yn.  
        chelsew_yn chelsew_yn.
        pxcert1    pxcert1l. 
        axrrp      axrrp.    
        axage      axage.    
        axmaritl   axmaritl. 
        axspouse   axspouse. 
        axsex      axsex.    
        axhga      axhga.    
        pxrace1    pxrace1l. 
        pxhspnon   pxhspnon. 
        pxcohab    pxcohab.  
        pxlndad    pxlndad.  
        pxafever   pxafever. 
        pxafwhn1   pxafwhna. 
        pxdisear   pxdisear. 
        pxnatvty   pxnatvty. 
        prwernal   prwernal. 
        prhernal   prhernal. 
        axhrs      axhrs.    
        axwhyabs   axwhyabs. 
        axpayabs   axpayabs. 
        axclswkr   axclswkr. 
        axnlflj    axnlflj.  
        axuslhrs   axuslhrs. 
        axhrlywk   axhrlywk. 
        axunmem    axunmem.  
        axuncov    axuncov.  
        axenrlw    axenrlw.  
        axhscol    axhscol.  
        axftpt     axftpt.   
        axlfsr     axlfsr.   
        i_workyn   i_workyn. 
        i_wtemp    i_wtemp.  
        i_nwlook   i_nwlook. 
        i_nwlkwk   i_nwlkwk. 
        i_rsnnot   i_rsnnot. 
        i_wkswk    i_wkswk.  
        i_wkchk    i_wkchk.  
        i_losewk   i_losewk. 
        i_lkweek   i_lkweek. 
        i_lkstr    i_lkstr.  
        i_pyrsn    i_pyrsn.  
        i_phmemp   i_phmemp. 
        i_hrswk    i_hrswk.  
        i_hrchk    i_hrchk.  
        i_ptyn     i_ptyn.   
        i_ptwks    i_ptwks.  
        i_ptrsn    i_ptrsn.  
        i_ljcw     i_ljcw.   
        i_indus    i_indus.  
        i_occup    i_occup.  
        i_noemp    i_noemp.  
        i_nxtres   i_nxtres. 
        i_mig1     i_mig1l.  
        i_mig2     i_mig2l.  
        i_mig3     i_mig3l.  
        i_disyn    i_disyn.  
        i_ernyn    i_ernyn.  
        i_ernsrc   i_ernsrc. 
        i_ernval   i_ernval. 
        i_retsc2   i_retscb. 
        i_wsyn     i_wsyn.   
        i_wsval    i_wsval.  
        i_seyn     i_seyn.   
        i_seval    i_seval.  
        i_frmyn    i_frmyn.  
        i_frmval   i_frmval. 
        i_ucyn     i_ucyn.   
        i_ucval    i_ucval.  
        i_wcyn     i_wcyn.   
        i_wctyp    i_wctyp.  
        i_wcval    i_wcval.  
        i_ssyn     i_ssyn.   
        i_ssval    i_ssval.  
        resnssa    resnssa.  
        i_ssiyn    i_ssiyn.  
        sskidyna   sskidyna. 
        i_ssival   i_ssival. 
        resnssia   resnssix. 
        i_pawyn    i_pawyn.  
        ssikdyna   ssikdyna. 
        i_pawtyp   i_pawtyp. 
        i_pawmo    i_pawmo.  
        i_pawval   i_pawval. 
        i_vetyn    i_vetyn.  
        i_vettyp   i_vettyp. 
        i_vetqva   i_vetqva. 
        i_vetval   i_vetval. 
        i_suryn    i_suryn.  
        i_sursc1   i_sursca. 
        i_sursc2   i_surscb. 
        i_survl1   i_survla. 
        i_survl2   i_survlb. 
        i_dishp    i_dishp.  
        i_discs    i_discs.  
        i_dissc1   i_dissca. 
        i_dissc2   i_disscb. 
        i_disvl1   i_disvla. 
        i_disvl2   i_disvlb. 
        i_retyn    i_retyn.  
        i_retsc1   i_retsca. 
        i_retvl1   i_retvla. 
        i_retvl2   i_retvlb. 
        i_intyn    i_intyn.  
        i_intval   i_intval. 
        i_divyn    i_divyn.  
        i_divval   i_divval. 
        i_rntyn    i_rntyn.  
        i_rntval   i_rntval. 
        i_edyn     i_edyn.   
        i_edtyp1   i_edtypa. 
        i_edtyp2   i_edtypb. 
        i_oedval   i_oedval. 
        i_cspyn    i_cspyn.  
        i_cspval   i_cspval. 
        i_finyn    i_finyn.  
        i_finval   i_finval. 
        i_oival    i_oival.  
        wicyna     wicyna.   
        i_hi       i_hi.     
        i_dephi    i_dephi.  
        i_paid     i_paid.   
        i_hiout    i_hiout.  
        i_priv     i_priv.   
        i_depriv   i_depriv. 
        i_pout     i_pout.   
        i_out      i_out.    
        i_care     i_care.   
        i_caid     i_caid.   
        i_mon      i_mon.    
        i_oth      i_oth.    
        i_otyp     i_otyp.   
        i_ostper   i_ostper. 
        i_ostyp    i_ostyp.  
        i_hea      i_hea.    
        iahiper    iahiper.  
        iahityp    iahityp.  
        i_pchip    i_pchip.  
        i_penpla   i_penpla. 
        i_peninc   i_peninc. 
        i_phipval  i_phipval.
        i_potcval  i_potcval.
        i_pmedval  i_pmedval.
        i_chspval  i_chspval.
        i_chspyn   i_chspyn. 
        i_chelsewyn i_chelsewyn.
        tsurval1   tsurvala. 
        tsurval2   tsurvalb. 
        tdisval1   tdisvala. 
        tdisval2   tdisvalb. 
        tretval1   tretvala. 
        tretval2   tretvalb. 
        tint_val   tint_val. 
        tdiv_val   tdiv_val. 
        trnt_val   trnt_val. 
        ted_val    ted_val.  
        tcsp_val   tcsp_val. 
        tfin_val   tfin_val. 
        toi_val    toi_val.  
        tphip_val  tphip_val.
        tpotc_val  tpotc_val.
        tpmed_val  tpmed_val.
        tchsp_val  tchsp_val.
      ;
  quit;
  
  ** Create output data sets **;

  data 
    &out._was
    &out._metros
    ;

    set &dataset;
    
    ** Additional variables *****;

    count = 1;

    label count = "Population count";

    %statecd( gestfips )
    %ucounty( gestfips, gtco )
    %a_race( prdtrace )
    %race_ethn( )
    
    ** Output records **;

    select ( statecd );
      when ( "11", "24", "51", "54" ) output &out._was;
      otherwise
        /** Not DC, MD, VA, or WV **/;
    end;
    
    ** Mid-large metro areas **;
    
    select ( gtcbsa );
      when ( 19100, 47900, 26420, 37980, 14460, 12060, 33100, 41860, 38060, 42660 ) output &out._metros;
      otherwise
        /** Do nothing **/;
    end;

  run;
  
  %Finalize_data_set( 
    /** Finalize data set parameters **/
    data=&out._was,
    out=&out._was,
    outlib=CPS,
    label="CPS March Supplement, &year, DC/MD/VA/WV",
    sortby=ph_seq a_lineno,
    /** Metadata parameters **/
    restrictions=None,
    revisions=%str(&revisions),
    /** File info parameters **/
    printobs=0,
    freqvars=statecd ucounty a_race race_ethn
  )

  %Finalize_data_set( 
    /** Finalize data set parameters **/
    data=&out._metros,
    out=&out._metros,
    outlib=CPS,
    label="CPS March Supplement, &year, mid-large metro areas",
    sortby=ph_seq a_lineno,
    /** Metadata parameters **/
    restrictions=None,
    revisions=%str(&revisions),
    /** File info parameters **/
    printobs=0,
    freqvars=gtcbsa a_race race_ethn
  )

  /**** Uncomment to check coding of racial variables ****
  proc freq data=&out._metros;
    tables a_race * prdtrace pehspnon * prdtrace * race_ethn / missing list nopercent nocum;
  run;
  ****/
  
%mend Cps_finish_new;

