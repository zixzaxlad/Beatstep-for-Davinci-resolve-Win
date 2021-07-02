# Shift layer to MIDI controller

## Rules

```
//When gc=1 then execute reset hue
//When gc=0 then execute soften hue
if gc==0 then exit rules, skip Outgoing Action
```
```
//When gc=1 then execute reset hue
//When gc=0 then execute soften hue
if gc==1 then exit rules, skip Outgoing Action
```
## Outgoing

Mouse button clicks
Set mouse position

# Shift key on

## Incoming
Note ON

##Rules
```
gc=0
```

##Outgoing
None


# Shift key off

## Incoming
Note ON

##Rules
```
gc=1
```

##Outgoing
None


# Shift key toggle

## Incoming
Note ON

##Rules
```
//Toggle Exxclusive OR function
gc=gc^1
//Above is toggle and could also be done this way
//if gc==0 then pp=1
//if gc==1 then pp=0
//gc=pp
```

##Outgoing
None