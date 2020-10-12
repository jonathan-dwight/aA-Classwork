import React from "react";
import BenchIndexItem from "./bench_index_item"

class BenchIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.fetchBenches();
    }

    render() {
        let benches = this.props.benches.map((el) => {
            return <BenchIndexItem key={el.id} bench={el}/>
        });

        return (
            <>
                <ul>
                    {benches}
                </ul>
            </>
        )
    }
}

export default BenchIndex;