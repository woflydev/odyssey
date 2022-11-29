import React from "react"
import Typewriter from "typewriter-effect"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faGithub } from "@fortawesome/free-brands-svg-icons"
import { faLink } from "@fortawesome/free-solid-svg-icons"

export default function PopupTerminalWindow({
  title,
  popupImageAlt,
  popupImageAlt2,
  popupText,
  video,
  popupImageSrc,
  popupImageSrc2,
  popupGithubLink,
  popupLiveLink,
  techIcons,
  html,
}) {
  let link = ""
  techIcons = techIcons?.map(icon => (
    <li className="techItem tooltip" key={icon}>
      <span className="tooltiptext">{`${
        icon.charAt(0).toUpperCase() + icon.slice(1)
      }`}</span>
      <img
        className="svgIcon"
        src={`https://cdn.jsdelivr.net/npm/simple-icons@v5/icons/${icon}.svg`}
        alt="Tech Icon"
      />
    </li>
  ))

  return (
    <>
      <div
        className="popupTerminaWindowContainer"
        style={{ backgroundImage: `url(${popupImageSrc})` }}
      >
      <div>
        <h1 className="popupTerminaWindowHeader">
          <Typewriter
					options={{
                deleteSpeed: "natural",
								cursor: "_",
								delay: "60"
              }}
            onInit={typewriter => {
              typewriter
                .typeString(`${title}`)
                .start()
                .callFunction(function (state) {
                  state.elements.cursor.style.display = "_"
                })
            }}
          />
        </h1>
				
				{video === "false" ? ( // first image
          <div className="popupTerminalWindowImageContainer">
            {(link = popupLiveLink || popupGithubLink) ? ( // eslint-disable-line no-cond-assign
              <a href={link} target="_blank" rel="noopener noreferrer">
                <img
                  src={`${
                    /^https/.test(popupImageSrc)
                      ? popupImageSrc
                      : "/" + popupImageSrc
                  }`}
                  className="popupTerminaWindowImage"
                  alt={popupImageAlt}
                ></img>
              </a>
            ) : (
              <img
                src={`${
                  /^https/.test(popupImageSrc)
                    ? popupImageSrc
                    : "/" + popupImageSrc
                }`}
                className="popupTerminaWindowImage"
                alt={popupImageAlt}
              ></img>
							
            )}
          </div>
        ) : (
          <div className="popupTerminalWindowImageContainer">
            <video
              height="100%"
              width="100%"
              controls
              autoplay
              muted
              loop
              playsinline
              className="popupTerminaWindowImage"
            >
              <source src={video} type="video/mp4" />
              get a better browser lol, yours doesn't support embedded video.
            </video>
          </div>
        )}

        {popupImageSrc2 === "" || popupImageSrc2 === null ? ( // second image, this first checks if it is needed (if not included in the markdown, it will be empty, null, or undefined.)
          <h2>no image detected</h2>
        ) : (
          video === "false" ? (
            <div className="popupTerminalWindowImageContainer">
              {(link = popupLiveLink || popupGithubLink) ? ( // eslint-disable-line no-cond-assign
                <a href={link} target="_blank" rel="noopener noreferrer">
                  <img
                    src={`${
                      /^https/.test(popupImageSrc)
                        ? popupImageSrc
                        : "/" + popupImageSrc
                    }`}
                    className="popupTerminaWindowImage"
                    alt={popupImageAlt}
                  ></img>
                </a>
              ) : (
                <img
                  src={`${
                    /^https/.test(popupImageSrc)
                      ? popupImageSrc
                      : "/" + popupImageSrc
                  }`}
                  className="popupTerminaWindowImage"
                  alt={popupImageAlt}
                ></img>
							
              )}
            </div>
          ) : (
            <div className="popupTerminalWindowImageContainer">
              <video
                height="100%"
                width="100%"
                controls
                autoplay
                muted
                loop
                playsinline
                className="popupTerminaWindowImage"
              >
                <source src={video} type="video/mp4" />
                get a better browser lol, yours doesn't support embedded video.
              </video>
            </div>
          )
        )}

      </div>

        {popupGithubLink || popupLiveLink ? (
          <div className="popupTerminalWindowLinkIcons">
            {popupLiveLink ? (
              <a href={popupLiveLink} target="_blank" rel="noopener noreferrer">
                <FontAwesomeIcon
                  icon={faLink}
                  className="popupTerminalWindowLinkIcon"
                  size="2x"
                />
              </a>
            ) : (
              ""
            )}
            {popupGithubLink ? (
              <a
                href={popupGithubLink}
                target="_blank"
                rel="noopener noreferrer"
              >
                <FontAwesomeIcon
                  icon={faGithub}
                  className="popupTerminalWindowLinkIcon"
                  size="2x"
                />
              </a>
            ) : (
              ""
            )}
          </div>
        ) : (
          ""
        )}
        <div className="popupTerminaWindowTextContainer">
          <div
            className="popupTerminaWindowText"
            dangerouslySetInnerHTML={{ __html: html }}
          ></div>
          <p className="popupTerminaWindowText">{popupText}</p>
          {techIcons ? (
            <>
              <div className="break"></div>
              <div className="popupTerminalWindowFooter">
                <h4>Tech Used:</h4>
                <ul className="techItemsList">{techIcons}</ul>
              </div>
            </>
          ) : (
            ""
          )}
        </div>
      </div>
    </>
  )
}
