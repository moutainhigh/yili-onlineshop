package com.fushionbaby.cms.controller.sku.excel;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.fushionbaby.cms.dto.OrderDto;
import com.fushionbaby.cms.dto.SkuInfoDto;
import com.fushionbaby.cms.util.ExportExcelUtils;
import com.fushionbaby.common.util.date.DateFormat;

/**
 *  订单导出Excel
 * @author 张明亮
 */
public class SkuInfoExcelReport {
	
	/**
	 * 导出Excel
	 * @throws IOException 
	 */
	public void getReport(String fileName,List<SkuInfoDto> listDto,HttpServletResponse response) throws IOException{
		ExportExcelUtils.setHeader(response, fileName);
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("商品信息");
		
		sheet.setColumnWidth(((short)0), (short)(8*256));
		sheet.setColumnWidth(((short)1), (short)(25*256));
		sheet.setColumnWidth(((short)2), (short)(25*256));
		sheet.setColumnWidth(((short)3), (short)(25*256));
		sheet.setColumnWidth(((short)4), (short)(25*256));
		sheet.setColumnWidth(((short)5), (short)(15*256));
		sheet.setColumnWidth(((short)6), (short)(15*256));
		sheet.setColumnWidth(((short)7), (short)(25*256));
		sheet.setColumnWidth(((short)8), (short)(10*256));
		sheet.setColumnWidth(((short)9), (short)(10*256));
		sheet.setColumnWidth(((short)10), (short)(15*256));

		HSSFCellStyle centerStyle = ExportExcelUtils.createTextStyle(wb);
		centerStyle.setBorderTop(HSSFCellStyle.SOLID_FOREGROUND);
		centerStyle.setBorderLeft(HSSFCellStyle.SOLID_FOREGROUND);
		centerStyle.setBorderBottom(HSSFCellStyle.SOLID_FOREGROUND);
		centerStyle.setBorderRight(HSSFCellStyle.SOLID_FOREGROUND);
		centerStyle.setTopBorderColor(HSSFColor.BLACK.index);
		centerStyle.setLeftBorderColor(HSSFColor.BLACK.index);
		centerStyle.setRightBorderColor(HSSFColor.BLACK.index);
		centerStyle.setBottomBorderColor(HSSFColor.BLACK.index);
		centerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		HSSFCellStyle leftStyle = ExportExcelUtils.createTextStyle(wb);
		leftStyle.setBorderTop(HSSFCellStyle.SOLID_FOREGROUND);
		leftStyle.setBorderLeft(HSSFCellStyle.SOLID_FOREGROUND);
		leftStyle.setBorderBottom(HSSFCellStyle.SOLID_FOREGROUND);
		leftStyle.setBorderRight(HSSFCellStyle.SOLID_FOREGROUND);
		leftStyle.setTopBorderColor(HSSFColor.BLACK.index);
		leftStyle.setLeftBorderColor(HSSFColor.BLACK.index);
		leftStyle.setRightBorderColor(HSSFColor.BLACK.index);
		leftStyle.setBottomBorderColor(HSSFColor.BLACK.index);
		leftStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		leftStyle.setWrapText(true);
		this.createHead(wb,sheet);
		
		//填充数据
		int rowNum = 1;
		int seqno=0;
		for(SkuInfoDto skuInfoDto:listDto){
			int cellType = HSSFCell.CELL_TYPE_STRING;
			seqno++;
			HSSFRow row = sheet.createRow(rowNum++);
			ExportExcelUtils.createCell(row,0, centerStyle,cellType,seqno);//序号
			ExportExcelUtils.createCell(row,1, centerStyle,cellType,skuInfoDto.getCode());//商品编码
			ExportExcelUtils.createCell(row,2, centerStyle,cellType,skuInfoDto.getName());//商品名称
			ExportExcelUtils.createCell(row,3, centerStyle,cellType,skuInfoDto.getBarCode());//商品条码
			ExportExcelUtils.createCell(row,4, centerStyle,cellType,skuInfoDto.getColor());//颜色
			ExportExcelUtils.createCell(row,5, centerStyle,cellType,skuInfoDto.getSize());//尺寸
			
			ExportExcelUtils.createCell(row,6, centerStyle,cellType,skuInfoDto.getCategoryName());//分类
			
			ExportExcelUtils.createCell(row,7, centerStyle,cellType,skuInfoDto.getBrandName());//品牌
			
			ExportExcelUtils.createCell(row,8, centerStyle,cellType,skuInfoDto.getCostPric());//进价
			
			ExportExcelUtils.createCell(row,9, centerStyle,cellType,skuInfoDto.getCurrentPrice());//现价
			ExportExcelUtils.createCell(row,10, centerStyle,cellType,skuInfoDto.getAladingPric());//会员价
		}
		
		//导出
		ExportExcelUtils.release(response, wb);
	}
	
	/**
	 * 创建标题列
	 * @param sheet
	 * @param headStyle
	 * @param resources
	 */
	private void createHead(HSSFWorkbook wb,HSSFSheet sheet){
		HSSFCellStyle boldStyle = ExportExcelUtils.createBoldStyle(wb);
		boldStyle.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);//前景颜色
		boldStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//填充方式，前色填充
		boldStyle.setBorderTop(HSSFCellStyle.SOLID_FOREGROUND);
		boldStyle.setBorderLeft(HSSFCellStyle.SOLID_FOREGROUND);
		boldStyle.setBorderBottom(HSSFCellStyle.SOLID_FOREGROUND);
		boldStyle.setBorderRight(HSSFCellStyle.SOLID_FOREGROUND);
		boldStyle.setTopBorderColor(HSSFColor.BLACK.index);
		boldStyle.setLeftBorderColor(HSSFColor.BLACK.index);
		boldStyle.setRightBorderColor(HSSFColor.BLACK.index);
		boldStyle.setBottomBorderColor(HSSFColor.BLACK.index);
		boldStyle.setWrapText(true);
		
		HSSFRow headRow = sheet.createRow(0);
		int cellType = HSSFCell.CELL_TYPE_STRING;
		ExportExcelUtils.createCell(headRow,0, boldStyle,cellType,"序号");
		ExportExcelUtils.createCell(headRow,1, boldStyle,cellType,"商品编码");
		ExportExcelUtils.createCell(headRow,2, boldStyle,cellType,"商品名称");
		ExportExcelUtils.createCell(headRow,3, boldStyle,cellType,"商品条码");
		ExportExcelUtils.createCell(headRow,4, boldStyle,cellType,"颜色");
		ExportExcelUtils.createCell(headRow,5, boldStyle,cellType,"尺寸");
		ExportExcelUtils.createCell(headRow,6, boldStyle,cellType,"分类");
		ExportExcelUtils.createCell(headRow,7, boldStyle,cellType,"品牌");
		ExportExcelUtils.createCell(headRow,8, boldStyle,cellType,"进价");
		ExportExcelUtils.createCell(headRow,9, boldStyle,cellType,"现价");
		ExportExcelUtils.createCell(headRow,10, boldStyle,cellType,"会员价");
	}
}
