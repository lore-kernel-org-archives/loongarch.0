Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795580145;
	b=x1BRjrOIEXosXa8YNIzsL0Pt1IRa8WXzZEjEmObFOJxjcfGXdmwa0hDVJ0SyIISUOKzA
	 +QciPpc/NSR2E2hPPrTgTdIX6Kmt6k919RVgvfjKk7aZzdSPyk3H0WeC/rUe1Qpakq2Np
	 yAmMs+W1Ik3gnXxgBoR1xFYh64/se8RWhiIF4Zm5Z+2g3W2hXpwtMjgQhTt0N5B8U7bxR
	 sT5H2RwqXujk92oNMwElHwOeQ5xQObLHNH8xX89DNelgzKdcChMfIfdBZrOW2rT4BNUbl
	 sBJGCRJ8W6Amvg5dLduOvo+cwT9qZz5Vr7KPplzCQ3bdihp077+Z0uCkVW3Ul5J8zRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580145;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=pFAx7qQojwr0lrhab2y8yFDQk42crxk3XlNNA9FGuYc=;
	b=xoRwN3LRC0GqrTqPYHYWWHlGqH3sz33cfOtcFIpmuPJXYuK81DlryHs7z9aXWZAgirlt
	 FnAQXBrXRaq04WQGNv0Ko943YPhw/2tt8Dco65JV2XRNvYF8T7bSctLQkAaONUS/2M9MJ
	 xG1sug4m6Fz0whbaHgB5CalI14wUrkdny4NhOCj1UTvCQQTodgyWJggNlvCPoWXScblaT
	 ErldlJpvo3AA8HF4GLLhmj6ZR6DzkSrT/WQSEPkgQT9DxH87f+Mr/e5vohd+8O/tpQmI9
	 tGiiM0HPNSmXUhiJmm5l1fk8Ytw8fsB0gZ4EsJ2TyFuEumQLeGcWWrnzY3f7SoUdxjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=hanbings.io;
	spf=pass smtp.mailfrom=hanbings.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E422606A335
	for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 04:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E422606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hanbings.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hanbings.io
ARC-Seal: i=1; a=rsa-sha256; t=1795580125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QIZXX/SaEb1uIXYQTEADwWnMcUh6scrrxNSwNGWcmWap9AvysIEKhPVL+ToUJm0Pu/ez7vkY6kni6DYBz2c1O2flwalFSwYlJlNxMTClHrKlSq43zRnoVGexP4VVDzXeoEfHUJ/xfcyNgIYftvnXiMIHs9oU4NwC/sBXlTmaAuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795580125; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pFAx7qQojwr0lrhab2y8yFDQk42crxk3XlNNA9FGuYc=; 
	b=msZBfiXGEVXW3c88Pp0zfgc8Z761KOgKBlIFkPrhZdbfQ5DOwgJYD3WTZRMhKloHRShE2XJOj1TeurAp03a8mD7kmIiUfaNQGTq7oajxUtGaW9IQV6U0gH2+ZLJWZF8jT3MQIEIZAJaiWEPCJwjJUrbWKI/+8rwxb77XUDRmNYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hanbings.io;
	spf=pass  smtp.mailfrom=hanbings@hanbings.io;
	dmarc=pass header.from=<hanbings@hanbings.io>
DKIM-Signature: a=rsa-sha256; b=PI8DRbswv2SbxB2N0iWYoOi85M7b72Oc2gVubrWEJBhoiLrmm6bg8DvjASpXz/4alXqx3zfkyHHDjNOdNo1mYiZxBe1P6ZH/ON021vJfJsOOwRo+BCdqd3yXLGWFGVW3EhN0SJREbylg/F5s9JdzKBg5udjwFSNHFxhQ4z2wFNQ=; c=relaxed/relaxed; s=zmail; d=hanbings.io; v=1; bh=pFAx7qQojwr0lrhab2y8yFDQk42crxk3XlNNA9FGuYc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795580117993364.48635298628324;
	Tue, 24 Nov 2026 20:15:17 -0800 (PST)
From: Xuanlin Chen <hanbings@hanbings.io>
To: Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: Fix off-by-one in bt_address() exception vector check
Date: Wed, 25 Nov 2026 12:15:14 +0800
Message-ID: <20261125041514.2431377-1-hanbings@hanbings.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

EXCCODE_INT_END names the last valid interrupt exception code, not an
exclusive upper bound.  Since INT_AVEC is 14:

    EXCCODE_INT_NUM = INT_AVEC + 1 = 15
    EXCCODE_INT_END = EXCCODE_INT_START + EXCCODE_INT_NUM - 1 = 78

trap_init() installs handle_vint for vectors 64 through 78 inclusive,
and the switch in bt_address() also maps types up to EXCCODE_INT_END
inclusive.  But the range check uses:

    ra < eentry + EXCCODE_INT_END * VECSIZE

which stops at the start of vector 78, so an address in the last
interrupt vector is never translated.  For example, eentry + 78 *
VECSIZE + 0x154 is rejected instead of being mapped to handle_vint +
0x154.

The off-by-one has existed since the ORC unwinder was added; at that
time EXCCODE_INT_END was 77, so vector 77 was excluded.  After AVEC
support made vector 78 the last interrupt vector, vector 78 is the one
that is excluded.  Before commit 4cd641a79e69 ("LoongArch: Remove
unnecessary checks for ORC unwinder"), this silently ended the unwind.
Since that commit, bt_address() returns 0 and unwind_next_frame()
logs:

    cannot find unwind pc at ...

Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
Cc: stable@vger.kernel.org
Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Xuanlin Chen <hanbings@hanbings.io>

---
Changes in v2:
- Update the author and Signed-off-by.
- Add Tiezhu's Reviewed-by and Tested-by.

 arch/loongarch/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 9cfb5bb19..784edf6a7 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -366,7 +366,7 @@ static inline unsigned long bt_address(unsigned long ra)
 	}
 #endif
 
-	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
+	if (ra >= eentry && ra < eentry + (EXCCODE_INT_END + 1) * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
 		unsigned long offset = (ra - eentry) % VECSIZE;
-- 
2.54.0
