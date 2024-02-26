Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1771CA8E
	for <loongarch@lists.linux.dev>; Mon, 26 Feb 2024 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708934680; cv=none; b=e+/MGDJI7vYocavNYw7h7wnvcgiRRnUKj8nM99MSb4Oa+XH/rs8FuEaXcv5Ta3QllEt+3RLXZhmGwL9DK9cYllnmz28RNnKxPY1jWdOmTATVhxlfoMCxhCObynWTloVbBLhoGumLSp6P7KoW2sh+4ueaTETzsmAGMAN0ZnyLZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708934680; c=relaxed/simple;
	bh=dN3E446p7hva0FnMIQ6NFdYTCxG7DQq3CBiJFrGa6Ew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJwIekTStZlqtCVZErlx8DZCGFnE19yQETtVGv5x60YR2ivXxaxNmpB8FtSSanf0cgd0mTc99UiOpmuEUHlxXHDsm+ULJ8SiwU51WrAfGYiuw97EIVQY0VaOWAdjS6KaS+YY6B/bEDOF1lVCZY0IkQH426CcwHrRf2G/lr1Ep5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtp86t1708934613towayw64
X-QQ-Originating-IP: cPL1Ck3yLJrKvXVPFv3NE+RF3uFMoNuGQ35pxT3KDRM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Feb 2024 16:03:31 +0800 (CST)
X-QQ-SSF: 01400000000000C0B000000A0000000
X-QQ-FEAT: RrZlkntZBflMICK+qs6fwIpCV2d/qsk9tQTFhoQEIKaT681VwUo/mZi9pW5Ep
	k5lwP9mwmvUt2QBdS310uRcAPLffXOPehuc42UEt/wCNHf+/7u8S45VGzlTcfGHC23d3E75
	vqpTuSj1AtuHvx/0sh5Mv4ezn6qFXRJBaSW4RVk3qrzHe4RKByXHxB0bNB25Leq7ft2oO0A
	OGP64dY2zxxCOYhS+KkycSsm7LU+AcvDyKppNaUg4Uv70uUBpEADPbHuCL9oN8f0N9x429u
	fjMZ8NzlJx7PAc47q1mFwtN4pzGlPMH98oLm+LOzIIV/MKj/TiHz/jBOFIHhNWRA4SRjcS4
	ta28ykuSow/hEtK+tkdFQPPVFOb7Ohg7xHU/sJcbCmHyjKDwUDpwfymOCMa1AAFXtx+bHOM
	cjoCqCmgnl5yIl8+2CTISg==
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7263635772186819798
From: WangYuli <wangyuli@uniontech.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: linux-crypto@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyuli@uniontech.com>,
	Guan Wentao <guanwentao@uniontech.com>
Subject: [PATCH] loongarch/crypto: Clean up useless assignment operations
Date: Mon, 26 Feb 2024 16:03:28 +0800
Message-Id: <20240226080328.334021-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Both crc32 and crc32c hw accelerated funcs will calculate the
remaining len. Those codes are derived from
arch/mips/crypto/crc32-mips.c and "len -= sizeof(u32)" is not
necessary for 64-bit CPUs.

Removing it can make context code style more unified and improve
code readability.

Suggested-by: Guan Wentao <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/loongarch/crypto/crc32-loongarch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/crypto/crc32-loongarch.c b/arch/loongarch/crypto/crc32-loongarch.c
index a49e507af38c..3eebea3a7b47 100644
--- a/arch/loongarch/crypto/crc32-loongarch.c
+++ b/arch/loongarch/crypto/crc32-loongarch.c
@@ -44,7 +44,6 @@ static u32 crc32_loongarch_hw(u32 crc_, const u8 *p, unsigned int len)
 
 		CRC32(crc, value, w);
 		p += sizeof(u32);
-		len -= sizeof(u32);
 	}
 
 	if (len & sizeof(u16)) {
@@ -80,7 +79,6 @@ static u32 crc32c_loongarch_hw(u32 crc_, const u8 *p, unsigned int len)
 
 		CRC32C(crc, value, w);
 		p += sizeof(u32);
-		len -= sizeof(u32);
 	}
 
 	if (len & sizeof(u16)) {
-- 
2.33.1

