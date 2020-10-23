import React from 'react'

//import css
import classes from './ProjectsList.module.css';

//import component
import ProjectCard from '../ProjectCard/ProjectCard';

//import project data
import {ProjectData} from '../ProjectData';

const ProjectsList=()=> {
  const renderList = ProjectData.map((data,index)=>{
    if(index%2===0){
      return <ProjectCard key={data.id} order={true} cardHeader={data.name} cardTags={data.tags} cardText={data.description} links={data.links} image={data.image} /> 
    }
    return <ProjectCard order={false} key={data.id} cardHeader={data.name} cardTags={data.tags} cardText={data.description} links={data.links} image={data.image}/>
  })
  return (
    <div className={classes.ProjectsList}>
      <div className={classes.Container}>
        {renderList}
      </div>
    </div>
  )
}

export default ProjectsList
