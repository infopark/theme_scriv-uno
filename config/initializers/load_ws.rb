def load_rtc
  ::Scrivito::Workspace.current = ::Scrivito::Workspace.find('rtc')
end
def destroy_rtc
  ::Scrivito::Workspace.find('rtc').destroy
end
