def load_ws_rtc
  ::Scrivito::Workspace.current = ::Scrivito::Workspace.find_by_title('rtc')
end
