# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

procedures_name = [
  'Lab tests', 'Cardiac stress test', 'Electrocardiography',
  'Plastic surgery', 'Electroencephalography', 'Electromyography',
  'Electroneuronography', 'Electronystagmography', 'Electrooculography',
  'Electroretinography', 'Endoluminal capsule monitoring', 'Esophageal motility study',
  'Evoked potential', 'Magnetoencephalography', 'Medical imaging',
  'Thrombosis prophylaxis', 'Precordial thump', 'Politzerization',
  'Hemodialysis', 'Hemofiltration', 'Plasmapheresis',
  'Apheresis', 'Extracorporeal membrane oxygenation (ECMO)', 'Cancer immunotherapy',
  'Cancer vaccine', 'Cervical conization', 'Chemotherapy',
  'Cytoluminescent therapy', 'Insulin potentiation therapy', 'Low-dose chemotherapy',
  'Monoclonal antibody therapy', 'Photodynamic therapy', 'Radiation therapy',
  'Targeted therapy', 'Tracheal intubation', 'Unsealed source radiotherapy',
  'Virtual reality therapy', 'Physical therapy/Physiotherapy', 'Speech therapy',
  'Phototerapy', 'Hydrotherapy', 'Heat therapy',
  'Shock therapy', 'Fluid replacement therapy', 'Palliative care',
  'Hyperbaric oxygen therapy', 'Oxygen therapy', 'Gene therapy',
  'Enzyme replacement therapy', 'Intravenous therapy', 'Phage therapy',
  'Respiratory therapy', 'Vision therapy', 'Electrotherapy',
  'Transcutaneous electrical nerve stimulation (TENS)', 'Laser therapy', 'Combination therapy',
  'Occupational therapy', 'Immunization', 'Vaccination',
  'Immunosuppressive therapy', 'Psychotherapy', 'Drug therapy',
  'Acupuncture', 'Antivenom', 'Magnetic therapy',
  'Craniosacral therapy', 'Chelation therapy', 'Hormonal therapy',
  'Hormone replacement therapy', 'Opiate replacement therapy', 'Cell therapy',
  'Stem cell treatments', 'Intubation', 'Nebulization',
  'Inhalation therapy', 'Particle therapy', 'Particle therapy',
  'Proton therapy', 'Fluoride therapy', 'Cold compression therapy',
  'Animal-Assisted Therapy', 'Negative Pressure Wound Therapy', 'Nicotine replacement therapy',
  'Oral rehydration therapy', 'Ablation', 'Amputation',
  'Biopsy', 'Cardiopulmonary resuscitation (CPR)', 'Cryosurgery',
  'Endoscopic surgery', 'Facial rejuvenation', 'General surgery',
  'Hand surgery', 'Hemilaminectomy', 'Image-guided surgery',
  'Knee cartilage replacement therapy', 'Laminectomy', 'Laparoscopic surgery',
  'Lithotomy', 'Lithotriptor', 'Lobotomy',
  'Neovaginoplasty', 'Radiosurgery', 'Stereotactic surgery',
  'Radiosurgery', 'Vaginoplasty', 'Xenotransplantation'
]
procedures_name.collect! {|item| {name: item} }

Procedure.create(procedures_name)