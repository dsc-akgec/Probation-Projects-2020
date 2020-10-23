import React from "react";

//import css
import classes from "./TeamList.module.css";

//import component
import TeamMember from "../TeamMember/TeamMember";

//import DataFile
import { TeamData } from "../TeamData";

const TeamList = () => {
  const fourthYearList = TeamData.map((member) => {
    if (member.year === 4) {
      return (
        <TeamMember
          key={member.id}
          cardName={member.cardName}
          cardDesignation={member.cardDesignation}
          image={member.image}
          links={member.links}
          domain={member.domain}
        />
      );
    }
    return null;
  });

  const thirdYearList = TeamData.map((member) => {
    if (member.year === 3) {
      return (
        <TeamMember
          key={member.id}
          cardName={member.cardName}
          cardDesignation={member.cardDesignation}
          image={member.image}
          links={member.links}
          domain={member.domain}
        />
      );
    }
    return null;
  });

  return (
    <div className={classes.TeamList}>
      <div className={classes.section}>
        <h1 className={classes.teamListHeader}>Members from 4th Year</h1>
        <div className={classes.listContainer}>{fourthYearList}</div>
      </div>
      <div className={classes.section}>
        <h1 className={classes.teamListHeader}>Members from 3rd Year</h1>
        <div className={classes.listContainer}>{thirdYearList}</div>
      </div>
    </div>
  );
};

export default TeamList;
