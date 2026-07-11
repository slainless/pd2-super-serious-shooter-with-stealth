# Super Serious Shooter

A mod that turns the game into a (mediocre) tactical shooter.

While it is not a requirement, it is highly recommended to use [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting) in combination with this.
You may try and use another mod that improves enemy AI (such as REAI, LIES or FSS) which should work fine aswell but the mod is mainly tested with Streamlined Heisting.

This mod doesn't touch your save file, skills or inventory.

## Difference from upstream

This fork brings back skills to restore stealth support and equipment-related upgrades:
- Selectively enabling skills
- Revert bag carry tweak
- Restore default player upgrades:
    - Silent killing when undetected
    - Reenable walk and crouch speed multiplier
    - Reenable carry interact and movement speed multiplier
    - Trip mine sensor
    - Reenable ECM jammer feedback, retrigger, and interaction speed multiplier
    - Revert free silent sentry gun
    - Revert additional asset. Must be unlocked via Sixth Sense
- Unlock Pocket ECM, Smoke Grenade, and Kingpin Injector with cooldown reduction mechanism disabled.

As a consequence, loud heists can benefit from the stealth skills and/or enginering skills all the time since you can practically build a dedicated skillset that picks only the preserved skills. This of course will be quite broken for certain cases, such as skipping saw in favor of nimble (lockpicking) skill in some heist.

### Preserved skills

Skills that affect stealth run, equipment, or cable ties are preserved. The changes, however, are opinionated but it should be easy to tweak via the source code

- Mastermind
    - Medic
        - **Uppers**. Note: Auto apply kit mechanic is disabled.
        - **Combat Doctor**: Extra doctor bag
    - Controller
        - **Forced Friendship** base skill: Extra cable ties
        - **Stockholm Syndrome**: Allow intimidation stealth build
- Enforcer
    - Tank
        - **Transporter** base skill: Allow long bag throw
    - Ammo Specialist
        - **Portable Saw** base skill: Allow secondary saw
        - **Extra Lead**: Extra ammo bag & capacity
        - **Fully Loaded**: Extra ammo capacity
- Technician
    - Engineer
        - **Jack of All Trades**: Allow extra deployable & faster interaction
        - **Tower Defense**: Silent & extra sentry
    - Breacher
        - **Hardware Expert**: Silent drill, drill boost, and tirp mine deploy boost
        - **Drill Sawgeant**: Drill time boost
        - **More Firepower**: Extra trip mine
        - **Kickstarter**: Drill restart bonus
- Ghost
    - Shinobi: Full tree supported
    - Artful Dodger
        - **Parkour**: Bonus movement speed for stealth build
        - **Inner Pocket**: Concealment bonus
    - Silent Killer
        - **Optic Illusions** ace skill: Bonus concealment for silenced weapons
        - **High Value Target**: Marking duration boost. Note: The damage bonus is disabled.

## Player Changes

- All skill and perk deck effects (including most default upgrades) are disabled
- Grace period is practically disabled
- LMGs and Miniguns decrease movement speed while active
- Shotguns deal per-pellet damage
- Ammo pickups are reduced or disabled on special weapons, sniper rifles and some shotgun ammo types
- Piercing weapons deal less damage through shields and walls
- All armors are unlocked by default and their stats have been changed to scale linearly
- Aim punch from being shot is increased
- Revive health decreases with each revive
- Stamina drain from jumping is increased
- Weapon recoil is based on weapon damage and type and increased when hipfiring and reduced when crouching or aiming down sights
- Weapon spread is increased when moving and reduced when standing still, crouching or aiming down sights
- Aim re-centering will only apply to the most recently fired shot
- Insider assets are available for purchase by default
- All bags can be sprinted with

## Team AI Changes

- Bot skills and boosts are disabled
- Bot health is drastically decreased
- Instant health regeneration is changed to slow over-time regeneration
- Hurt animations are enabled for bots

## Enemy Changes

- Enemy amount is reduced
- Special enemies other than Shields are disabled (other specials can still spawn as scripted spawns)
- The "One Down" modifier is replaced with "Special Operation" which re-enables special spawns
- Enemies will only surrender during assault breaks or when they are retreating
- Enemy accuracy is reduced while they move
- Enemy logic update rate is increased
- SWAT turret health is decreased
- Captain Winters is disabled
- Flashbangs no longer play warning sounds or lights
- Teargas bypasses armor and damages health directly
- Sniper lasers are replaced by a glint and bullet tracers
- Shields will use pistols instead of SMGs
