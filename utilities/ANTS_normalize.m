function ANTS_normalize(image, template, outname)
% Normalize an image to the MNI template using ANTS

% Use the new MNI template by default
if notDefined('template') 
    tdir = fullfile(AFQ_directories,'templates','mni_icbm152_nlin_asym_09a_nifti');
    template = fullfile(tdir,'mni_icbm152_t2_tal_nlin_asym_09a.nii');
end
outname = prefix(prefix(image))
% Normalize the image to the template with ANTS
cmd = sprintf('antsIntroduction.sh -d 3 -r %s -i %s -o %s',template,image, outname);
system(cmd)