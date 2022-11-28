import React, { useState } from "react"
import PropTypes from "prop-types"
import Typewriter from "typewriter-effect"

import "react-toggle/style.css"

const Header = ({ siteTitle }) => {
	// this was supposed to be big brane time but it bugs out lol
  const [isLoaded, setIsLoaded] = useState(
    typeof window !== "undefined"
      ? sessionStorage.getItem("isLoaded") || false
      : false
  )
	
	//const [isLoaded, setIsLoaded] = true

  return (
    <header>
      <div style={{ display: "inline-flex" }}>
        <h1>{">⠀"}</h1>
        <h1>
          {isLoaded ? (
            "Project Odyssey"
          ) : (
            <Typewriter
              style={{ marginTop: 0, paddingTop: 0 }}
              options={{
                deleteSpeed: "natural",
								cursor: "_",
                delay: "60"
              }}
              
              onInit={typewriter => {
                typewriter
                  .typeString("that's a feature, i swear!")
                  .pauseFor(2500)
                  .deleteAll()
                  .typeString("competent™ individuals™")
                  .pauseFor(2500)
									.deleteAll()
									.typeString("Project Odyssey")
									.pauseFor(69000000000)
                  .callFunction(() => {
                    setIsLoaded(true)
                  })
                  .start()
              }}
            />
          )}
        </h1>
      </div>
    </header>
  )
}

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
