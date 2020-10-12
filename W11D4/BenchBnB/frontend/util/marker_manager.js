export default class MarkerManager {
    constructor(map) {
        this.map = map;
        this.markers = {};
    }

    updateMarkers(benches) {
        benches.map((el) => {
            this.markers[el.id] = el
            this.createMarkerFromBench(el)
        })
    }

    createMarkerFromBench(bench) {
        let map = this.map;
        const marker = new google.maps.Marker({
            map,
            position: { lat: bench.lat, lng: bench.lng },
            animation: google.maps.Animation.DROP,
        });
        // marker.setMap(this.map)
        marker.addListener("click", this.toggleBounce)
        
    }
    
    //need to figure out how to add the click to the marker

    toggleBounce() {
        if (marker.getAnimation() !== null) {
            marker.setAnimation(null);
        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }   
    

}

// this.props.benches.map((el) => {
//     this.MarkerManager.markers[el.id] = [el]
// })