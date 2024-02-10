Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93353139F
	for <loongarch@lists.linux.dev>; Sat, 10 Feb 2024 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707525121; cv=none; b=Y22s+huTVsUv3Ru8hrEHpA0JgMbvQrf/QzHkeAflmf7OjDXaDZqKrHpGVb2AWgv4qzWEWqfMfW+XvkFPo6BhxiWq4sT7BCmtCS2pEw4e6yM9WvfIcAFyG9yRp15KQBjAMfNuMLNt5yMZqIwYHVYy0Hwu5dAjKNTJJY3nmbUjgtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707525121; c=relaxed/simple;
	bh=gviCHgZurZtJbesuudoDHrM6YOM41+oHzV9o6JFXP64=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CD80VxaO9pfjpljC5gsrfSDOMV2OLEj9rCHgGLyX7tQ86UE/CaVrF8NOzZH6N3g7S0NhcS+KFllOmGFe1Kfr+eX36VnPzDo3sFBAOBGFqDoPX0cotlACsvJCCVoe8cYNO60w28kbXrCgUuQM7XryDWJA9FMHehxmhN1/X2ic/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qb/6ZPXa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qb/6ZPXa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419NoS8w018298;
	Sat, 10 Feb 2024 00:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=R3fxU4dR0quW3Tgb+gZM
	AiK/XttMGMv+PPJvaz5MUIM=; b=Qb/6ZPXapSRAd2BiJA4PIpzlA7Edht2yC/ZS
	j2d2HrbKjZ8iOckS8krkVr/rcs2JZkzsJLa/H/z0GH/uvkmgI1AYupnqB8f5czkw
	0p35M6OOUK/4VVKHMuH753Jx8zS7TRE9Df5tKkNkDqeXXldspiEk8CEPiSVttTPa
	ywjbZJrY6aDl7mqPnmFuGgzNXEQRL3FZXz0BEQcUQ9HladP+nV4wGcGxf0ZJR/li
	7TncvSvB/OQOCXHeXZCCF5ser7L5Wirnm4dEeY8OtWGAx2G7Ri4/6djz0DqpLU1V
	J8MpEY8whYe1hIZFJ/u8H47N2nojlC3Ko9BCPDWqcbzRh2YYyQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ann2ghp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 00:29:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A0Tmrw025927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 00:29:48 GMT
Received: from th-lint-014.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 16:29:45 -0800
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
To: <chenhuacai@kernel.org>, <jonas@southpole.se>,
        <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
        <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <glaubitz@physik.fu-berlin.de>, <robh+dt@kernel.org>,
        <frowand.list@gmail.com>
CC: <linux-openrisc@vger.kernel.org>, <loongarch@lists.linux.dev>,
        <linux-sh@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        Oreoluwa Babatunde
	<quic_obabatun@quicinc.com>
Subject: [PATCH 2/3] openrisc: Call setup_memory() earlier in the init sequence
Date: Fri, 9 Feb 2024 16:29:30 -0800
Message-ID: <1707524971-146908-3-git-send-email-quic_obabatun@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1707524971-146908-1-git-send-email-quic_obabatun@quicinc.com>
References: <1707524971-146908-1-git-send-email-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vzt-UTEnPBlmTmv7_OrMV4bZE7yhaKr3
X-Proofpoint-GUID: Vzt-UTEnPBlmTmv7_OrMV4bZE7yhaKr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_20,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=730
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100002

The unflatten_and_copy_device_tree() function contains a call to
memblock_alloc(). This means that memblock is allocating memory before
any of the reserved memory regions are set aside in the setup_memory()
function which calls early_init_fdt_scan_reserved_mem(). Therefore,
there is a possibility for memblock to allocate from any of the
reserved memory regions.

Hence, move the call to setup_memory() to be earlier in the init
sequence so that the reserved memory regions are set aside before any
allocations are done using memblock.

Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
---
 arch/openrisc/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/openrisc/kernel/setup.c b/arch/openrisc/kernel/setup.c
index 9cf7fb6..be56eaa 100644
--- a/arch/openrisc/kernel/setup.c
+++ b/arch/openrisc/kernel/setup.c
@@ -255,6 +255,9 @@ void calibrate_delay(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+	/* setup memblock allocator */
+	setup_memory();
+
 	unflatten_and_copy_device_tree();
 
 	setup_cpuinfo();
@@ -278,9 +281,6 @@ void __init setup_arch(char **cmdline_p)
 	}
 #endif
 
-	/* setup memblock allocator */
-	setup_memory();
-
 	/* paging_init() sets up the MMU and marks all pages as reserved */
 	paging_init();
 
-- 
