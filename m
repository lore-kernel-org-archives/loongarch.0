Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB95B699
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054437; cv=none; b=pY5PKMeffIKS/F3oObLB1uiXWWmhPo2yyHLVMEWhNlibVAx436XJ1eHqV8PCWfmUkpblqUpWOOWxixbl8LYuLD6bKPZs7O8/hM1qNK7zvtjEOCApV2JTv6lODSSXbIWU1Rivk+U9Y58YE2mlb1jSGPTS9pdLuuCLbyCzSay+IBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054437; c=relaxed/simple;
	bh=zlkeU6jpjojNIbiATur5Go6ZRJPdDmGjYR+bSmWYh/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ioAI1rZDTCcLKMDj636r4aDp4AsGO2G4NuCnu4LKHF3QEWVWYvEu/GsT+OT2m77ugJSSc1wunP6Zgu0clUuRObkKcwy4j0Eup+zsIHWBOabhtP14XV5wd6ERmZWAICqGIny4lOqnuuzJagwr2YtBFv6LSKbUs5/AzYIYSFbAy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtp87t1712054393t2i27laa
X-QQ-Originating-IP: pQTYK67xRdtnui0t3nN3/WaiLvBKI0ftL7JGDsgYtec=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Apr 2024 18:39:51 +0800 (CST)
X-QQ-SSF: 01400000000000G0G000000A0000000
X-QQ-FEAT: SX/WFj88WPXNfEQ5MBA40yVv9m/8TTEpOkDjsxEXYeDgJs8qCxwvtxlXfQmgS
	hRixDCy/B7Rld6Pa40LS/5KOHlSl6Z4305rQDo5t5Ew5YQSdLfuOD9v4GgzqT8PoAQkI6b0
	ZxHfASTynNFv5EJ5b8kgeNPtHwwGT9sDMCQHQoX2NNiyd80YMolKd2X8hV6HR2Gvb5YKLMO
	hs6iVbQsansRA3TyxaMDypBzxZZGDwUzUIPRznW1hamuy1Sn0bhC7LmLhJAto9yfB1edcUt
	PJKHrYp0Z1CHV03vSityjlXXkhQPf7CH1SaMK88/Ahw81vEo+CeG8sVE5mHJLLAMsrT0OcF
	EEAqIEY5+IebYp6gYt466UcVocI8U1QchuoUF/LdOWcsNZuyxL7zeG0MvpUy66ddnt3QNYB
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9711682065161928136
From: Wentao Guan <guanwentao@uniontech.com>
To: zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>,
	Yuli Wang <wangyuli@uniontech.com>
Subject: [PATCH] LoongArch: KVM: Remove useless MODULE macro for MODULE_DEVICE_TABLE
Date: Tue,  2 Apr 2024 18:39:42 +0800
Message-Id: <20240402103942.20049-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-1

MODULE_DEVICE_TABLE use ifdef MODULE macro in module.h,
just clean it up.

Suggested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/kvm/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 86a2f2d0cb27..7f2bd9a0814c 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -410,10 +410,8 @@ static void kvm_loongarch_exit(void)
 module_init(kvm_loongarch_init);
 module_exit(kvm_loongarch_exit);
 
-#ifdef MODULE
 static const struct cpu_feature kvm_feature[] = {
 	{ .feature = cpu_feature(LOONGARCH_LVZ) },
 	{},
 };
 MODULE_DEVICE_TABLE(cpu, kvm_feature);
-#endif
-- 
2.20.1

