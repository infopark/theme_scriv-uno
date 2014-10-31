class InstallScrivito < Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'Page', is_binary: false, attributes: [
      {name: 'content',     type: 'widget'},
      {name: 'child_order', type: 'referencelist'},
    ])

    Scrivito::ObjClass.create(name: 'HeadlineWidget', is_binary: false, attributes: [
      {name: 'headline', type: :string}
    ])

    Scrivito::ObjClass.create(name: 'TextWidget', is_binary: false, attributes: [
      {name: 'content', type: 'html'}
    ])

    Scrivito::ObjClass.create(name: 'Image', is_binary: true)

    Scrivito::ObjClass.create(name: 'ImageWidget', is_binary: false, attributes: [
      {name: 'image',  type: 'reference'}
    ])

    Page.create(_path: '/', title: 'Welcome to Scrivito!', content: [
      HeadlineWidget.new(headline: 'A professional Cloud CMS built for Ruby on Rails.'),
      TextWidget.new(content: %{
        <h3>Add content management to your website</h3>
        <p>
        With Scrivito, you can develop your website like you always did.
        It just works, and it just works "The Rails Way".
        </p>
        <h3>No training for your editors required.</h3>
        <p>
        Your clients can edit content in-place, directly on the website itself.
        Intuitively, without any training or HTML skills.
        </p>
        <h3>No installation required</h3>
        <p>
        You should focus on the important things:
        Developing the functionality and look of your website.
        That's why we built Scrivito as a cloud service.
        So you don't have to keep on updating your CMS or worry about uptime all the time.
        And you always get the newest features.
        </p>
      })
    ])
  end
end
