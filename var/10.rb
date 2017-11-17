quiz 'Titulo' do
fill_in do text 'La capital de USA es ---------- y está en el ----' 
answer [/washington/, /este/] end
drag_drop_fill_in do
  text 'The ---- brown fox jumped over the lazy ----'
  answer ['fox', 'dog']
end
drag_drop_choice_answer do text 'Relacioname esta' 
relation :Facebook => 'Hola1',:twitter => 'hola2' 
end
end