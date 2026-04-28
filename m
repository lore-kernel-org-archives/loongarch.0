Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C133FE36
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348954; cv=none; b=npjRbuQbZD+hTL4H8MqujkGghU3sPZXUgsUfTeJ+CCU3oEmqpp0EjrYrB98tL856sHz+KvFWTvQ+t9iy/576YKFVSlSymCKNsYrAWDUe2MnbTxBwU6ypHgDmCB0izseTCRYNzfWlD8k5AlQv/VsijYLz9lgLN7P08eQP21exObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348954; c=relaxed/simple;
	bh=AFxDVPfqDD1fX+0U3m7t2OJUKJfWgyTTwFDtosrykxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fl7/csL5F9V7GT6fsRQ7qnS6DYgy03WJDTCgDlbCdzkbtR7z77QeEQYpKWlWovIuSdH2lKR2dmS5PQ3xLRaoHW5EDTlBvUzO89nyYPv+1Y4vyPe2f7NjiPKtR0TGJkpe9P5ga+QXr5UQ1JaJaDU4X1OlFm7/wk1lWE1sU6tvkUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=ZsAQE6Zf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="ZsAQE6Zf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c79467f11abso7343124a12.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 21:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777348952; x=1777953752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=ZsAQE6ZfzjMz9AyQ29lco+XiUaan9ZJl+m2HOWSo/Zn2qKfzVXt565jemAwLopsJk1
         FTqHhwTF4S58KiPkCK8CIkfJ+fYlUykkoqgy8q/+pJVpPZZ9rf/QmDcALrsZUMP3cr8J
         FPxmTJo6At6hFDva2C/yAHfePt4+qP6n3AA60TYVWn3fm/NfVDRgPsz1P+lhSW8iQnEm
         fV9X4u1PBWmPlxAbcf8lLfAGcpS6NJ0yRF4fbmM8jjSivZotagMq1EBx2SXZrOybsL4L
         RFDnEmYonhQ5IG5fhAl+AmraZciCYy9UHuPRNhw/iQ4V1FCFFUV6ac+VAAyOJbw9bX6R
         n3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348952; x=1777953752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=J8BDkd4zRfz8UHbvV7GUir2XriaN6sVlutdoh6mgRQIbynUeB+g5xvuGwUmCPVc7M+
         WYPA7Mc6KnTcR4/IjyYcizTMmPaXDl1ca5HPLAl0hQtguu/kW0+JObs7xREBYsp87ok2
         RdE1Xdihl5/XSJwHoxOlngi6qhB8WvtDxhbfq6kUqQPSfSvXwwvS5KPbksqwDD9mLb+q
         LiBI/thJdDNe3LKCHlGBxVUjnfViSMIgTNgUC7qGrwuUC5mU9WfHB/sg79yAsw3sxbBG
         TY6pcCqLDdVrRoew+HqyiQHXNp8kILLBVAEAPNdFzfL8u3hwP/LmSeuLe2OAN5WcVtVk
         A20A==
X-Forwarded-Encrypted: i=1; AFNElJ/BeGp1azmNIFN817ER+ikZrYrT2zXdQ/yf6zKdfnLKWyACONq0/QLfDUc/38+SPyyaKhF10SIHcnk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx53bHXbzEdC+H+9HR3sVYaGegmcFcW0izdWbPR6QgRvaAVPN/k
	YWzLd8qB8m6hSP9mi3zjg7+8dcjpfAyc+ouPL+ORh3lt5DEWdsobwTYbbb1Gbhl9p4dtt5ZUKWX
	Dp56XIiU=
X-Gm-Gg: AeBDiesc2UNACEMzBfxPweWCUcFvrQOiSU885HMwuOSCYEZsWLSyFTlSiIFkXlPGth9
	h0Fm2j7hcOC5OogF9Ul2c/51kcF7M2WWaXnfQfXXmZLHVYq0fr2J6dKG7MUQ1YdXwQ4sDWscVeM
	hDbKoNogo6mgzoHfw0kVWUz3h2ig2/+r4srVLNCcGNkNHRw4TvaY0UH29mfbptJ2torDtR2x9k6
	021+cxBG7NsWtxrHAkFREaJQ3/e0p0/l43gdEI8OOuNsB4k2ccJXnJFPM7USHCeEDf/DJm1MHnL
	6frnkV1K76AYp4JFfc9XcooWN8pnbxO85dmwzwLEyCxFR5wgkCJK8rUE4W5gzjnswWrOfmmv1vO
	oNGrxp6VZlrfJtuyy8ho4ccn/rEdD6rqSJFqza7xFc344TxyXCiej9tWpe7HgZ9vMEY34R7E6dq
	Teyzl1qiYboyAHiSBLKw==
X-Received: by 2002:a17:903:2f43:b0:2b4:5cea:f618 with SMTP id d9443c01a7336-2b97c4064b5mr14219055ad.3.1777348952268;
        Mon, 27 Apr 2026 21:02:32 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cd29sm10131365ad.61.2026.04.27.21.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 21:02:31 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v2 2/2] LoongArch: Skip relocation-time KASLR if it has already been applied
Date: Tue, 28 Apr 2026 12:01:59 +0800
Message-ID: <20260428040159.1065822-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428040159.1065822-1-r@hev.cc>
References: <20260428040159.1065822-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel is relocated during early boot, a randomized load
address may already have been selected and applied. In this case,
performing KASLR again in relocate.c is unnecessary.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..c36604a81d08 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -139,6 +139,10 @@ static inline __init bool kaslr_disabled(void)
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
 
+	/* KASLR is performed during early boot. */
+	if (kaslr_offset())
+		return true;
+
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-- 
2.54.0

