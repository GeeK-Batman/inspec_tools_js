var parser = require('xml2json');
import * as InspecJS from 'inspecjs';
import { thisTypeAnnotation, VariableDeclaration } from '@babel/types';
import { ConversionResult } from "inspecjs";
import { convertFile } from "inspecjs";
var fs = require('fs');

const valid_tags = [ "VulnDiscussion", "FalsePositives", "FalseNegatives",
"Documentable", "Mitigations", "SeverityOverrideGuidance",
"PotentialImpacts", "PotentialImpacts", "ThirdPartyTools",
"MitigationControl", "Responsibility", "IAControls" ]

interface Hash {
    [key: string] : any;
}

class XCCDF {
    xmlJSON: {[key: string] : any};
    profileJSON: ConversionResult;
    constructor(name: string) {
        var fileString = fs.readFileSync(name);
        //var cciList = fs.readFileSync()
        this.xmlJSON = parser.toJson(fileString,{object: true}).Benchmark;
        let exec: Hash = {};
        exec.profiles = [];
        exec.statistics = {}
        exec.statistics.duration = 0;
        exec.version = "2.0.0"
        var profile : Hash = {};
        profile.controls = [];
        profile['name'] = this.xmlJSON.id
        if(!profile['version'])
            profile['version'] = '0.1.0' 
        profile['title'] = this.xmlJSON.title
        if(!profile['maintainer'])
            profile['maintainer'] = 'The Authors' 
        if(!profile['copyright'])
            profile['copyright'] = 'The Authors' 
        if(!profile['copyright_email'])
            profile['copyright_email'] = 'you@example.com' 
        if(!profile['license'])
            profile['license'] = 'Apache-2.0' 
        profile['summary'] = this.xmlJSON.description.replace(/\\/g, '\\\\\\').replace(/"/g, '"');
        profile['supports'] = []
        profile['attributes'] = []
        profile['status'] = this.xmlJSON.status.plaintext + " on " + this.xmlJSON.status.date;
 
        for(var group of this.xmlJSON.Group) {
            var control: any = {}
            control['id'] = group.id
            control['title'] = group.Rule.title
            group.Rule.description = parser.toJson("<root>" + group.Rule.description + "</root>", {object: true})['root'];
            control['desc'] = group.Rule.description.VulnDiscussion.split('Satisfies: ')[0]
            control['impact'] = "high" // Utils::InspecUtil.get_impact(group.Rule.severity)
            control['refs'] = []
            control['tags'] = {}
            control['tags']['gtitle'] = group.title
            if(group.Rule.description.VulnDiscussion.split('Satisfies: ').length > 1)
                control['tags']['satisfies'] = group.Rule.description.VulnDiscussion.split('Satisfies: ')[1]
                .split(',').map((elem: string) => {
                    return elem.replace(/(^\s+|\s+$)/g,'');
                }) 
            control['tags']['gid'] = group.id
            control['tags']['rid'] = group.Rule.id
            control['tags']['stig_id'] = group.Rule.version
            control['tags']['fix_id'] = group.Rule.fix.id
            control['tags']['cci'] = group.Rule.idents
            control['tags']['nist'] = ["AC-2"] //@cci_items.fetch_nists(group.Rule.idents)
            if(group.Rule.description.FalseNegatives != '')
                control['tags']['false_negatives'] = group.Rule.description.FalseNegatives 
            if(group.Rule.description.FalsePositives != '')
                control['tags']['false_positives'] = group.Rule.description.FalsePositives 
            if(group.Rule.description.Documentable != '')
                control['tags']['documentable'] = group.Rule.description.Documentable 
            if(group.Rule.description.Mitigations != '')
                control['tags']['mitigations'] = group.Rule.description.FalseNegatives 
            if(group.Rule.description.SeverityOverrideGuidance != '')
                control['tags']['severity_override_guidance'] = group.Rule.description.SeverityOverrideGuidance 
            if(group.Rule.description.PotentialImpacts != '')
                control['tags']['potential_impacts'] = group.Rule.description.PotentialImpacts 
            if(group.Rule.description.ThirdPartyTools != '')
                control['tags']['third_party_tools'] = group.Rule.description.ThirdPartyTools 
            if(group.Rule.description.MitigationControls != '')
                control['tags']['mitigation_controls'] = group.Rule.description.MitigationControls 
            if(group.Rule.description.Responsibility != '')
                control['tags']['responsibility'] = group.Rule.description.Responsibility 
            if(group.Rule.description.IAControls != '')
                control['tags']['ia_controls'] = group.Rule.description.IAControls 
            control['tags']['check'] = group.Rule['check-content']
            control['tags']['fix'] = group.Rule.fixtext.$t
            control['code'] = "";
            control['source_location'] = {"ref": "","line": 0};
            control['results'] = []
            control['waver_data'] = {}
            profile.controls.push(control);
        }
        exec.profiles.push(profile);
        this.profileJSON = convertFile(JSON.stringify(exec));
    }

    stringify() {
        return JSON.stringify(this.profileJSON);
    }
}
export default XCCDF;
