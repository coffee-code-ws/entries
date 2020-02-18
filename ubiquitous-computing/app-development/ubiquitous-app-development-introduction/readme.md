[TOC]

# What is "Mobile Computing", "Ubiquitous Computing" and "Pervasive Computing"?

Research on mobile computing started around 1980 with the initial goal to enable users of mobile applications to experience an equivalent quality of service as found with stationary devices.
With the need for information anytime and anywhere emerged **mobile computing as a technical enablement of mobile access** through the integration of wireless networks into existing wired infrastructures and the availability of portable or mobile devices.

The relevant aspects of mobility are:

- *user mobility*: users communicate anywhere, with anybody
- *device mobility*: end user devices may be wirelessly connected anytime and anywhere to other devices
- *service / application mobility*: services and applications may move anytime and anywhere form one device to another

Mobile computing is no new concept. Most applications depend on the availability of information to provide a seamless, interoperable and location-independent experience.

Nowadays, people own, use and share multiple personal devices (e.g. laptops, smartphones, tablets, wearables) simultaneously. The market on stationary desktop devices has shrinked significantly due to the increase in use of handheld devices. Small devices are equipped with sensors and embedded into things of daily life. Consequently, with these abilities to sense the environment in the background of the users attention, it is now possible for applications to sense and react to the environmental changes, which makes them **context-aware**.
The paradigm **ubiquitous computing** takes these preconditions to serve **the right service, at the right place, at the right time**.

In this domain, the term **pervasive computing** stands for a pragmatic, industry driven perspective. It describes the integration of computing technology directly into business processes and subsequently the generation of new (mobile) business areas.

Today, the terms **pervasive computing** and **ubiquitous computing** are often used synonymously.


# Overview: The Main Challenges of Mobile Computing

Mobile computing comes with a lot of challenges for the application itself:

- **Connectivity Challenge**: How to exploit available network resources best in any situation?
- **Offline Challenge**: How to seemlessly provide data and services in offline situations?
- **Energy Challenge**: How to design mobile Apps with a good balance between features and energy consumption?
- **Usability Challenge**: How to design mobile Apps that run on multiple form factors with optimal usability?
- **Engineering Challenge**: How can we minimize the development effort for Apps while maintaining a high quality?


## Wireless Communication and the Offline Challenge

As outlined earlier, mobile computing, as an enablement of mobile access, comes with the need for information anywhere and anytime. This subsequently creates a need for wireless communication, which is supplied by multiple interleaved technologies:

- Wide Area networks, such as cellular network technologies (such as GSM, EDGE, UMTS, LTE, 5G, ...) provide wide-reaching outdoor connectivity, while the quality of service depends on the locality
- Local area networks provide local connectivity (e.g. WLAN, DECT)
- Personal area networks provide a network between personal nearby devices, while being separated from other networks (e.g. NFC, Bluetooth)

Wireless communication itself contributes other challenges to the ecosystem of mobile computing:

- Multiple interleaved signals potentially interfere with each other, each interference significantly decreases signal quality
- Low data rates due to country-specific regulation and shared media
- High data rates require proportionally more energy to sustain and are proportionally prone to error due to their technical complexity
- Signal degradations due to environmental factors (shadowing, reflection, refraction, scattering) and the inherent signal weakening due to the distance from the access point
- Security issues inherited from the global accessibility
- Heterogeneous access technologies (Bluetooth, GSM, UMTS, ...) imply complex hardware and complex communication processes
- Bandwith limitations due to missing area coverage

As a mobile application developer, only few of these issues can be solved individually, which means that is necessary to **exploit available network resources best in any situation** through anticipation. Reasons for disconnections can be both foreseeable and unforeseeable, so the process of doing this is non-trivial.
The goal is to seemlessly provide data and services in offline situations, by:

- making data and functionality locally available
- tracking changes and creation of new data
- synchronizing data with a well formed backend
- resolving conflicts due to concurrent changes


## Engineering Usability

Due to the high variability of devices in the field of ubiquitous computing, it is important to know all potential device factors and handle them accordingly. For example, a user can interact with touches, a mouse or even through exotic types of hardware such as a trackball. With this in mind, we can advance user interaction through multimodality, which means, that interactions can not only be done sequentially and in separate contexts, but also in parallel. The main focus is really, that the user can concentrate on the task.

Not only do the particular input devices play an important role. Devices also depend on other highly dynamic environmental factors such as noise level, light level or the users movement. Other factors are:

- Changes of devices and connection technology at runtime
- Heterogenity in user requirements (e.g. providing a great user experience for disabled users or simply providing options for personalization)
- Different usage scenarios, tasks and roles


## Energy Consumption

As described earlier, the market for handheld devices is flourishing, because the option to unplug a device and to continue using it, is the essence for mobility. In combination, sustainability is more important then ever before. This is where energy engineering comes into existence as another important component of ubiquitous computing.
Concretely, things like the display, communication and computation itself are the main energy consumers in an application. Through **energy awareness** it is possible to design mobile Apps with a good balance between features and energy consumption.


## Engineering Challenge

Engineers, who work on creating ubiquitous applications are facing multiple other problems, which originate in the heterogenous device market. Not only is it a factor, which input features or computational capabilities are supported, but also the operating system of the device itself, which comes with its own ecosystem of supported UI features, capabilities and distribution mechanics.
The core challenge in engineering an ubiquitous application is to **minimize the development effort for an App while maintaining a high quality**.
