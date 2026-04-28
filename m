Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40942982D
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379781; cv=none; b=g3IQb3WJhaNqxkK6EuaTXY+8b6bAPtLS5F1tGaCdarMdH6aC5RdJGzJgkseb58No3l3mJGcc/e4laoEcVPfQ+rX9W93ecPg7NtQaOZEraDfqV97ABiUqzAzl3GqHWZBKEb9rxuvDj0NqyE5vbEbtMjzfh7zfzuayaK9CEeB5JgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379781; c=relaxed/simple;
	bh=X69l9GghCzig84VzbrMm2BHPRPeJRxO6G7/IsnAkSek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p9uoFbtYEu0SIwWzwsGkinxrr5WoYpNkj7K/NFWvhdFexRh/dW2y3HhhzLn1tfrsrdmUtzo/uT6ros128cB+qxO1ox5JALHQl+CurEIP6M3aP7kVuAxjRMjRrROgsbTy77xBe706XXER8RpABOo0+/TZbSn7z9g1hkhd07jwUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pb3B+j0P; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="pb3B+j0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777379751;
	bh=jqvh4srVGRadazk/+w8FbEbQRHWlZ1QuWcMXIf5AGJE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=pb3B+j0PjpdQYZs0oZSTB6i7kVtq4VxtA4N/2fVS7mOqnKMJ2ZO39MJvDEzzKcNxu
	 uIYWYrgzTxml/GVMfoM01kbblHuaObjfNYssxCY7qBfGSNM6dx/xbSgyosRXbJuWHm
	 nu5leO5RT7jymKuQzyAtSavmcDbHt+oRtWgbIMIM=
X-QQ-mid: zesmtpgz8t1777379735t8d51d75d
X-QQ-Originating-IP: sP5TpiXpiBmu6fGbARsmywNirNY2Xvzl9z7te2Nxs9Q=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 20:35:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14028482282847407414
EX-QQ-RecipientCnt: 5
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] LoongArch: Correct the definitions related to CSR_CPUID_COREID{_WIDTH}
Date: Tue, 28 Apr 2026 20:35:10 +0800
Message-Id: <20260428123510.314073-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nui917t5cXLH/p6JLAuQjfnzC3471IrposUY41V8er/Mh4VHJNwtAZq4
	+RFb2QnR14TLlrsjUl9zgDnplTUrMj18C1Yi8B8Ycm0yfN/RMOyvqKiNEfUmS6vGQ91oiPf
	QAI8eVDlZ0MQINu4Y3gBjoLUFC7DG7LqHUjP57pdo4AYPhRaeF77fXMuh019Ky/VkzmyUsM
	5uslsgYxlPn9qrksYmPiiNWfEmJrordr8+incqcp07JJPguit8TUDcRMwAAQh52UKEiXaVs
	MO+uD9181HC30UnClHTiar4UtowI5l6vcTTMTDouZgcIGWyIUUheU92kQgNsMyCCgbp3xVS
	V3va6phJ90MxMXBTzO283Pi5dUebWxDmXUcF5aphFy8ProLJ9CCxGdVyjwwA0zIQ7+nVnFj
	HTV2IZ7HDCS8axuq29rriUgI+x97wnrIIjqcjiubDOzt8PXZuI073bBsb2NitTFcc3JBuZg
	n+iEGlSowXnFX0+nh3r515mPpnqQ9+/BkyW2OPA2izMyoFwRKjCn/EaW6luwE/vrK+ZMH4z
	z9eLOJskh60YO0JMv4DIxXSXXsUeKdKxFHD/D1tMyM8ijOC84b5eqMBNSjzIGwe9NmoW3K8
	8CQks1m1JHQIaMwNvirhNqsI688gHivaxQlnoMfvD/aFEBSUDeDBAr+5dCM7SoW4KbzVVUw
	bQG41sIJE2JwROcu4sEIhI8y57LqtXvcZ5Qi78Hdz98CBEOjXuL5uA3jMNP3fWrZGs2+Qwn
	TmNVoah5tS5BNJ0WfKKAmX51dOIRx2S6k95QFqy8BxfwGxCbsKS+QlKXWPbHiiyQvviRxv7
	0VDJ4c4KLDUe60lEgCOJ0M8LWfQQJhWRRcvzU/BTeewEuhYivCVE3qJ/1e7pL07q4dCOZPV
	ZEB3GSMl2kk8+YZRiN/LYZqZGBoZz0OFZ+SPXXYX0OLTlR4GzcAJnnAce1a3Te3Zvg49Ah3
	EwV+y7Hozz3K6XnaVU82AZRptHnZQxgW24F5tKA4E1jj5SODuGZLrT/Sf2mWORDzk8Nk35s
	sHs8B2b5rzQUakpDl51nN6HM3elmn4p0ywBgwOraD9ucrstAHhNQyNzHMx1jxf7aNO2Zwmv
	DGW3AudxQ+G
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The valid bits of CPU Identity (CPUID) are 0 to 8
according to LoongArch Reference Manual, so change
11 to 9 for the related code.

Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#cpu-identity

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/loongarch/include/asm/loongarch.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 2a6bc99177d8..bc47df90fee6 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -429,8 +429,8 @@
 
 /* Config CSR registers */
 #define LOONGARCH_CSR_CPUID		0x20	/* CPU core id */
-#define  CSR_CPUID_COREID_WIDTH		11
-#define  CSR_CPUID_COREID		_ULCAST_(0x7ff)
+#define  CSR_CPUID_COREID_WIDTH		9
+#define  CSR_CPUID_COREID		_ULCAST_(0x1ff)
 
 #define LOONGARCH_CSR_PRCFG1		0x21	/* Config1 */
 #define  CSR_CONF1_VSMAX_SHIFT		12
-- 
2.20.1

