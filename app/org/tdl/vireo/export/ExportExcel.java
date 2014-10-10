package org.tdl.vireo.export;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.tdl.vireo.model.Submission;

/**
 * A deposit package contains all the information necessary for a depositor to
 * submit the submission to a remote repository. This class is build by a
 * packager and consumed by a depositor.
 * 
 * @author <a href="http://www.scottphillips.com">Scott Phillips</a>
 * @author Gad Krumholz ( gad.krumholz@austin.utexas.edu )
 */
public interface ExportExcel {

	/**
	 * @return The submission from which this package was derived.
	 */
	public Submission getSubmission();
	
	/**
	 * The mimetype of the packaging format. If the package is a single file,
	 * then a mimetype should be returned. Such as application/zip. However the
	 * common case is an amalgamation of multiple file types in a directory. In
	 * this case the mimeType should be null.
	 * 
	 * @return The mimetype
	 */
	public String getMimeType();

	/**
	 * A descriptor of the format used. This may very widely between
	 * repository implementations. For DSpace items packaged using METS, the
	 * format is: http://purl.org/net/sword-types/METSDSpaceSIP
	 * 
	 * @return The format
	 */
	public String getFormat();

	/**
	 * @return A {@link XSSFWorkbook} pointer to the package. 
	 */
	public XSSFWorkbook getWorkbook();
	
}