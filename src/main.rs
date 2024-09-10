use yew::prelude::*;

fn main() {
    yew::Renderer::<App>::new().render();
}

#[function_component]
fn App() -> Html {
    html! {
        <div>
            <p>{ "hoge" }</p>
        </div>
    }
}
