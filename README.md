# AD-MERGE 2.0 Integrated Assessment Model

AD-MERGE 2.0 is a global dynamic integrated assessment model (IAM) designed to evaluate long-term climate change mitigation and adaptation strategies within a hybrid economic-technology framework. It captures the interactions between the global economy, technological transitions, and climate impacts across 15 world regions.

The model simulates the full dynamics of mitigation and adaptation policies through 2100 (extendable to 2200), providing a platform for scenario analysis, policy evaluation, and technology assessment under varying socioeconomic pathways.

### MERGE: Historical developments

* **MERGE** ([Manne et al., 1995](https://www.sciencedirect.com/science/article/pii/030142159590763W))
    * A model for evaluating regional and global effects of GHG reduction policies is a hybrid **IAM** developed by Manne et al. in 1995.
* **MERGE-ETL** (Bahn et al., [2003](https://www.inderscienceonline.com/doi/abs/10.1504/IJGEI.2003.003199), [2006](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1475-3995.2008.00678.x), [2009](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1475-3995.2008.00678.x), [2011](https://www.sciencedirect.com/science/article/pii/S0301421510007342))
    * MERGE with **endogenous technological progress** was developed by Bahn et al. in 2003.
    * MERGE-ETL was also used for studying  the coupling of optimal economic growth and climate dynamics, the stability of international environmental agreements, and climate policies avoiding a tipping point in the climate system & international environmental agreements
* **AD-MERGE** ([Bahn et al., 2019](https://journals.sagepub.com/doi/abs/10.5547/01956574.40.4.obah))
    * Building on MERGE version 5, Bahn et al. introduced **explicit climate change adaptation** in 2019.
    * Includes reactive and proactive adaptation strategies
* **AD-MERGE 2.0** *(Current study)*
    * Updated base-year, regional disaggregation, energy system representation, climate module, adaptation, and damages were introduced in AD-MERGE 2.0.

## Setup

## 🔧 Model Structure Overview

This repository hosts a scenario-based GAMS modeling framework intended to explore long-term dynamics under varying assumptions and configurations. The design is intentionally modular, allowing flexibility across experimental setups while supporting a standardized execution flow. This is a general overview of how the model is structured and how you can navigate it.

### 📁 Modules

The `Modules` directory contains the conceptual and operational backbone of the model. It is subdivided into functional layers reflecting both the static architecture and dynamic behavior of the modeling environment.

- **Declarations**: This subfolder is foundational. It outlines all the elemental objects—sets, parameters, variables, equations—essential to model articulation. These declarations are spread across multiple files based on their thematic or structural role. For instance, general variable definitions (`Dec_vars.gms`) coexist with more targeted modules like `Dec_vars_clim.gms` for climate representation or `Dec_vars_ETA.gms` concerning the energy system. Files such as `Dec-var-RLDC.gms` are reserved for less generalizable components, linked perhaps to niche or regional applications. Some files are straightforward, others are more nuanced—each playing a part in the model's initialization.

- **Definitions**: If the declarations identify the ingredients, the definitions dictate the recipe. Here, the logic takes form: equations are written, parameter rules embedded, and set relationships drawn. The components are divided across folders for equations, parameters, and sets, allowing flexibility to iterate or specialize without overhauling the entire model form.

### 🧮 Solve

This folder encapsulates the pathways by which the model is translated into results. The solver logic may shift depending on the experimental structure, yet the overall flow—loading, solving, post-processing—remains conceptually stable. 

Files like `Solve_opt.gms` serve as primary execution paths, while others like `Solver.gms` typically contain the technical interaction with GAMS, and `ComputeCalcs.gms` handles supplementary calculations. These scripts can be modified or rerouted depending on what part of the solution space is being emphasized.

### 📊 Results

The model's narrative culminates here. In `report.gms`, outputs are extracted, shaped, and presented. Whether the interest lies in energy transitions, economic trends, or emissions pathways, this file provides a channel to interpret the computational results in light of scenario assumptions. 

### 📥 Input

Although not expanded here, the `input` folder serves as the entry point for scenario framing. Here reside the initial conditions, assumptions, and exogenous trajectories that shape how a given model run unfolds. Files may vary widely in format, resolution, and origin—each carrying traces of the narrative they support. These files are used for defining the initial scenarios and further sensitivity analysis

---

## Repository Structure

```
Scenarios
├── input/                        
│   ├── kth-m
...
├── Modules/                     
│   ├── Declarations/            
│   │   ├── Dec_sets       
│   │   ├── Dec_eqs         
...
│   ├── Definitions/    
│   │   ├── Equations/
│   │   ├   ├── Def_eqs_ETA
│   │   ├   ├── ...        
│   │   ├── Parameters/
│   │   ├   ├── Data_NgW
│   │   ├   ├── ...        
│   │   └── Sets/
│   │   ├   ├── Set_NgW
│   │   ├   ├── ...              
├── Results/
│   └── report             
├── Solve/                      
│   ├── ComputeCalcs
│   ├── Run_opt
│   ├── Run_iter
│   ├── ComputeCalcs     
...
main_scenarioname.gms
Server Configuration.sh
Run{scenarioname}MAC_server.sh
```


## Best Practices for Using GitHub

### Keeping Your Workspace Updated
1. **Before making changes, always pull the latest updates:**
   ```sh
   git pull origin main
   ```
2. **Regularly merge updates** from the main model if necessary.
3. **Work in your own folder** to avoid conflicts.
4. **Use descriptive commit messages** to document your changes.
5. **Follow a systematic naming structure** (`username_version`).

---


## Run AD-MERGE 

Get the source code of the AD-MERGE model:
git clone https://github.com/Kamyaramirmoeini/GMD_AD-MERGE2.0.git
Download and unzip. 

To run AD-MERGE you will need a working GAMS/CONOPT license or any.

Run AD-MERGE:
`gams main_scenarioname.gms`

If using LINUX: 

`nohup gams 4-main_scenarioname.gms o=output-scenarioname.lst s=restart.g00 action=CE gdx=GDX_scenarioname > Terminal-Run-AD-MERGE.txt 2>&1 &`

If you are using **Linux**, you can run the model by navigating to the `Run.sh` script:

```bash
./Run.sh
```

#### 🔁 Adaptation Scenarios: Restart-Based Execution

Some scenarios unfold in stages—what begins as a full model run can later be resumed, extended, or reinterpreted. In this modeling environment, such continuity is made possible through the use of GAMS work files, particularly save and restart. These files retain the internal state of a GAMS session: variable initializations, equation definitions, and solver-level structures. Though typically discarded after a run, they can be preserved deliberately to allow subsequent model files to build directly on prior work.

By placing `restart.g00` in the working directory and executing `1-restart_solver.gms`, the model can bypass redundant computations and instead reopen a previously solved space. This script expects that core structural decisions have already been made and focuses on subsequent processes—adaptation logic, for instance—that depend on earlier outcomes. What results is a sequencing of decisions: not a fresh solve, but a continuation from a frozen state of the system. The adaptation layer, then, becomes conditional—emerging only after mitigation has taken form.

This sequential structure reflects GAMS’s ability to split complex tasks into manageable phases. Rather than solving an entire system in one uninterrupted run, the process can be modularized—initial parts processed and stored, and later parts resumed with full continuity. This approach not only mirrors the logic of staged decision-making in climate policy, but also enhances flexibility: allowing revisions, corrections, or branching pathways without retracing the entire computation from the beginning.


## Visualization

We used the [Customizable DataFrame Plotter in Python](https://github.com/fredlavic/Customizable-DataFrame-Plotter-in-Python) to generate detailed and customizable graphs based on data stored in a Pandas DataFrame. It's designed primarily for analyzing GAMS Data eXchange (GDX) files, but it can handle any labelled data that can be transcribed into a DataFrame.

Follow the instructions provided in [Customizable DataFrame Plotter in Python](https://github.com/fredlavic/Customizable-DataFrame-Plotter-in-Python) for installation of GAMS API and loading GDX file into the Container object and run the Python file.

## Contact information
For more information please contact:
Kamyar.amirmoeini@hec.ca
Olivier.Bahn@hec.ca
