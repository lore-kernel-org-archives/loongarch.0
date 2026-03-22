Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A88A3B7A8
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159378; cv=none; b=dJKP3w+Xrq+GhVK3Sb8XjdWMcYjRE4dltDaaqAqP3VOGvD7K04wXid/z2+A8KJkUbgsZvvnPNwugJVv0x/7KC7QDcmdYkavSlCNwVtm3hZsNtHSFTqY/buDPrw+TEOu4mbo4rv/cVL0FYy/VIE0K6aSwOpFc/IOa2z1LR5W947k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159378; c=relaxed/simple;
	bh=XPf328qGFEw1pVlLXZ5y8Tx2mnF8Iq/bSTQuF6C/VYw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MVJQTPKuaWq/dZadMdSzMceAbslD8AifM+Y2kmDYTwh/MRSPKinsz0jZfKglKV/cO3G/ml/p3NumV7rdPKSQQ4pUrPxwqju5ADywMPznK6rmbZgMrCVoNfNXlnG+Ex1KO1Ex01WH8/BeN03fMl2Izkf+TEEngHfXybR8lQBqGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Fd2eF4qx; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Fd2eF4qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774159373; bh=Cmi5rfP0n2HgPLfCpAiQMoYzVU4WPdtQAl7hGiIhsV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fd2eF4qxgRN5HfAnoSgoBXX5YxdT6KhCTBPcvmDAus1dy3MGG8C+9dDiaeb4k8O6u
	 zS2SdWm9mcys26KTeGg7aePxwQNShJhyyjiv+3B7P/E0ZqekjhYpmaFGI1pMGfOgy1
	 iEr31syH2UT0cxwGXJcwWhJ7dTSz7nVfSWJm0WJk=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id B100A4A; Sun, 22 Mar 2026 14:02:49 +0800
X-QQ-mid: xmsmtpt1774159370t6jbvixgv
Message-ID: <tencent_C610B05A3579D6EC823515607AE5F526CD05@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuoJxuK2QvNBF6dVvvdBNzVBF8svnHLOBI/qpbL1Hcn5V4SoWv5A
	 MEkiZGSmOu4R8sK33uqFkcJ/dWUZdvoGtHiPfumrSmRjj8zsIJ+7vs7pwOpbTrtHxqvJC1BP8S8F
	 2TDI6FkffK2dHqs0kyA7YKPbYScy52SU5Ur2wn5hxR39RN22jOw/T0eCeJcds5+QQszjJp8SeATK
	 MUK1rEoV/oU/8bIjHeRMJvwFV1RYQF4qhgIMb7mQhRNzfxTJamGfrRM4w+2SNWtfmwdBVzsXvE1d
	 JDNHY+93WREPTjoqypnGH1nFk7p1QiCmKd8C4T9k//6Q4rrnaf1Ci5rhz9xrodJCxkt2ELK63p9p
	 7Vkv2k8cYw0Ujr4JtwZ72tKDz8xSplDfLH173QUrNB9jsZvUA2B8ZtDGqNFnmNGgecRjXZjEQze8
	 zom89Wj+5CV8MorY+yXo36JGB7ts/C3tuZhOmCBb5YJB5q8YLfU3eelr1S3Oktsm/Mc9IZNoZlGh
	 ITAWsgRKyw5dw/pDvWiRd4mQhxzgEtnYQ+0mup5OCKgw/Wthn4U1ikhBKqN/SxlN46vyVF9eCr5J
	 gzVBYTlIEpwLsO9OTdoWfS5g+txcQlwZgf5sE9/yaYCBe6cqH2pLfDJldE1geKOhGxybgH4J4Nif
	 fLzU2QtTdjO47rLjpcGiaX1jhuFn4/fyQKMqFnzcxMXYQJ0REAP4FbW1PLyX+X9j77ir0CB255oj
	 NBAMzY1p+aig88Q4RkKlVB61oQ9cFJaCCCwLh4Mt7Sg0yDAvJNYdbmuBV/1Z633ls/2yAdZB1LAl
	 aDL6sm/4ls4XGf3vIYRKdLpk4g+6/OGtj+i5tG35+bagBxRfheP8Z5HJ7r/SfJBoPifqs5P3wXHF
	 Mjr6qh9YFRm15ebzGfkVLFVV4TAQO19534+Xa3H4couM7G3SuqCnD9F7U6vWHaif/AgptFs6Ycx1
	 O/dZGGSV9wHrzQ8O5JObuZYz2pmr+o4DIA4+jJZV37VIz4o6yI6YjphLwezZz3mCIPao3X86SZ0n
	 GxPlCz4IG/IDQj7mvl8YSslBbSK9e4etQPmVhmGyXUDGzt9achfaV5VqOmNIVjOUdPgmmhDTpLBf
	 sww28CiORydsaZBpM9nQIwKBy0/g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v3 1/2] dt-bindings: loongarch: Add Loongson-2K0300
Date: Sun, 22 Mar 2026 14:02:45 +0800
X-OQ-MSGID: <20260322060246.1375569-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322060246.1375569-1-wjjsn@qq.com>
References: <20260322060246.1375569-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 Documentation/devicetree/bindings/loongarch/loongson.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index e1a4a97b7576..8bea8b9f75b1 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -14,6 +14,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: Loongson-2K0300 processor based boards
+        items:
+          - const: loongson,99pi
+          - const: loongson,ls2k0300
       - description: Loongson-2K0500 processor based boards
         items:
           - const: loongson,ls2k0500-ref
-- 
2.43.0

