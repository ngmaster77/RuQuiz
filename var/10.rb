quiz 'Titulo' do
fill_in do text 'La capital de USA es ---------- y está en el ----' 
answer [/washington/, /este/] end
drag_drop_fill_in do
  text 'The ---- brown fox jumped over the lazy ----'
  answer ['fox', 'dog']
end
end