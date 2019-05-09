<?php

use Illuminate\Http\Request;
// Members
use App\Http\Resources\Student as StudentResource;
use App\Http\Resources\StudentFull as StudentFullResource;

// Structure
use App\Http\Resources\Structure\University as UniversityResource;

// Materials
use App\Http\Resources\Materials\Series as SeriesResource;
use App\Http\Resources\Materials\SeriesFull as SeriesFullResource;

use App\Http\Resources\Materials\LectureFull as LectureFullResource;

use App\Http\Resources\Materials\LectureSection as LectureSectionResource;
use App\Http\Resources\Materials\LectureSectionFull as LectureSectionFullResource;

use App\Http\Resources\Materials\Handwriting as HandwritingResource;
use App\Http\Resources\Materials\HandwritingFull as HandwritingFullResource;

use App\Http\Resources\Materials\Recommendation as RecommendationResource;
use App\Http\Resources\Materials\RecommendationFull as RecommendationFullResource;

use App\Http\Resources\Materials\Book as BookResource;
use App\Http\Resources\Materials\BookFull as BookFullResource;

use App\Http\Resources\Materials\Part as PartResource;
use App\Http\Resources\Materials\PartFull as PartFullResource;

use App\Http\Resources\Materials\Exam as ExamResource;
use App\Http\Resources\Materials\ExamFull as ExamFullResource;

use App\Http\Resources\Socialization\Conversation as ConversationResource;
use App\Http\Resources\Socialization\ConversationFull as ConversationFullResource;


use App\Models\Members\Students\Student;

use App\Models\Materials\Series;
use App\Models\Materials\Lecture;
use App\Models\Materials\LectureSection;
use App\Models\Materials\Handwriting;
use App\Models\Materials\Recommendation;
use App\Models\Materials\Book;
use App\Models\Materials\Part;
use App\Models\Materials\Exam;
use App\Models\Members\Students\Socialization\Conversation;

use App\Models\Structure\University;
?>
