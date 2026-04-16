# A Reproducible Genomic Pipeline for Detecting Isoniazid Resistance Mutations in Mycobacterium tuberculosis
**Introduction**

Tuberculosis (TB) still remains a leading cause of infectious disease mortality worldwide, contributing to a global health challenges despite ongoing control efforts. As of 2025, an estimated 10.7 million incident cases of TB were reported worldwide, corresponding to an incidence rate of approximately 131 cases per 100,000 population with about 1.23 million deaths (World Health Organization, 2025). The continued burden of TB is sustained by factors such as delayed diagnosis, HIV-co-infection and are further complicated by the emergence and spread of drug-resistant strains, which threatens the effectiveness of standard treatment regimens (Feng _et al_., 2025). This increasing burden of drug-resistant TB highlights not only the need for effective therapeutics but also for high-throughput and accurate detection of resistance-associated mutation, particularly for those affecting key first-line drugs.

One of such drugs is isoniazid due to its potent bactericidal activity against _Mycobacterium tuberculosis._ Isoniazid (INH) is a prodrug whose antimicrobial activity is expressed only following activation by the catalase-peroxidase enzyme encoded by the _katG_ gene (Ghiladi _et al_., 2005; O'Connor _et al_., 2026). The activated form subsequently inhibits mycolic acid synthesis, an essential component of the mycobacterial cell wall (Abrahams & Besra, 2018; Takayama _et al_., 2005). Despite its clinical importance, resistance to INH is one of the most common forms of drug resistance in TB and is often an early step toward the development of multidrug-resistant tuberculosis (Roshdi Maleki, 2025).

At the molecular level, INH resistance is primary driven by mutations in genes involved in drug activation and target modification (Solo _et al_., 2020). High-level resistance is commonly associated with mutations in _KatG_ gene, particularly the S315T substitution which reduces or impairs activation of the prodrug, thereby limiting the formation of its active inhibitory metabolite (Solo _et al_., 2020). In contrast, low-level resistance is frequently linked to mutations in the promoter region of the _inhA_ gene, leading to overexpression of the InhA enzyme and reduced susceptibility to the drug (Solo _et al_., 2020). Importantly, _inhA_ promoter mutations may also confer cross-resistance to ethionamide, thereby further limiting treatment options (Click _et al_., 2020).

Traditional phenotypic drug susceptibility testing (DST) is considered a reference standard for but presents with limitations such as long turnaround times and reduced sensitivity in detecting certain resistant patterns (Saktiawati _et al_., 2024). Conversely, genomic approaches such as whole-genome sequencing, enables rapid identification of resistance associated mutations and provides a comprehensive understanding of resistance mechanism (Chigozie _et al_., 2025). Resources such the World Health Organisation catalogue of mutations in _Mycobacterium tuberculosis_ have further standardized the interpretation of these genetic markers, supporting the integration of molecular diagnostics into routine TB control strategies.

**Methods**

Whole-genome sequencing data from 10 Mycobacterium tuberculosis isolates were obtained from the European Nucleotide Archive (ENA). Raw reads were first assessed for quality and then cleaned by removing adapters and low-quality bases. The processed reads were aligned to the M. tuberculosis H37Rv reference genome (NC_000962.3), after which alignments were sorted and duplicate reads removed.

Variant calling was performed to identify SNPs and indels, which were then filtered to retain only high-confidence variants based on read depth and quality metrics. These variants were separated by type for downstream analyses and functionally annotated using the H37Rv reference to predict their potential biological impact.

Drug resistance prediction was performed using TBProfiler based on known resistance-associated mutations. Predicted mutations were then compared with the World Health Organization (WHO) catalogue of Mycobacterium tuberculosis resistance-associated mutations to assess concordance with curated reference standards.

**Results**

**Mutation Landscape Overview**

A total of 10 resistance-associated mutations were identified across the 10 _Mycobacterium tuberculosis_ isolates analysed. The mutation landscape showed clear dominance of a small number of canonical resistance variants (Figure 1A-D).

<p align="center">
  <img src="https://github.com/a-adegite/tb-isoniazid-mutation-analysis/blob/main/results/figures/mutation_landscape.png?raw=true"
       alt="Mutation Landscape"
       width="500">
</p>

**Figure 1. Mutation landscape and resistance profiles of _Mycobacterium tuberculosis_ isolates.**

(A) Distribution of mutation frequencies across identified variants, showing predominance of _katG_ p.S315T (c.944G>C). (B) Gene-level distribution of mutations, highlighting enrichment in _katG_ and _inhA_. (C) Phenotypic classification of isoniazid resistance levels, indicating proportions of high-level, low-level, and uncertain resistance. (D) Binary presence-absence matrix of mutations across isolates, demonstrating stratification into distinct mutation-driven groups and absence of co-occurrence between _katG_ and _inhA_ mutations.

**Mutation Frequency and Gene Distribution**

Mutation frequency analysis revealed that the _katG_ p.S315T (c.944G>C) substitution was the most prevalent variant, detected in 7/10 samples (70%) (Figure 1A). This was followed by the _inhA_ promoter mutation c.-777C>T, observed in 2/10 samples (20%), and a single occurrence of _inhA_ c.-809G>C (10%), classified as a variant of uncertain significance. Gene-level distribution showed that mutations were highly concentrated in two loci: _katG_ (70%) and _inhA_ (30%) (Figure 1B)

**Resistance Phenotype Distribution**

Phenotypic classification revealed that high-level resistance accounted for 70% (7/10) of isolates, low-level resistance for 20% (2/10), and 10% (1/10) were classified as of uncertain significance.

**Sample-Level Mutation Profiles**

Binary presence-absence mapping (Figure 1D) demonstrated clear stratification of the 10 isolates into mutation-driven groups. A dominant cluster carried the _katG_ p.S315T substitution, while a smaller cluster harboured _inhA_ promoter mutations. One isolate lacked well-characterized resistance-associated mutations, corresponding to the uncertain phenotypic classification. Notably, no co-occurrence of _katG_ and _inhA_ mutations was observed, suggesting distinct mutation patterns associated with high- and low-level isoniazid resistance in this dataset.

**Discussion**

The results demonstrate a mutation landscape dominated by the _katG_ p.S315T substitution, which accounted for the majority of resistance cases (70%). This aligns with global epidemiological data identifying this mutation as the principal driver of high-level isoniazid resistance (Seifert _et al_., 2015). Mechanistically, this variant impairs the catalase-peroxidase activity of _KatG_, preventing activation of isoniazid into its bactericidal form, thereby conferring strong resistance phenotypes (Barry _et al_., 1998). In contrast, mutations in the _inhA_ promoter region accounted for a smaller proportion of cases (20%) and were associated with low-level resistance. These mutations are known to increase expression of the _InhA_ enzyme, the target of activated isoniazid, thereby reducing drug susceptibility without completely abolishing drug activation pathways (Vilchèze & Jacobs JR., 2014; Dokrungkoon _et al_., 2023).

The detection of a variant of uncertain significance (c.-809G>C) highlights a key limitation in current resistance catalogues. While classified as uncertain, its presence in a regulatory region suggests a potential role in transcriptional modulation that warrants further experimental validation or larger cohort analysis. From a translational perspective, the strong agreement between TBProfiler and WHO catalogue annotations supports the robustness of computational resistance prediction frameworks.

However, this study is limited by its small sample size (n = 10), which restricts population-level inference, and by the absence of phenotypic drug susceptibility testing for independent validation. Despite these limitations, the findings highlight the potential utility of whole-genome sequencing for rapid resistance profiling and support its integration into tuberculosis control programs.

**Conclusion**

This study presents a reproducible genomic pipeline for identifying isoniazid resistance mutations in Mycobacterium tuberculosis. The analysis confirms the dominant role of the _katG_ p.S315T mutation in high-level resistance and highlights the contribution of _inhA_ promoter mutations to low-level resistance. The pipeline demonstrates strong concordance with established resistance catalogues and provides a scalable framework for genomic surveillance of drug-resistant tuberculosis.

**Reproducibility and Code Availability**

All scripts, workflows, and results are available at: <https://github.com/a-adegite/tb-isoniazid-mutation-analysis>

<p align="center"><strong>References</strong></p>

Abrahams, K. A., & Besra, G. S. (2018). Mycobacterial cell wall biosynthesis: a multifaceted antibiotic target. _Parasitology_, _145_(2), 116-133. <https://doi.org/10.1017/S0031182016002377>

Barry, C. E., Slayden, R. A., & Mdluli, K. (1998). Mechanisms of isoniazid resistance in Mycobacterium tuberculosis. _Drug Resistance Updates_, _1_(2), 128-134. <https://doi.org/10.1016/S1368-7646(98)80028-9>

Chigozie, V. U., Aniokete, C. U., Ogbonna, P. I., & Iroha, R. I. (2025). Transforming antimicrobial resistance mitigation: the genomic revolution in one health and public health. _Discover Applied Sciences_, _7_(10), 1187. <https://doi.org/10.1007/s42452-025-07053-7>

Click, E. S., Kurbatova, E. V, Alexander, H., Dalton, T. L., Chen, M. P., Posey, J. E., Ershova, J., & Cegielski, J. P. (2020). Isoniazid and Rifampin-Resistance Mutations Associated With Resistance to Second-Line Drugs and With Sputum Culture Conversion. _The Journal of Infectious Diseases_, _221_(12), 2072-2082. <https://doi.org/10.1093/infdis/jiaa042>

Dokrungkoon, T., Tulyaprawat, O., Suwannakarn, K., & Ngamskulrungroj, P. (2023). In vitro modeling of isoniazid resistance mechanisms in Mycobacterium tuberculosis H37Rv. _Frontiers in Microbiology_, _14_. <https://doi.org/10.3389/fmicb.2023.1171861>

Feng, L., Wang, Y., Li, L., Wang, X., & Feng, J. (2025). Global burden of HIV and drug-resistant tuberculosis co-infection and its attributable risk factors, 1990 to 2021, with projections to 2031. _BMC Infectious Diseases_, _25_(1), 1521. <https://doi.org/10.1186/s12879-025-11830-5>

Ghiladi, R. A., Medzihradszky, K. F., Rusnak, F. M., & Ortiz de Montellano, P. R. (2005). Correlation between Isoniazid Resistance and Superoxide Reactivity in _Mycobacterium tuberculosis_ KatG. _Journal of the American Chemical Society_, _127_(38), 13428-13442. <https://doi.org/10.1021/ja054366t>

O'Connor, C., Patel, P., & Brady, M. F. (2026). _Isoniazid_.

Roshdi Maleki, M. (2025). Genetic Analysis of Molecular Mechanisms of Drug Resistance in Mycobacterium tuberculosis Against Four Major First-Line Anti-Tuberculosis Drugs (Isoniazid, Rifampin, Ethambutol, and Pyrazinamide). _Infection and Drug Resistance_, _Volume 18_, 4901-4915. <https://doi.org/10.2147/IDR.S542287>

Saktiawati, A. M. I., Vasiliu, A., Saluzzo, F., & Akkerman, O. W. (2024). Strategies to Enhance Diagnostic Capabilities for the New Drug-Resistant Tuberculosis (DR-TB) Drugs. _Pathogens_, _13_(12), 1045. <https://doi.org/10.3390/pathogens13121045>

Seifert, M., Catanzaro, D., Catanzaro, A., & Rodwell, T. C. (2015). Genetic Mutations Associated with Isoniazid Resistance in Mycobacterium tuberculosis: A Systematic Review. _PLOS ONE_, _10_(3), e0119628. <https://doi.org/10.1371/journal.pone.0119628>

Solo, E. S., Nakajima, C., Kaile, T., Bwalya, P., Mbulo, G., Fukushima, Y., Chila, S., Kapata, N., Shah, Y., & Suzuki, Y. (2020). Mutations in rpoB and katG genes and the inhA operon in multidrug-resistant Mycobacterium tuberculosis isolates from Zambia. _Journal of Global Antimicrobial Resistance_, _22_, 302-307. <https://doi.org/10.1016/j.jgar.2020.02.026>

Takayama, K., Wang, C., & Besra, G. S. (2005). Pathway to Synthesis and Processing of Mycolic Acids in _Mycobacterium tuberculosis_. _Clinical Microbiology Reviews_, _18_(1), 81-101. <https://doi.org/10.1128/CMR.18.1.81-101.2005>

Vilchèze, C., & Jacobs JR., W. R. (2014). Resistance to Isoniazid and Ethionamide in _Mycobacterium tuberculosis_ : Genes, Mutations, and Causalities. _Microbiology Spectrum_, _2_(4). <https://doi.org/10.1128/microbiolspec.MGM2-0014-2013>

World Health Organization. (2025). _Global tuberculosis report 2025_.

&nbsp;
