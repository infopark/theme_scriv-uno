class CreateBroadPageMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'BroadPage', attributes: [
      {name: 'teaser_headline', type: :string},
      {name: 'teaser_content', type: :html},
      {name: 'show_in_navigation', type: :enum, values: %w{yes no}, default: "yes"},
      {name: 'content', type: :widget}
    ])

    # do something about icons page:
    p = Obj.find_by_path("/misc/icon_boxes")
    p.update(_obj_class: "BroadPage")
    p.update(content: p.content << HeadlineWidget.new(headline: "A Skill Slider"))  
    p.update(content: p.content << TwoColumnWidget.new(
      column_1_width: "3", column_1: [],
      column_2_width: "9", column_2: [
        TextWidget.new(content: "
          <h4>Business Lorem Ipsum</h4>
          <div class=\"progress\">
            <div style=\"width: 60%;\" aria-valuemax=\"100\" aria-valuemin=\"0\" aria-valuenow=\"60\" role=\"progressbar\" class=\"progress-bar\">
              60%
            </div>
          </div>
          <h4>Lorem Ipsum Placeholder</h4>
          <div class=\"progress\">
            <div style=\"width: 35%;\" aria-valuemax=\"100\" aria-valuemin=\"0\" aria-valuenow=\"35\" role=\"progressbar\" class=\"progress-bar progress-bar-success \">
              35%
            </div>
          </div>
          <h4>Relaunch everything</h4>
          <div class=\"progress\">
            <div style=\"width: 75%;\" aria-valuemax=\"100\" aria-valuemin=\"0\" aria-valuenow=\"75\" role=\"progressbar\" class=\"progress-bar\">
              75%
            </div>
           </div>")
      ])
    )
  end
end
